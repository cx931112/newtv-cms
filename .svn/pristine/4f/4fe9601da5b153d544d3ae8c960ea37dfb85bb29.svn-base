/*
 * 文 件 名:  SystemBasicController.java
 * 版    权:  Ysten Technologies Co., Ltd. Copyright YYYY-YYYY,  All rights reserved
 * 描    述:  <描述>
 * 修 改 人:  Administrator
 * 修改时间:  2014年2月25日
 * 跟踪单号:  <跟踪单号>
 * 修改单号:  <修改单号>
 * 修改内容:  <修改内容>
 */
package net.chinaott.cms.web.common.web;

import net.chinaott.cms.core.system.entity.User;
import net.chinaott.cms.core.system.entity.UserRoleRel;
import net.chinaott.cms.web.module.account.service.ShiroDbRealm.ShiroUser;
import net.chinaott.cms.web.module.log.service.OperationLogService;
import net.chinaott.cms.web.module.system.service.*;
import net.chinaott.cms.web.utils.DateProvider;
import net.chinaott.cms.web.utils.SystemConfigLoader;
import net.chinaott.cms.web.utils.constant.Constants;
import net.chinaott.cms.web.utils.web.Servlets;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <通用controller>
 *
 * @author liwei
 * @version [版本号1.10, 2014年2月25日]
 */
public abstract class SystemBasicController {
    private static final Logger LOGGER = LoggerFactory.getLogger(SystemBasicController.class);

    @Autowired
    protected RoleManageService roleService;

    @Autowired
    protected SystemDicService systemDicService;

    @Autowired
    protected SystemConfigLoader systemConfigLoader;

    @Autowired
    protected OperationLogService operationLogService;

    @Autowired
    protected ButtonService buttonService;

    @Autowired
    protected SysMenuService sysMenuService;

    @Autowired
    protected UserService userService;


    protected DateProvider dateProvider = DateProvider.DEFAULT;

    /**
     * 取出Shiro中的当前用户.
     */
    public ShiroUser getCurrentUser() {
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        return user;
    }

    /**
     * <判断登录用户的是否有超级管理员权限>
     *
     * @param userId
     * @return
     */
    public boolean getUserRole(Long userId) {
        List<UserRoleRel> rel = new ArrayList<UserRoleRel>();
        boolean isAdmin = false;
        rel = roleService.getUserRoleRel(getCurrentUser().id);
        for (UserRoleRel r : rel) {
            // 判断该用户是否有超级管理员权限
            if (Constants.ADMINROLE == r.getRoleId()) {
                isAdmin = true;
            }
        }
        return isAdmin;
    }

    /**
     * <查找带回用户名> <功能详细描述>
     *
     * @param type
     * @param pageNum
     * @param numPerPage
     * @param model
     * @param request
     * @see [类、类#方法、类#成员]
     */
    public void bringBackCommonUserName(Integer type, Integer pageNum,
                                        Integer numPerPage, Model model, HttpServletRequest request) {
        String key = request.getParameter("key");
        String value = request.getParameter("value");
        LOGGER.info(
                "Inner func[bringBackCommonUserName()].request params:key:{},"
                        + "value:{},currentPage:{},numPerPage:{}", key, value,
                pageNum, numPerPage);
        Page<User> users = null;
        List<User> userList = null;
        // 取得当前页的数据
        try {
            Map<String, Object> searchParams = Servlets
                    .getParametersStartingWith(request, "search_");

            // 匹配查询条件
            if (StringUtils.isNotBlank(value) && StringUtils.isNotBlank(key)
                    && !"null".equals(key) && !"null".equals(value)) {
                searchParams.put(key.substring("search_".length()), value);
            }
            // 设置通用返回参数
            model.addAttribute("value", value);
            model.addAttribute("key", key);
            model.addAttribute("type", type);
            // 取得当前页的数据
            searchParams.put("NE_roles", "system_user");
            if (type != null && type.equals(1)) {
                userList = userService.findUser(searchParams, new Sort(
                        Sort.Direction.DESC, "id"));
                if (userList != null && userList.size() > 0) {
                    model.addAttribute("users", userList);
                    model.addAttribute("totalCount", userList.size());
                    model.addAttribute("numPerPage", userList.size());
                    model.addAttribute("pageNum", "1");
                    LOGGER.info(
                            "Exit func[bringBackCommonUserName()].get total userNames,totalCount:{}",
                            userList.size() + "");
                } else {
                    LOGGER.warn(
                            "Exit func[bringBackCommonUserName()].totalCount of users,totalCount is null, "
                                    + "request params:keyword:{},values:{},currentPage:{},numPerPage:{}",
                            key, value, "1", userList.size());
                }
            } else {
                users = userService.getUsers(searchParams, pageNum, numPerPage);
                // 设置返回参数
                if (users != null && users.hasContent()) {
                    long totalElements = users.getTotalElements();
                    model.addAttribute("users", users.getContent());
                    model.addAttribute("totalCount", totalElements);
                    model.addAttribute("numPerPage", numPerPage);
                    model.addAttribute("pageNum", pageNum);
                    LOGGER.info(
                            "Exit func[bringBackCommonUserName()].get total userNames,totalCount:{}",
                            totalElements + "");
                } else {
                    LOGGER.warn(
                            "Exit func[bringBackCommonUserName()].totalCount of users,totalCount is null, "
                                    + "request params:keyword:{},values:{},currentPage:{},numPerPage:{}",
                            key, value, pageNum, numPerPage);
                }
            }

        } catch (Exception e) {
            LOGGER.error("Exit func[bringBackCommonUserName()] throw error:", e);
        }
        LOGGER.info("Exit func[bringBackCommonUserName()]");
    }

}
