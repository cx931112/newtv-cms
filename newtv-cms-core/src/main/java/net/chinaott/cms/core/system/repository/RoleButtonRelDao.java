package net.chinaott.cms.core.system.repository;

import net.chinaott.cms.core.system.entity.RoleButtonRel;
import net.chinaott.cms.core.system.entity.RoleButtonRelPK;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface RoleButtonRelDao extends PagingAndSortingRepository<RoleButtonRel, RoleButtonRelPK>, JpaSpecificationExecutor<RoleButtonRel>
{
    /**
     * 根据角色ID查询角色按钮权限关系
     * <功能详细描述>
     * @param roleId
     * @return
     * @see [类、类#方法、类#成员]
     */
    List<RoleButtonRel> findByRoleId(Long roleId);
    /**
     * 根据按钮代码查询角色按钮权限关系
     * <功能详细描述>
     * @param buttonCode
     * @return
     * @see [类、类#方法、类#成员]
     */
    List<RoleButtonRel> findByButtonCode(String buttonCode);
    /**
     * 删除角色对应的按钮权限
     * <功能详细描述>
     * @param roleId
     * @see [类、类#方法、类#成员]
     */
    @Modifying
    @Query("delete from RoleButtonRel u where u.roleId=?1")
    void deleteRoleButtonByRoleId(Long roleId);
    /**
     * 根据按钮代码删除按钮权限
     * <功能详细描述>
     * @param buttonCode
     * @see [类、类#方法、类#成员]
     */
    @Modifying
    @Query("delete from RoleButtonRel u where u.buttonCode=?1")
    void deleteByButtonCode(String buttonCode);
    /**
     * 根据按钮代码删除按钮权限
     * <功能详细描述>
     * @param buttonCode
     * @see [类、类#方法、类#成员]
     */
    @Modifying
    @Query("update RoleButtonRel u set u.buttonCode = ?1 where u.roleId = ?2")
    void updateButtonCodeByRoleId(String buttonCode, Long roleId);
}
