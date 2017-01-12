package net.chinaott.cms.web.module.system.web;

import net.chinaott.cms.core.system.entity.Button;
import net.chinaott.cms.core.system.entity.SysMenu;
import net.chinaott.cms.web.common.constant.Constant;
import net.chinaott.cms.web.common.web.SystemBasicController;
import net.chinaott.cms.web.log.entity.OperationType;
import net.chinaott.cms.web.utils.web.HttpResult;
import net.chinaott.cms.web.utils.web.HttpStatus;
import net.chinaott.cms.web.utils.web.Servlets;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 
 * 按钮管理控制类 <功能详细描述>
 * 
 * @author Peter
 * @version [版本号, 2014年5月23日]
 * @see [相关类/方法]
 * @since [产品/模块版本]
 */
@Controller
@RequestMapping(value = "/sysButton")
public class SysButtonController extends SystemBasicController
{
    private static final Logger LOGGER = LoggerFactory.getLogger(SysButtonController.class);
    
    /**
     * 获取button列表 <功能详细描述>
     * 
     * @param pageNumber
     * @param pageSize
     * @param orderDirection
     * @param orderField
     * @param model
     * @param request
     * @return
     * @see [类、类#方法、类#成员]
     */
    @RequestMapping(value = "buttonList")
    public String buttonList(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNumber,
        @RequestParam(value = "numPerPage", defaultValue = "20") Integer pageSize,
        @RequestParam(value = "orderDirection", defaultValue = "asc") String orderDirection,
        @RequestParam(value = "orderField", defaultValue = "buttonCode") String orderField, Model model,
        HttpServletRequest request)
    {
        // 获取查询条件
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        try
        {
            // 根据条件查询按钮信息
            Page<Button> buttonList =
                buttonService.getButtonList(searchParams, pageNumber, pageSize, orderDirection, orderField);
            model.addAttribute("button", buttonList);
            model.addAttribute("totalCount", buttonList.getTotalElements());
        }
        catch (Exception e)
        {
            if (LOGGER.isErrorEnabled())
            {
                LOGGER.error("Inner func[buttonList]." + " catch exception while get button list ", e);
            }
        }
        finally
        {
            model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
            model.addAttribute("pageNum", pageNumber);
            model.addAttribute("numPerPage", pageSize);
        }
        return "manager/button/buttonList";
    }
    
    /**
     * 跳转到button增加页面 <功能详细描述>
     * 
     * @param model
     * @return
     * @see [类、类#方法、类#成员]
     */
    @RequestMapping(value = "add")
    public String addButton(ModelMap model)
    {
        List<SysMenu> menuList = new ArrayList<SysMenu>();
        menuList = sysMenuService.getAllMenuList();
        model.addAttribute("menuList", menuList);
        return "manager/button/buttonInfo";
    }
    
    /**
     * 保存按钮信息 <功能详细描述>
     * 
     * @param button
     * @param buttonElderCode
     * @param model
     * @param request
     * @param response
     * @return
     * @see [类、类#方法、类#成员]
     */
    @RequestMapping(value = "saveButton")
    @ResponseBody
    public HttpResult saveButton(@Valid @ModelAttribute("button") Button button,
        @RequestParam(value = "buttonElderCode") String buttonElderCode, ModelMap model, HttpServletRequest request,
        HttpServletResponse response)
    {
        HttpResult result = new HttpResult();
        OperationType oprType;
        boolean isUpdate = false;
        Button buttonEntity = null;
        try
        {
            // buttonElderCode不为空时，执行更新操作
            if (StringUtils.isNotBlank(buttonElderCode))
            {
                isUpdate = true;
                buttonEntity = buttonService.findByButtonCode(buttonElderCode);
                button.setCreateTime(buttonEntity.getCreateTime());
                button.setUpdateTime(new Date());
                button.setOprUserId(this.getCurrentUser().id);
                buttonService.saveButton(button);
            }
            else
            {
                buttonEntity = buttonService.findByButtonCode(button.getButtonCode());
                if (buttonEntity != null)
                {
                    result.setResult(HttpResult.SYSTEM_ERROR, "当前按钮代码已存在，请重新输入");
                    return result;
                }
                else
                {
                    button.setOprUserId(this.getCurrentUser().id);
                    button.setCreateTime(new Date());
                    buttonService.saveButton(button);
                }
            }
            if (isUpdate)
            {
                oprType = OperationType.MODIFY;
            }
            else
            {
                oprType = OperationType.ADD;
            }
            result.setResult(HttpStatus.OK);
            // 写入操作日志
            operationLogService.logOptAsync(oprType,
                button.getButtonCode(),
                Constant.OPRDATATYPE_BUTTON,
                getCurrentUser().id.longValue());
        }
        catch (Exception e)
        {
            result.setResult("300", "操作失败");
            LOGGER.debug("Enter func[saveMenu] catch exception", e);
        }
        return result;
    }
    
    /**
     * 删除按钮信息 <功能详细描述>
     * 
     * @param buttonCodes
     * @param response
     * @param request
     * @return
     * @see [类、类#方法、类#成员]
     */
    @RequestMapping(value = "delete", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public HttpResult deleteByIds(@RequestParam(value = "ids") String[] buttonCodes, HttpServletResponse response,
        HttpServletRequest request)
    {
        HttpResult result = new HttpResult();
        
        try
        {
            String Ids = "";
            for (String buttonCode : buttonCodes)
            {
                buttonService.deleteButtonByButtonCode(buttonCode);
                Ids += buttonCode + ",";
            }
            Ids = Ids.substring(0, Ids.length() - 1);
            result.setResult(HttpStatus.OK);
            // 写入操作日志
            operationLogService.logOptAsync(OperationType.REMOVE,
                Ids,
                Constant.OPRDATATYPE_BUTTON,
                getCurrentUser().id.longValue());
        }
        catch (Exception e)
        {
            result.setResult("300", "操作失败");
            LOGGER.info("Enter func[deleteByIds]", e);
            
        }
        // 返回客户端信息，打印相关信息
        return result;
    }
    
    /**
     * 编辑按钮信息 <功能详细描述>
     * 
     * @param buttonCode
     * @param model
     * @return
     * @see [类、类#方法、类#成员]
     */
    @RequestMapping(value = "edit/{buttonCode}")
    public String editButtonInfo(@PathVariable String buttonCode, ModelMap model)
    {
        Button button = new Button();
        try
        {
            List<SysMenu> menuList = new ArrayList<SysMenu>();
            menuList = sysMenuService.getAllMenuList();
            button = buttonService.findByButtonCode(buttonCode);
            model.addAttribute("button", button);
            model.addAttribute("menuList", menuList);
        }
        catch (Exception e)
        {
            LOGGER.error("Enter func[editButtonInfo] catch exception ", e);
        }
        
        return "manager/button/buttonInfo";
    }
    
}
