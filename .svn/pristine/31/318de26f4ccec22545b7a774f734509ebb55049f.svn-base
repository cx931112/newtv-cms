package net.chinaott.cms.web.module.system.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import net.chinaott.cms.core.system.entity.Button;
import net.chinaott.cms.core.system.entity.Role;
import net.chinaott.cms.core.system.entity.RoleMenuRel;
import net.chinaott.cms.core.system.entity.SysMenu;
import net.chinaott.cms.web.common.constant.Constant;
import net.chinaott.cms.web.common.web.SystemBasicController;
import net.chinaott.cms.web.log.entity.OperationType;
import net.chinaott.cms.web.module.log.service.OperationLogService;
import net.chinaott.cms.web.module.system.service.ButtonService;
import net.chinaott.cms.web.module.system.service.RoleManageService;
import net.chinaott.cms.web.module.system.service.SysMenuService;
import net.chinaott.cms.web.utils.Message;
import net.chinaott.cms.web.utils.MessageType;
import net.chinaott.cms.web.utils.web.HttpResult;
import net.chinaott.cms.web.utils.web.HttpStatus;
import net.chinaott.cms.web.utils.web.Servlets;
import org.apache.commons.lang.StringUtils;
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
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * <角色信息管理> <处理角色权限信息>
 * 
 * @author auth.core
 * @version [1.0, 2013-11-21]
 */
@Controller
@RequestMapping(value = "/roleManage")
public class RoleManageController extends SystemBasicController
{
    /**
     * 日志
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(RoleManageController.class);
    
    /**
     * menu主菜单parentId -
     */
    private static final Long PARENT_ID = 0l;
    
    @Autowired
    private RoleManageService roleManageService;
    
    @Autowired
    private SysMenuService sysMenuService;
    
    @Autowired
    private OperationLogService operationLogService;
    
    @Autowired
    private ButtonService buttonService;
    
    /**
     * json
     */
    protected static ObjectMapper jackSon = new ObjectMapper();
    
    /**
     * <查询角色信息>
     * 
     * @param pageNumber
     * @param pageSize
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "roleList")
    public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNumber,
        @RequestParam(value = "numPerPage", defaultValue = "20") int pageSize,
        @RequestParam(value = "isAdvencedSearch", defaultValue = "0") Integer isAdvencedSearch, Model model,
        ServletRequest request)
    {
        // 获取查询条件
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        try
        {
            // 根据条件查询角色信息
            Page<Role> roleList = roleManageService.getRoleList(searchParams, pageNumber, pageSize);
            model.addAttribute("role", roleList);
            model.addAttribute("totalCount", roleList.getTotalElements());
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
                LOGGER.error("Inner func[RoleManageController.list]." + " catch exception while get Role list ", e);
            }
        }
        finally
        {
            model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
            model.addAttribute("pageNum", pageNumber);
            model.addAttribute("numPerPage", pageSize);
        }
        
        return "manager/role/roleList";
    }
    
    /**
     * <进入角色添加页面>
     * 
     * @return
     */
    @RequestMapping(value = "add")
    public String pageAddInfo()
    {
        return "manager/role/roleInfo";
    }
    
    /**
     * <删除平台信息> <根据id删除平台信息>
     * 
     * @param response
     * @param request
     * @return
     */
    
    @RequestMapping(value = "delete", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public HttpResult deleteByIds(HttpServletResponse response, HttpServletRequest request)
    {
        // 获得-选中删除的 平台id
        String[] ids = request.getParameterValues("ids");
        HttpResult result = new HttpResult();
        
        try
        {
            String IDs = "";
            for (String id : ids)
            {
                // 执行删除操作
                roleManageService.deleteRole(Long.valueOf(id));
                IDs += id + ",";
            }
            IDs = IDs.substring(0, IDs.length() - 1);
            result.setResult(HttpStatus.OK);
            // 写入操作日志
            operationLogService.logOptAsync(OperationType.REMOVE,
                IDs,
                Constant.OPRDATATYPE_ROLE,
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
    
    /**
     * <进入角色编辑页面>
     * 
     * @return
     */
    @RequestMapping(value = "edit")
    public String pageEditInfo(@ModelAttribute("id") String id, ModelMap model, HttpServletResponse response,
        HttpServletRequest request)
    {
        Role role = new Role();
        try
        {
            role = roleManageService.getRole(Long.parseLong(id));
            model.addAttribute("role", role);
        }
        catch (Exception e)
        {
            if (LOGGER.isErrorEnabled())
            {
                LOGGER.info("Enter func[RoleManageController.pageEditInfo]", e);
            }
        }
        return "manager/role/roleInfo";
        
    }
    
    /**
     * <执行角色添加，修改操作>
     * 
     * @param role
     * @param request
     * @param response
     */
    @RequestMapping(value = "saveInfo")
    public void saveInfo(@Valid @ModelAttribute("role") Role role, HttpServletRequest request,
        HttpServletResponse response)
    {
        Message message = new Message();
        
        try
        {
            OperationType oprType;
            if (null == role.getId())
            {
                oprType = OperationType.ADD;
            }
            else
            {
                oprType = OperationType.MODIFY;
            }
            // 执行保存信息 操作
            roleManageService.saveRole(role);
            // 执行成功则 返回信息 为 SUCCESS
            message.setStatusCode(MessageType.SUCCESS.value);
            message.setMessage("操作成功");
            // 写入操作日志
            operationLogService.logOptAsync(oprType,
                String.valueOf(role.getId()),
                Constant.OPRDATATYPE_ROLE,
                getCurrentUser().id.longValue());
        }
        catch (Exception e)
        {
            // 执行失败则 返回信息 为 ERROR
            message.setStatusCode(MessageType.ERROR.value);
            message.setMessage("操作失败");
            if (LOGGER.isErrorEnabled())
            {
                LOGGER.info("Enter func[RoleManageContorller.saveInfo]", e);
            }
        }
        // 页面返回信息
        printMessage(response, message);
        
    }
    
    /**
     * <根据角色获得相应的菜单-tree>
     * 
     * @param roleId
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "getMenu", method = RequestMethod.GET)
    public String getMenuTree(@ModelAttribute("id") Long roleId, ModelMap model, HttpServletRequest request,
        HttpServletResponse response)
    {
        try
        {
            List<SysMenu> menus = sysMenuService.getMenuByParentId(PARENT_ID);
            List<RoleMenuRel> rel = roleManageService.getRoleMenuRel(roleId);
            List<String> roleButtonCodes = buttonService.findRoleButtonCodesByRoleId(roleId);
            for (RoleMenuRel ls : rel)
            {
                for (SysMenu menu : menus)
                {
                    if (ls.getMenuId().equals(menu.getId()))
                    {
                        menu.setChecked(true);
                    }
                    for (SysMenu me : menu.getChildMenus())
                    {
                        if (ls.getMenuId().equals(me.getId()))
                        {
                            me.setChecked(true);
                        }
                    }
                }
            }
            for (SysMenu menu : menus)
            {
                List<SysMenu> childMenus = menu.getChildMenus();
                for (SysMenu childMenu : childMenus)
                {
                    List<Button> buttonList = childMenu.getChildButton();
                    for (Button button : buttonList)
                    {
                        if (roleButtonCodes.contains(button.getButtonCode()))
                        {
                            button.setChecked(true);
                        }
                    }
                }
            }
            model.addAttribute("menus", menus);
            // 将角色Id 返回到页面-用于下面执行更新角色查看菜单权限操作
            model.addAttribute("roleId", roleId);
        }
        catch (Exception e)
        {
            if (LOGGER.isErrorEnabled())
            {
                LOGGER.info("Enter func[RoleManageContorller.getMenuTree]", e);
            }
        }
        return "manager/role/roleMenuList";
    }
    
    /**
     * <执行角色更新权限信息，修改操作>
     * 
     * @param menuId
     * @param request
     * @param response
     */
    @RequestMapping(value = "roleMenu")
    public void menuInfo(@ModelAttribute("strId") String menuId, HttpServletRequest request,
        HttpServletResponse response)
    {
        Message message = new Message();
        
        try
        {
            // 执行保存信息 操作
            String roleId = request.getParameter("roleId");
            if (StringUtils.isNotBlank(roleId))
            {
                // 更新角色 可以查看菜单的权限
                roleManageService.updateRoleMenuRel(menuId, roleId);
            }
            // 执行成功则 返回信息 为 SUCCESS
            message.setStatusCode(MessageType.SUCCESS.value);
            message.setMessage("操作成功");
        }
        catch (Exception e)
        {
            // 执行失败则 返回信息 为 ERROR
            message.setStatusCode(MessageType.ERROR.value);
            message.setMessage("操作失败");
            if (LOGGER.isErrorEnabled())
            {
                LOGGER.info("Enter func[RoleManageContorller.menuInfo]", e);
            }
        }
        // 页面返回信息
        printMessage(response, message);
        
    }
    
    /**
     * <校验 平台SERVER ID的唯一性>
     * 
     * @return
     */
    @RequestMapping(value = "validate/{roleId}")
    @ResponseBody
    public boolean validate(@ModelAttribute("role") Role role, @PathVariable("roleId") Long roleId)
    {
        String roleName = role.getName();
        boolean validatePass = true;
        
        Role tempRole = new Role();
        tempRole = roleManageService.findRoleByName(roleName);
        
        if (null != tempRole && roleId != tempRole.getId())
        {
            validatePass = false;
        }
        
        return validatePass;
    }
    
    /**
     * <返回json信息到页面> <将成功-失败信息在页面打印>
     * 
     * @param response
     * @param message
     */
    public void printMessage(HttpServletResponse response, Message message)
    {
        PrintWriter writer;
        try
        {
            response.setCharacterEncoding("utf-8");
            writer = response.getWriter();
            writer.print(jackSon.writeValueAsString(message));
            writer.flush();
            writer.close();
        }
        catch (IOException e)
        {
            if (LOGGER.isInfoEnabled())
            {
                LOGGER.info("Exit func[RoleManageController.printMessage]" + "-Exception ", e);
            }
        }
    }
    
}
