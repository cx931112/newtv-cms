package net.chinaott.cms.web.module.log.service;

import net.chinaott.cms.web.log.entity.OperationLog;
import net.chinaott.cms.web.log.entity.OperationType;
import net.chinaott.cms.web.log.repository.OperationLogDao;
import net.chinaott.cms.core.system.repository.UserDao;
import net.chinaott.cms.web.utils.PageUtil;
import net.chinaott.cms.web.utils.SysDate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <日志记录服务类>
 * 
 * @author lizw
 * @version [版本号, 2014年11月19日]
 * @see [相关类/方法]
 * @since [产品/模块版本]
 */
@Component
@Transactional(value = "cmsTransactionManager")
public class OperationLogService
{
    private static final Logger LOGGER = LoggerFactory.getLogger(OperationLogService.class);
    
    @Autowired
    private OperationLogDao operationLogDao;
    
    @Autowired
    private UserDao userDao;

    /**
     *  <增加操作日志>
     * @param oprType
     * @param oprDataId
     * @param oprDataType
     * @param oprUserId
     */
    public void logOptAsync(final OperationType oprType, final String oprDataId, final String oprDataType,
        final Long oprUserId)
    {
        LOGGER.debug("Enter func[logTeamOptAsync], to add optLog with params oprType:{}, oprDataId:{}, oprDataType:{}, oprUserId:{}.",
            new Object[] {oprType, oprDataId, oprDataType, oprUserId});
        OperationLog optLog = buildTeamOptLog(oprType, oprDataId, oprDataType, oprUserId);
        operationLogDao.save(optLog);
        LOGGER.debug("Exit func[logTeamOptAsync].");
    }

    /**
     * <封装运营团队日志信息>
     * @param oprType
     * @param oprDataId
     * @param oprDataType
     * @param oprUserId
     * @return
     */
    private OperationLog buildTeamOptLog(OperationType oprType, String oprDataId, String oprDataType, Long oprUserId)
    {
        String oprUserName = userDao.getOperUserName(oprUserId);
        return buildOperationLog(oprType, oprDataId, oprDataType, String.valueOf(oprUserId), oprUserName);
    }

    /**
     *  <封装基本日志信息>
     * @param oprType
     * @param oprDataId
     * @param oprDataType
     * @param oprUserId
     * @param oprUserName
     * @return
     */
    private OperationLog buildOperationLog(OperationType oprType, String oprDataId, String oprDataType,
        String oprUserId, String oprUserName)
    {
        OperationLog log = new OperationLog();
        Date logTime = SysDate.getSysDate();
        log.setLogTime(logTime);
        log.setOprType(oprType.name());
        log.setOprDataId(oprDataId);
        log.setOprDataType(oprDataType);
        log.setOprUserId(oprUserId);
        log.setOprUserName(oprUserName);
        
        // 拼装操作内容
        // 示例:增加 菜单(Id:21)
        StringBuilder content = new StringBuilder();
        content.append(oprType.getValue())
            .append(" ")
            .append(oprDataType)
            .append("(")
            .append("Id:")
            .append(oprDataId)
            .append(")");
        log.setLogContent(content.toString());
        
        LOGGER.debug("Exit func[buildOperationLog] build log:{}", new Object[] {log});
        return log;
    }

    /**
     * <查询操作日志表>
     * @param searchParams
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public Page<OperationLog> getOperationLogList(Map<String, Object> searchParams, int pageNumber, int pageSize)
    {
        String[] orderBy = {"logTime"};
        PageRequest pageRequest = PageUtil.buildPageRequest(pageNumber, pageSize, "desc", orderBy);
        Specification<OperationLog> spec = PageUtil.buildSpecification(searchParams, OperationLog.class);
        return operationLogDao.findAll(spec, pageRequest);
    }
    
    /**
     * <删除操作日志信息>
     * 
     * @param id
     */
    public void deleteOperationLog(Long id)
    {
        operationLogDao.delete(id);
    }
    
    /**
     * <查询操作日志信息>
     * 
     * @param logId
     * @return
     */
    public OperationLog getOperationLogByLogId(Long logId)
    {
        return operationLogDao.findOne(logId);
    }

    /**
     * <查询所有操作日志>
     * @return
     */
    public List<OperationLog> queryAllOperationLogs()
    {
        return operationLogDao.findAll();
    }
    
    public List<OperationLog> getOprDataTypeList()
    {
        return operationLogDao.getOprDataTypeList();
    }
}
