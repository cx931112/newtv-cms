package net.chinaott.cms.web.module.system.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import net.chinaott.cms.web.common.constant.Constant;
import net.chinaott.cms.web.common.web.SystemBasicController;
import net.chinaott.cms.web.log.entity.OperationType;
import net.chinaott.cms.web.module.log.service.OperationLogService;
import net.chinaott.cms.web.module.system.service.SystemDicService;
import net.chinaott.cms.core.system.entity.SystemDic;
import net.chinaott.cms.web.utils.SysDate;
import net.chinaott.cms.web.utils.web.HttpResult;
import net.chinaott.cms.web.utils.web.HttpStatus;
import net.chinaott.cms.web.utils.web.Servlets;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Map;

/**
 * <系统字典表的接口>
 * 
 * @author gaoyuan
 * @version [1.0 2014-4-25]
 */
@Controller
@RequestMapping(value = "/systemDic")
public class SystemDicController extends SystemBasicController
{
    @Autowired
    private SystemDicService sysDicService;
    
    @Autowired
    private OperationLogService operationLogService;
    
    private static final Logger LOGGER = LoggerFactory.getLogger(SystemDicController.class);
    
    /**
     * json
     */
    protected static ObjectMapper jackSon = new ObjectMapper();
    
    /**
     * <查询系统字典信息>
     * 
     * @param pageNumber
     * @param pageSize
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "systemIdDicList")
    public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNumber,
        @RequestParam(value = "numPerPage", defaultValue = "20") int pageSize,
        @RequestParam(value = "isAdvencedSearch", defaultValue = "0") Integer isAdvencedSearch, Model model,
        ServletRequest request)
    {
        // 获取查询条件
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        try
        {
            Page<SystemDic> sysDicList = sysDicService.getSysDicList(searchParams, pageNumber, pageSize);
            model.addAttribute("sysDicList", sysDicList);
            model.addAttribute("totalCount", sysDicList.getTotalElements());
            // 判断是不是高级查询 0-高级查询
            if (isAdvencedSearch.intValue() != 0)
            {
                if (null != request.getParameter("searchName"))
                    searchParams.put(request.getParameter("searchName"), request.getParameter("searchValue"));
            }
        }
        catch (Exception e)
        {
            if (LOGGER.isErrorEnabled())
            {
                LOGGER.error("Inner func[list]." + " catch exception while get sysDic list ", e);
            }
        }
        finally
        {
            model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
            model.addAttribute("pageNum", pageNumber);
            model.addAttribute("numPerPage", pageSize);
        }
        
        return "manager/systemDic/systemDicMaintain";
    }
    
    /**
     * <进入系统字典 添加页面>
     * 
     * @return
     */
    @RequestMapping(value = "add")
    public String pageAddInfo(ModelMap model)
    {
        return "manager/systemDic/systemDicInfo";
        
    }
    
    /**
     * <执行系统字典添加，修改操作>
     * 
     * @param sysDic
     * @param request
     * @param response
     * @return
     */
    
    @RequestMapping(value = "saveInfo")
    @ResponseBody
    public HttpResult saveInfo(@Valid @ModelAttribute("systemDic") SystemDic sysDic, HttpServletRequest request,
        HttpServletResponse response)
    {
        HttpResult result = new HttpResult();
        SystemDic systemDic = new SystemDic();
        try
        {
            //判断类型下的值是否重复
            SystemDic tempSysValue = systemDicService.getDicByTypeAndValue(sysDic.getType(), sysDic.getValue());
            if(tempSysValue != null && !tempSysValue.getIoid().equals(sysDic.getIoid() == null ? 0 : sysDic.getIoid())){
                result.setResult(HttpResult.SYSTEM_ERROR, "当前类型下的值已存在，请重新输入");
                return result;
            }
            //判断类型下的名称是否重复
            /*SystemDic tempSysName = systemDicService.getDicByTypeAndName(sysDic.getType(), sysDic.getName());
            if(tempSysName != null && !tempSysName.getIoid().equals(sysDic.getIoid() == null ? 0 : sysDic.getIoid())){
                result.setResult(HttpResult.SYSTEM_ERROR, "当前类型下的名称已存在，请重新输入");
                return result;
            }*/
            //保存操作
            OperationType oprType;
            if (null == sysDic.getIoid())
            {
                sysDic.setCreateTime(SysDate.getSysDate());
                oprType = OperationType.ADD;
            }
            else
            {
                systemDic = systemDicService.getSystemDic(sysDic.getIoid());
                sysDic.setCreateTime(systemDic.getCreateTime());
                sysDic.setUpdateTime(SysDate.getSysDate());
                oprType = OperationType.MODIFY;
            }
            BeanUtils.copyProperties(sysDic, systemDic);
            // 执行保存信息 操作
            systemDicService.saveSysDic(systemDic);
            result.setResult(HttpStatus.OK);
            // 写入操作日志
            operationLogService.logOptAsync(oprType,
                String.valueOf(systemDic.getIoid()),
                Constant.OPRDATATYPE_SYSTEMDIC,
                getCurrentUser().id.longValue());
        }
        catch (Exception e)
        {
            // 执行失败则 返回信息 为 ERROR
            result.setResult("300", "操作失败");
            LOGGER.error("Enter func[saveInfo]", e);
        }
        // 页面返回信息
        return result;
    }
    
    /**
     * <进入系统字典信息维护页面> <转到信息维护页面>
     * 
     * @param id
     * @param model
     * @param response
     * @param request
     * @return
     * @see [类、类#方法、类#成员]
     */
    @RequestMapping(value = "edit/{id}")
    public String editInfo(@PathVariable Long id, ModelMap model, HttpServletResponse response,
        HttpServletRequest request)
    {
        SystemDic systemDic = new SystemDic();
        try
        {
            // 获得 系统字典表信息
            systemDic = systemDicService.getSystemDic(id);
            model.addAttribute("systemDic", systemDic);
        }
        catch (Exception e)
        {
            if (LOGGER.isErrorEnabled())
            {
                LOGGER.info("Enter func[editInfo]", e);
            }
        }
        return "manager/systemDic/systemDicInfo";
        
    }
    
    /**
     * <删除系统字典表信息> <根据id删除系统字典表信息>
     * 
     * @param response
     * @param request
     * @return
     */
    
    @RequestMapping(value = "delete", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public HttpResult deleteByIds(HttpServletResponse response, HttpServletRequest request)
    {
        // 获得-选中删除的ioid
        String[] ids = request.getParameterValues("ids");
        HttpResult result = new HttpResult();
        
        try
        {
            String ioIDs = "";
            for (int i = 0; i < ids.length; i++)
            {
                // 执行删除操作
                systemDicService.deleteSystemDic(Long.valueOf(ids[i]));
                ioIDs += ids[i] + ",";
            }
            ioIDs = ioIDs.substring(0, ioIDs.length() - 1);
            result.setResult(HttpStatus.OK);
            // 写入操作日志
            operationLogService.logOptAsync(OperationType.REMOVE,
                ioIDs,
                Constant.OPRDATATYPE_SYSTEMDIC,
                getCurrentUser().id.longValue());
        }
        catch (Exception e)
        {
            // 执行失败则 返回信息 为 ERROR
            result.setResult("300", "操作失败");
            LOGGER.error("Enter func[delete] catch exception..", e);
        }
        // 页面返回信息
        return result;
    }
}