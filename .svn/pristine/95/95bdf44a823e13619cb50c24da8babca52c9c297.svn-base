package net.chinaott.cms.web.module.log.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import net.chinaott.cms.web.common.web.SystemBasicController;
import net.chinaott.cms.web.log.entity.OperationLog;
import net.chinaott.cms.web.module.log.service.OperationLogService;
import net.chinaott.cms.web.utils.web.HttpResult;
import net.chinaott.cms.web.utils.web.HttpStatus;
import net.chinaott.cms.web.utils.web.Servlets;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <系统字典表的接口>
 * 
 * @author gaoyuan
 * @version [1.0 2014-4-25]
 */
@Controller
@RequestMapping(value = "/operationLog")
public class OperationLogController extends SystemBasicController
{
	@Autowired
    private OperationLogService operationLogService;
    
    private static final Logger LOGGER = LoggerFactory.getLogger(OperationLogController.class);
    
    /**
     * json
     */
    protected static ObjectMapper jackSon = new ObjectMapper();
    
    /**
     * <查询操作日志信息>
     * 
     * @param pageNumber
     * @param pageSize
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "operationLogList")
    public String list(@RequestParam(value = "pageNum", defaultValue = "1")
    int pageNumber, @RequestParam(value = "numPerPage", defaultValue = "20")
    int pageSize, Model model, ServletRequest request)
    {
        // 获取查询条件
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        try
        {
        	Page<OperationLog> operationLogList = operationLogService.getOperationLogList(searchParams, pageNumber, pageSize);
            model.addAttribute("operationLogList", operationLogList);
            model.addAttribute("totalCount", operationLogList.getTotalElements());
        }
        catch (Exception e)
        {
            if (LOGGER.isErrorEnabled())
            {
                LOGGER.error("Inner func[list]." + " catch exception while get operationLog list ", e);
            }
        }
        finally
        {
            model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
            model.addAttribute("pageNum", pageNumber);
            model.addAttribute("numPerPage", pageSize);
        }
        
        return "log/operationLog/operationLogList";
    }
    
    
    /**
     * <删除操作日志信息> <根据id删除系统字典表信息>
     * 
     * @param response
     * @param request
     * @return
     */
    
    @RequestMapping(value = "delete", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public HttpResult deleteByIds(HttpServletResponse response, HttpServletRequest request)
    {
        // 获得-选中删除的logId
        String[] ids = request.getParameterValues("ids");
        HttpResult result = new HttpResult();
        
        try
        {
            for (int i = 0; i < ids.length; i++)
            {
                // 执行删除操作
                operationLogService.deleteOperationLog(Long.valueOf(ids[i]));
            }
            result.setResult(HttpStatus.OK);
        }
        catch (Exception e)
        {
            // 执行失败则 返回信息 为 ERROR
            result.setResult("300", "操作失败");
            LOGGER.error("Enter func[delete] catch exception.." , e);
        }
        // 页面返回信息
        return result;
    }
    
    /**
     * <进入操作日志详细数据页面>
     * 
     * @return
     */
    @RequestMapping(value = "showOperationLogData/{logId}")
    public String showOperationLogData(@PathVariable
    Long logId, ModelMap model)
    {
        OperationLog operationLog = new OperationLog();
        operationLog = operationLogService.getOperationLogByLogId(logId);
        model.addAttribute("operationLog", operationLog);
        return "log/operationLog/operationLogData";
    }
    
    /**
     * <进入操作日志高级查询页面>
     * 
     * @return
     */
    @RequestMapping(value = "advanceSearch")
    public String advanceSearch(ModelMap model)
    {
        return "log/operationLog/operationLog_search";
    }
    
    /**
     * <获取日志操作类型列表-下拉框用>
     * 
     * @return
     * @see [类、类#方法、类#成员]
     */
    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "getOperationDataTypeList")
    @ResponseBody
    public List<List> getOprDataTypeList(){
        List<List> result = new ArrayList<List>();
        List<String> list = null;
        List<OperationLog> logList = operationLogService.getOprDataTypeList();
        for (OperationLog log : logList)
        {
            list = new ArrayList<String>();
            list.add(log.getOprDataType());
            list.add(log.getOprDataType());
            result.add(list);
        }
        return result;
    }
}