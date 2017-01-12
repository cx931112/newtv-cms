package net.chinaott.cms.web.module.system.web;

import net.chinaott.cms.core.system.entity.SystemConfig;
import net.chinaott.cms.web.common.constant.Constant;
import net.chinaott.cms.web.common.web.SystemBasicController;
import net.chinaott.cms.web.log.entity.OperationType;
import net.chinaott.cms.web.module.log.service.OperationLogService;
import net.chinaott.cms.web.module.system.service.SystemConfigService;
import net.chinaott.cms.web.utils.SystemConfigLoader;
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
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Map;

/**
 * <系统参数配置>
 * 
 * @author liwei
 * @version [版本号, 2014年3月3日]
 */
@Controller
@RequestMapping(value = "/systemConfig")
public class SystemConfigController extends SystemBasicController
{
    /**
     * 日志
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(SystemConfigController.class);
    
    @Autowired
    private SystemConfigService systemConfigService;
    
    @Autowired
    private SystemConfigLoader loader;
    
    @Autowired
    private OperationLogService operationLogService;
    
    /**
     * <查询系统配置信息>
     * 
     * @param pageNumber
     * @param pageSize
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "systemConfigList")
    public String systemConfigList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNumber,
        @RequestParam(value = "numPerPage", defaultValue = "20") int pageSize,
        @RequestParam(value = "isAdvencedSearch", defaultValue = "0") Integer isAdvencedSearch, Model model,
        ServletRequest request)
    {
        // 获取查询条件
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        try
        {
            // 根据条件查询角色信息
            Page<SystemConfig> systemConfigList =
                systemConfigService.getSystemConfigList(searchParams, pageNumber, pageSize);
            model.addAttribute("systemConfigList", systemConfigList);
            model.addAttribute("totalCount", systemConfigList.getTotalElements());
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
                LOGGER.error("Inner func[systemConfigList]." + " catch exception while get Role list ", e);
            }
        }
        finally
        {
            model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
            model.addAttribute("pageNum", pageNumber);
            model.addAttribute("numPerPage", pageSize);
        }
        return "manager/systemConfig/systemConfigList";
    }
    
    /**
     * <进入系统配置添加页面>
     * 
     * @return
     */
    @RequestMapping(value = "add")
    public String addConfig(ModelMap model)
    {
        return "manager/systemConfig/systemConfigInfo";
    }

    /**
     * <进入编辑页面>
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "edit/{id}")
    public String editInfo(@PathVariable Long id, ModelMap model)
    {
        SystemConfig systemConfig = new SystemConfig();
        try
        {
            
            systemConfig = systemConfigService.getSystemConfigById(id);
            model.addAttribute("systemConfig", systemConfig);
        }
        catch (Exception e)
        {
            LOGGER.error("Enter func[editInfo] catch exception " + e);
        }
        
        return "manager/systemConfig/systemConfigInfo";
    }

    /**
     *  <保存 系统配置>
     * @param systemConfig
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "saveSystemConfig")
    @ResponseBody
    public HttpResult saveSystemConfig(@Valid @ModelAttribute("systemConfig") SystemConfig systemConfig,
        ModelMap model, HttpServletRequest request, HttpServletResponse response)
    {
        HttpResult result = new HttpResult();
        SystemConfig config = new SystemConfig();
        try
        {
            OperationType oprType;
            if (null != systemConfig.getConfigId())
            {
                config = systemConfigService.getSystemConfigById(systemConfig.getConfigId());
                oprType = OperationType.MODIFY;
            }
            else
            {
                oprType = OperationType.ADD;
            }
            config.setConfigValue(systemConfig.getConfigValue());
            // 保存
            systemConfigService.saveSystemConfig(config);
            result.setResult(HttpStatus.OK);
            // 写入操作日志
            operationLogService.logOptAsync(oprType,
                String.valueOf(systemConfig.getConfigId()),
                Constant.OPRDATATYPE_SYSTEMCONFIG,
                getCurrentUser().id.longValue());
        }
        catch (Exception e)
        {
            result.setResult("300", "操作失败");
            LOGGER.debug("Enter func[saveMenu] catch exception" + e);
        }
        return result;
        
    }

    /**
     * <保存 系统配置>
     * @param model
     * @param response
     * @return
     */
    @RequestMapping(value = "refresh")
    @ResponseBody
    public HttpResult refresh(ModelMap model, HttpServletResponse response)
    {
        HttpResult result = new HttpResult();
        try
        {
            loader.refresh();
            result.setResult(HttpStatus.OK);
        }
        catch (Exception e)
        {
            result.setResult("300", "操作失败");
            LOGGER.debug("Enter func[refresh] catch exception" + e);
        }
        return result;
        
    }
    
    /**
     * <删除menu>
     * 
     * @param response
     * @param request
     */
    @RequestMapping(value = "delete", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public HttpResult deleteByIds(@RequestParam(value = "ids") String[] ids, HttpServletResponse response,
        HttpServletRequest request)
    {
        HttpResult result = new HttpResult();
        
        try
        {
            for (String id : ids)
            {
                systemConfigService.deleteConfigById(Long.valueOf(id));
            }
            result.setResult(HttpStatus.OK);
        }
        catch (Exception e)
        {
            result.setResult("300", "操作失败");
            LOGGER.info("Enter func[deleteByIds]" + e);
        }
        // 返回客户端信息，打印相关信息
        return result;
    }
    
}
