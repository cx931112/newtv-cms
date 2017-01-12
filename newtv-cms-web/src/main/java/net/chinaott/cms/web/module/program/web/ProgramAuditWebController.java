package net.chinaott.cms.web.module.program.web;

import com.ysten.utils.string.StringUtil;
import lombok.extern.slf4j.Slf4j;
import net.chinaott.cms.core.program.entity.Program;
import net.chinaott.cms.web.common.constant.Constant;
import net.chinaott.cms.web.common.web.BusinessBasicController;
import net.chinaott.cms.web.log.entity.OperationType;
import net.chinaott.cms.web.module.log.service.OperationLogService;
import net.chinaott.cms.web.module.program.service.ProgramAuditWebService;
import net.chinaott.cms.web.utils.web.HttpResult;
import net.chinaott.cms.web.utils.web.HttpStatus;
import net.chinaott.cms.web.utils.web.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/program")
@Slf4j
public class ProgramAuditWebController extends BusinessBasicController
{
    @Autowired
    private ProgramAuditWebService programAuditWebService;
    
    @Autowired
    private OperationLogService operationLogService;
    
    /**
     * <获取节目状态为待审核的数据列表>
     */
    @RequestMapping("/audit")
    public String programList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNumber,
        @RequestParam(value = "numPerPage", defaultValue = "20") int pageSize, Model model, HttpServletRequest request)
    {
        // 获取查询条件
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        try
        {
            if (null != request.getParameter("searchName"))
            {
                searchParams.put(request.getParameter("searchName"), request.getParameter("searchValue"));
            }
            // 添加节目过滤条件
            searchParams.put("IN_status", Constant.ONLINE);
            Page<Program> programList = programAuditWebService.getProgramListByStatus(searchParams, pageNumber, pageSize);
            
            model.addAttribute("programList", programList.getContent());
            model.addAttribute("totalCount", programList.getTotalElements());
            model.addAttribute("pageNum", pageNumber);
            model.addAttribute("numPerPage", pageSize);
            model.addAttribute("searchValue", request.getParameter("searchValue"));
            model.addAttribute("searchName", request.getParameter("searchName"));
        }
        catch (Exception ex)
        {
            log.error("Inner func[ProgramAuditWebController.programList()] catch exception..", ex);
        }
        
        return "program/audit/programList";
    }
    
    @RequestMapping("/showAudit")
    public String showAuditPage(@RequestParam("ids") String ids, ModelMap model)
    {
        model.addAttribute("ids", ids);
        return "program/audit/programCheck";
    }
    
    @RequestMapping("/auditSubmit")
    @ResponseBody
    public HttpResult auditSubmit(@RequestParam("ids") String ids, @RequestParam("status") Integer status,
        @RequestParam("auditDesc") String auditDesc, HttpServletRequest request, HttpServletResponse response){
        HttpResult result = new HttpResult();
        String userName = getCurrentUser().getName();
        try
        {
            List<Long> programIds = StringUtil.splitToLong(ids, Constant.SEP_COMMA);
            programAuditWebService.audit(programIds,status,auditDesc,userName);
            result.setResult(HttpStatus.OK);
            
            for (Long id : programIds)
            {
                // 写入操作日志
                operationLogService.logOptAsync(OperationType.AUDIT,
                    String.valueOf(id),
                    Constant.OPRDATATYPE_PROGRAM,
                    getCurrentUser().id.longValue());
            }
        }
        catch (Exception e)
        {
            // 执行失败则 返回信息 为 ERROR
            result.setResult(HttpResult.SYSTEM_ERROR, "操作失败");
            log.error("Inner func[ProgramAuditWebController.auditSubmit()] catch exception..", e);
        }
        return result;
    }
    @RequestMapping("showProgramDetail/{id}")
    public String showProgramDetail(@PathVariable Long id, ModelMap model)
    {
        Program program = new Program();
        try
        {
            program = programAuditWebService.getProgramByProgramId(id);
            model.addAttribute("program", program);
        }
        catch (Exception e)
        {
            log.error("Exit func[showProgramDetail()] throw exception", e);
        }
        return "program/programDetail";
    }
    
}
