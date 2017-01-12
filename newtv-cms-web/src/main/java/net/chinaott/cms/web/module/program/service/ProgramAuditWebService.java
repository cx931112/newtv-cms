package net.chinaott.cms.web.module.program.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import lombok.extern.slf4j.Slf4j;
import net.chinaott.cms.core.basicinfo.repository.mybatis.PublishCdnRefMyBatisDao;
import net.chinaott.cms.core.log.entity.ProgramAudit;
import net.chinaott.cms.core.log.repository.ProgramAuditDao;
import net.chinaott.cms.core.program.entity.CdnTask;
import net.chinaott.cms.core.program.entity.Program;
import net.chinaott.cms.core.program.repository.CdnTaskDao;
import net.chinaott.cms.core.program.repository.ProgramBitrateDao;
import net.chinaott.cms.core.program.repository.ProgramDao;
import net.chinaott.cms.core.programseries.entity.ProgramSeries;
import net.chinaott.cms.core.programseries.entity.ProgramSeriesRel;
import net.chinaott.cms.core.programseries.repository.ProgramSeriesDao;
import net.chinaott.cms.core.programseries.repository.ProgramSeriesRelDao;
import net.chinaott.cms.core.system.repository.SystemConfigDao;
import net.chinaott.cms.web.common.constant.Constant;
import net.chinaott.cms.web.utils.PageUtil;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ysten.utils.string.StringUtil;


@Service
@Transactional
@Slf4j
public class ProgramAuditWebService
{
    @Autowired
    private ProgramDao programDao;
    
    @Autowired
    private SystemConfigDao systemConfigDao;
    
    @Autowired
    private ProgramAuditDao programAuditDao;
    
    @Autowired
    private ProgramBitrateDao programBitrateDao;
    
    @Autowired
    private ProgramSeriesRelDao programSeriesRelDao;
    
    @Autowired
    private ProgramSeriesDao programSeriesDao;
    
    @Autowired
    private CdnTaskDao cdnTaskDao;
    
    @Autowired
    private PublishCdnRefMyBatisDao publishCdnRefDao;

    public Page<Program> getProgramListByStatus(Map<String, Object> searchParams, int pageNumber, int pageSize)
    {
        PageRequest pageRequest = PageUtil.buildPageRequest(pageNumber, pageSize);
        Specification<Program> spec = PageUtil.buildSpecification(searchParams, Program.class);
        Page<Program> page = programDao.findAll(spec, pageRequest);
        List<Program> programList = page.getContent();
        for(Program program : programList){
            List<String> programSeriesNameList = new ArrayList<String>();
            List<ProgramSeries> programSeriesList = programSeriesDao.findByProgramId(program.getProgramId());
            for(ProgramSeries series : programSeriesList){
                programSeriesNameList.add(series.getProgramSeriesName());
            }
            program.setProgramSeriesNameList(programSeriesNameList);
        }
        return page;
    }

    public void audit(List<Long> programIds, Integer status, String auditDesc, String userName)
    {
        // 审核通过，分发到CDN
        if(status.equals(Constant.AUDIT_PASS)){
            programDao.updateStatus(programIds, Constant.DISPATHING, userName);
            // 保存要下发cdnTask
            CdnTask task = null;
            for(Long programId : programIds){
                task = new CdnTask();
                Program program = programDao.findOne(programId);
                List<ProgramSeriesRel> programSeriesRel = programSeriesRelDao.findByProgramId(programId);
                if(CollectionUtils.isNotEmpty(programSeriesRel)){
                    ProgramSeries programSeries = programSeriesDao.findOne(programSeriesRel.get(0).getProgramSeriesId());
                    if(programSeries!=null){
                        task.setProgramSeriesId(programSeries.getProgramSeriesId());
                        task.setProgramSeriesName(programSeries.getProgramSeriesName());
                    }
                }
                task.setProgramId(programId);
                task.setProgramName(program.getProgramName());
                task.setSetNumber(program.getSetNumber());
                task.setCreateTime(new Date());
                task.setTaskType(1);
                task.setStatus(0);
                String platformIds = getPublishFormIds(program.getPublishPlatformIds());
                task.setPlatformId(platformIds);
                cdnTaskDao.save(task);
            }
        }else{
            programDao.updateStatus(programIds, Constant.CHECKUPNOPASS, userName);
        }
        // 记录审核日志表信息
        ProgramAudit audit = null;
        for(Long programId : programIds){
            Program program = programDao.findOne(programId);
            audit = new ProgramAudit();
            audit.setAuditDesc(auditDesc);
            audit.setAuditUser(userName);
            audit.setStatus(status);
            audit.setProgramId(programId);
            audit.setProgramName(program.getProgramName());
            programAuditDao.save(audit);
        }
    }

    private String getPublishFormIds(String publishPlatformIds)
    {
        String publisFormIds = "";
        List<Long> publistPlatformIdList = StringUtil.splitToLong(publishPlatformIds, ";");
        if(CollectionUtils.isNotEmpty(publistPlatformIdList)){
            publisFormIds = publishCdnRefDao.findPublishFormIds(publistPlatformIdList);
        }
        return publisFormIds;
    }

    public Program getProgramByProgramId(Long id)
    {
        return programDao.findOne(id);
    }

}
