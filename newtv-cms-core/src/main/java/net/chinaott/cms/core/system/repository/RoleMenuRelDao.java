package net.chinaott.cms.core.system.repository;


import net.chinaott.cms.core.system.entity.RoleMenuRel;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface RoleMenuRelDao extends PagingAndSortingRepository<RoleMenuRel, Long>, JpaSpecificationExecutor<RoleMenuRel>
{
    /**
     * 根据菜单Id和角色Id删除按钮权限 <功能详细描述>
     * @param menuId
     */
    @Modifying
    @Query("delete from RoleMenuRel  where menuId=?1")
    void deleteByMenuId(Long menuId);
    
    List<RoleMenuRel> findByRoleId(Long roleId);
}
