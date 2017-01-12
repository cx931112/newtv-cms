package net.chinaott.cms.web.module.system.service;

import net.chinaott.cms.core.system.entity.Role;
import net.chinaott.cms.core.system.entity.RoleButtonRel;
import net.chinaott.cms.core.system.entity.RoleMenuRel;
import net.chinaott.cms.core.system.entity.UserRoleRel;
import net.chinaott.cms.core.system.repository.RoleButtonRelDao;
import net.chinaott.cms.core.system.repository.RoleDao;
import net.chinaott.cms.core.system.repository.mybatis.RoleMenuRelMybatisDao;
import net.chinaott.cms.core.system.repository.mybatis.UserRoleRelMybatisDao;
import net.chinaott.cms.web.module.account.service.ShiroDbRealm.ShiroUser;
import net.chinaott.cms.web.utils.persistence.DynamicSpecifications;
import net.chinaott.cms.web.utils.persistence.SearchFilter;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * <角色管理接口> <处理角色信息接口>
 * 
 * @author liwei
 * @version [1.0, 2013-11-21]
 */
@Component
@Transactional(value = "cmsTransactionManager")
public class RoleManageService
{
    
    @Autowired
    private RoleDao roleDao;
    
    /**
     * 角色-菜单
     */
    @Autowired
    private RoleMenuRelMybatisDao roleMenuDao;
    
    /**
     * 用户
     */
    @Autowired
    private UserRoleRelMybatisDao userRoleDao;
    
    @Autowired
    private RoleButtonRelDao roleButtonRelDao;
    
    public static final String BUTTON_PREFIX="button_";
    
    /**
     * <保存角色信息>
     * 
     * @param entity
     */
    public void saveRole(Role entity)
    {
        roleDao.save(entity);
    }
    
    /**
     * <更新角色和菜单关系信息>
     * 
     * @param menuId
     * @param roleId
     */
    public void updateRoleMenuRel(String menuId, String roleId)
    {
        Long id = Long.valueOf(roleId);
        roleMenuDao.deleteRoleMenuByRoleId(id);
        if (!"".equals(menuId))
        {
            String[] menuIds = menuId.split(",");
            roleButtonRelDao.deleteRoleButtonByRoleId(Long.parseLong(roleId));
            for (String ids : menuIds)
            {   
                if(ids.startsWith(BUTTON_PREFIX)){
                    ShiroUser user = (ShiroUser)SecurityUtils.getSubject().getPrincipal();
                    Long userId = null;
                    if(user!=null){
                        userId = user.id;
                    }
                    String buttonCode = ids.substring(ids.indexOf(BUTTON_PREFIX)+BUTTON_PREFIX.length());
                    roleButtonRelDao.save(new RoleButtonRel(buttonCode,Long.parseLong(roleId), userId, new Date(), null));
                }else{
                    roleMenuDao.insertAllId(id, Long.valueOf(ids));
                }
            }
        }
    }
    
    /**
     * <更新角色和用户关系信息>
     * 
     * @param userId
     * @param roleId
     */
    public void InsertUserRoleRel(String userId, String roleId)
    {
        Long rId = Long.valueOf(roleId);
        Long uId = Long.valueOf(userId);
        int count = userRoleDao.getCountByUserRoleId(uId, rId);
        if (1 > count)
        {
            // System.out.println(count);
            userRoleDao.insertUserRoleAllId(uId, rId);
        }
    }
    
    /**
     * <删除角色和用户关系信息>
     * 
     * @param userId
     * @param roleId
     */
    public void DelUserRoleRel(String userId, String roleId)
    {
        Long rId = Long.valueOf(roleId);
        Long uId = Long.valueOf(userId);
        userRoleDao.deleteUserRoleByUserRoleId(uId, rId);
        
    }
    
    /**
     * <根据roleId 获取角色和菜单的关系信息>
     * 
     * @param roleId
     * @return
     */
    public List<RoleMenuRel> getRoleMenuRel(Long roleId)
    {
        return roleMenuDao.getRelByRoleId(roleId);
    }

    /**
     * <根据userId 获取用户和角色的关系信息>
     * @param userId
     * @return
     */
    public List<UserRoleRel> getUserRoleRel(Long userId)
    {
        List<UserRoleRel> rel = new ArrayList<UserRoleRel>();
        rel = userRoleDao.getRelByUserId(userId);
        return rel;
    }
    
    /**
     * <根据id获得角色信息>
     * 
     * @param id
     * @return
     * @see [类、类#方法、类#成员]
     */
    public Role getRole(Long id)
    {
        return roleDao.findOne(id);
    }
    
    /**
     * <获得所有角色信息>
     * 
     * @return
     */
    public List<Role> getAllRole()
    {
        return roleDao.findAll();
    }
    
    /**
     * <删除角色信息>
     * 
     * @param id
     */
    public void deleteRole(Long id)
    {
        roleDao.delete(id);
        userRoleDao.deleteUserRoleByRoleId(id);
    }
    
    /**
     * <获得角色信息列表>
     * 
     * @param searchParams
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public Page<Role> getRoleList(Map<String, Object> searchParams, int pageNumber, int pageSize)
    {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize);
        Specification<Role> spec = buildSpecification(searchParams);
        return roleDao.findAll(spec, pageRequest);
    }
    
    /**
     * <获得用户没有绑定的角色信息列表>
     * 
     * @param roleId
     * @return
     */
    public List<Role> getRoleLists(List<Long> roleId)
    {
        return roleDao.findByIdNotIn(roleId);
        
    }
    
    /**
     * <根据角色名查询>
     * 
     * @param roleName
     * @return
     */
    public Role findRoleByName(String roleName)
    {
        return roleDao.findByName(roleName);
    }
    

    /** <一句话功能简述>
     * @param roleName
     * @param roleId
     * @return
     */
    public Role findRoleByNameAndId(String roleName, Long roleId)
    {
        return roleDao.findByIdAndName(roleId,roleName);
    }
    
    /**
     * 创建分页请求.
     */
    private PageRequest buildPageRequest(int pageNumber, int pagzSize)
    {
        Sort sort = null;
        return new PageRequest(pageNumber - 1, pagzSize, sort);
    }
    
    /**
     * 创建动态查询条件组合.
     */
    private Specification<Role> buildSpecification(Map<String, Object> searchParams)
    {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        Specification<Role> spec = DynamicSpecifications.bySearchFilter(filters.values(), Role.class);
        return spec;
    }

    /** <一句话功能简述>
     * @param roleId
     * @return
     */
    public Role findOne(Long roleId)
    {
        return roleDao.findOne(roleId);
    }

    public List<String> findRoleButtonCodesByRoleId(Long roleId){
        List<String> buttonCode = new ArrayList<String>();
        List<RoleButtonRel> roleButtonList = roleButtonRelDao.findByRoleId(roleId);
        for(RoleButtonRel roleButtonRel : roleButtonList){
            buttonCode.add(roleButtonRel.getButtonCode());
        }
        return buttonCode;
    }
}
