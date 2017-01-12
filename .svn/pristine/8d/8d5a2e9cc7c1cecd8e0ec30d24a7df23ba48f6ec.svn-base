package net.chinaott.cms.web.module.account.web;

import net.chinaott.cms.web.common.constant.Constant;
import net.chinaott.cms.web.common.web.SystemBasicController;
import net.chinaott.cms.web.log.entity.OperationType;
import net.chinaott.cms.web.module.account.service.AccountService;
import net.chinaott.cms.web.module.account.service.ShiroDbRealm.ShiroUser;
import net.chinaott.cms.web.module.log.service.OperationLogService;
import net.chinaott.cms.web.module.system.service.RoleManageService;
import net.chinaott.cms.core.system.entity.Role;
import net.chinaott.cms.core.system.entity.User;
import net.chinaott.cms.core.system.entity.UserRoleRel;
import net.chinaott.cms.web.utils.ArrayUtil;
import net.chinaott.cms.web.utils.web.HttpResult;
import net.chinaott.cms.web.utils.web.HttpStatus;
import net.chinaott.cms.web.utils.web.Servlets;
import org.apache.commons.lang3.StringUtils;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 管理员管理用户的Controller.
 * 
 * @author mahc
 */
@Controller
@RequestMapping(value = "/admin/user")
public class UserAdminController extends SystemBasicController
{
    /**
     * 日志
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(UserAdminController.class);
    
    
    @Autowired
    private AccountService accountService;
    
    @Autowired
    private RoleManageService roleManageService;
    
    @Autowired
    private OperationLogService operationLogService;
    
    /**
     * Ajax请求校验loginName是否唯一。
     */
    @RequestMapping(value = "checkRoleName/{id}")
    @ResponseBody
    public boolean checkRoleName(@RequestParam("name") String roleName, @PathVariable("id") Long roleId)
    {
        // 添加 角色时,id默认为 -100L 修改时id为表中数据
        Long valId = -100L;
        Role role = new Role();
        boolean validatePass = true;
        if (valId == roleId)
        {
            role = roleManageService.findRoleByName(roleName);
        }
        else
        {
            role = roleManageService.findRoleByNameAndId(roleName, roleId);
        }
        if (null != role)
        {
            validatePass = false;
        }
        return validatePass;
    }
    
    @RequestMapping(value = "userList")
    public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNumber,
        @RequestParam(value = "numPerPage", defaultValue = "20") int pageSize,
        @RequestParam(value = "isAdvencedSearch", defaultValue = "0") Integer isAdvencedSearch, Model model,
        ServletRequest request)
    {
        ShiroUser user = getCurrentUser();
        // 获取查询条件
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        try
        {
            searchParams.put("NE_roles", "system_user");
            // 根据条件查询用户信息
            // 根据条件查询平台信息
            /*boolean isAdmin = getUserRole(user.id);
            // 如果有超级管理员权限可以查看所有平台信息
            if (!isAdmin)
            {
                // 没有管理员权限,则需要根据platformId 查询
                searchParams.put("EQ_platformId", user.platformId.toString());
                plat = platService.getPlatform(getCurrentUser().platformId);
                platformList.add(plat);
            }
            else
            {
                platformList = platService.findAll();
            }
            */
            Page<User> users = accountService.getUserList(searchParams, pageNumber, pageSize);
            model.addAttribute("user", users);
            model.addAttribute("totalCount", users.getTotalElements());
            // 判断是不是高级查询 0-高级查询
            if (isAdvencedSearch.intValue() != 0)
            {
                if (null != request.getParameter("searchName"))
                    searchParams.put(request.getParameter("searchName"), request.getParameter("searchValue"));
                // //写入操作日志
                // operationLogService.logOptAsync("",
                // SysDicConstants.OPR_TYPE_QUERY,
                // CoreConstants.OPRDATATYPE_USER,
                // getCurrentUser().id.longValue(),
                // request.getRemoteAddr(),
                // getCurrentUser().platformId);
            }
        }
        catch (Exception e)
        {
            if (LOGGER.isErrorEnabled())
            {
                LOGGER.error("Inner func[UserAdminController.list]." + " catch exception while get firm list ", e);
            }
        }
        finally
        {
            model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
            model.addAttribute("pageNum", pageNumber);
            model.addAttribute("numPerPage", pageSize);
            //model.addAttribute("platformList", platformList);
        }
        
        return "manager/user/userList";
    }
    
    @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Long id, Model model)
    {
        List<UserRoleRel> rel = new ArrayList<UserRoleRel>();
        boolean isAdmin = false;
        Long adminRole = 1L;
        rel = roleManageService.getUserRoleRel(getCurrentUser().id);
        for (UserRoleRel r : rel)
        {
            if (adminRole == r.getRoleId())
            {
                isAdmin = true;
            }
        }
        model.addAttribute("user", accountService.getUser(id));
        
        return "manager/user/userInfo";
    }
    
    @RequestMapping(value = "/update")
    @ResponseBody
    public HttpResult update(@Valid @ModelAttribute("user") User user, HttpServletRequest request,
        HttpServletResponse response)
    {
        HttpResult result = new HttpResult();
        try
        {
            accountService.updateUser(user);
            // 执行成功则 返回信息 为 SUCCESS
            result.setResult(HttpStatus.OK);
            // 写入操作日志
            operationLogService.logOptAsync(OperationType.MODIFY,
                String.valueOf(user.getId()),
                Constant.OPRDATATYPE_USER,
                getCurrentUser().id.longValue());
        }
        catch (Exception e)
        {
            // 执行失败则 返回信息 为 ERROR
            result.setResult("300", "操作失败");
            LOGGER.error("Enter func[UserAdminController.update]" + e);
        }
        // 页面返回信息
        return result;
    }
    
    /**
     * <进入编辑用户绑定角色页面>
     * 
     * @param userId
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/setUserRole")
    public String setUserRole(@ModelAttribute("id") Long userId, Model model, HttpServletRequest request,
        HttpServletResponse response)
    {
        List<UserRoleRel> userRoleRel = new ArrayList<UserRoleRel>();
        Role role = new Role();
        List<Long> roleIds = new ArrayList<Long>();
        List<Role> roleListChecked = new ArrayList<Role>();
        List<Role> roleListNoChecked = new ArrayList<Role>();
        try
        {
            userRoleRel = roleManageService.getUserRoleRel(userId);
            for (UserRoleRel rel : userRoleRel)
            {
                role = roleManageService.getRole(rel.getRoleId());
                roleListChecked.add(role);
                roleIds.add(rel.getRoleId());
            }
            if (!roleIds.isEmpty())
            {
                roleListNoChecked = roleManageService.getRoleLists(roleIds);
            }
            else
            {
                roleListNoChecked = roleManageService.getAllRole();
            }
            model.addAttribute("userIdSelected", userId);
            model.addAttribute("notCheckRolesList", roleListNoChecked);
            model.addAttribute("checkedRolesList", roleListChecked);
        }
        catch (Exception e)
        {
            if (LOGGER.isErrorEnabled())
            {
                LOGGER.info("Enter func[UserAdminController.setUserRole]" + e);
            }
        }
        return "manager/user/userRole";
    }
    
    /**
     * <一句话功能简述> <功能详细描述>
     * 
     * @see [类、类#方法、类#成员]
     */
    @RequestMapping(value = "/addUserRoles")
    @ResponseBody
    public HttpResult addUserRoles(@ModelAttribute("userId") String userId, @ModelAttribute("roleId") String roleId,
        HttpServletRequest request, HttpServletResponse response)
    {
        HttpResult result = new HttpResult();
        try
        {
            roleManageService.InsertUserRoleRel(userId, roleId);
            result.setResult(HttpStatus.OK);
        }
        catch (Exception e)
        {
            result.setResult("300", "操作失败");
            LOGGER.error("Enter func[UserAdminController.addUserRoles]" + e);
        }
        return result;
    }
    
    /**
     * <一句话功能简述> <功能详细描述>
     * 
     * @see [类、类#方法、类#成员]
     */
    @RequestMapping(value = "/delUserRoles")
    @ResponseBody
    public HttpResult delUserRoles(@ModelAttribute("userId") String userId, @ModelAttribute("roleId") String roleId,
        HttpServletRequest request, HttpServletResponse response)
    {
        HttpResult result = new HttpResult();
        try
        {
            roleManageService.DelUserRoleRel(userId, roleId);
            result.setResult(HttpStatus.OK);
        }
        catch (Exception e)
        {
            result.setResult("300", "操作失败");
            LOGGER.error("Enter func[UserAdminController.addUserRoles]" + e);
        }
        return result;
    }
    
    /**
     * <删除user>
     * 
     * @param response
     * @param request
     */
    @RequestMapping(value = "delete", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public HttpResult deleteByIds(HttpServletResponse response, HttpServletRequest request)
    {
        // 获得所有需要删除的 运营商id
        String[] ids = request.getParameterValues("ids");
        HttpResult result = new HttpResult();
        
        try
        {
            String IDs = "";
            for (int i = 0; i < ids.length; i++)
            {
                // 执行删除操作
                accountService.deleteUser((Long.parseLong(ids[i])));
                IDs += ids[i] + ",";
            }
            IDs = IDs.substring(0, IDs.length() - 1);
            result.setResult(HttpStatus.OK);
            // 写入操作日志
            operationLogService.logOptAsync(OperationType.REMOVE,
                IDs,
                Constant.OPRDATATYPE_USER,
                getCurrentUser().id.longValue());
        }
        catch (Exception e)
        {
            result.setResult("300", "操作失败");
            LOGGER.error("Enter func[UserAdminController.delete]" + e);
        }
        // 返回客户端信息，打印相关信息
        return result;
        
    }
    
    @RequestMapping(value = "pageBatchInfo")
    public String pageBatchInfo(@RequestParam("ids") String ids, ModelMap model)
    {
        model.addAttribute("ids", ids);
        
        return "manager/user/batchInfo";
    }
    
    @RequestMapping(value = "batchModify", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public HttpResult batchModify(@RequestParam("cpCodes") String cpCodes,
        @RequestParam("programTypeIds") String programTypeIds, @RequestParam("materialTypeIds") String materialTypeIds,
        @RequestParam("ids") String ids, HttpServletRequest request)
    {
        HttpResult result = new HttpResult();
        try
        {
            String[] userIds = StringUtils.split(ids, ",");
            List<Long> idList = ArrayUtil.convertStringArrayToLongList(userIds);
            accountService.batchModify(cpCodes, programTypeIds, materialTypeIds, idList);
            result.setResult(HttpStatus.OK);
        }
        catch (Exception ex)
        {
            result.setResult(HttpResult.SYSTEM_ERROR, "操作失败");
            LOGGER.error("Inner func[UserAdminController.batchModify()] catch exception..", ex);
        }
        
        return result;
    }

    /**
     * <查询User信息>
     * @return
     */
    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "getUser")
    @ResponseBody
    public List<List> getUser()
    {
        List<List> result = new ArrayList<List>();
        List<String> list = null;
        List<User> userList = accountService.getAllUser();
        for (User user : userList)
        {
            list = new ArrayList<String>();
            list.add(user.getName() + "");
            list.add(user.getName());
            result.add(list);
        }
        return result;
    }
    
    /**
     * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出User对象,再把Form提交的内容绑定到该对象上。
     * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
     */
    @ModelAttribute
    public void getUser(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model)
    {
        if (id != -1)
        {
            model.addAttribute("user", accountService.getUser(id));
        }
    }
    
}
