package net.chinaott.cms.core.system.repository;

import net.chinaott.cms.core.system.entity.Role;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface RoleDao extends PagingAndSortingRepository<Role, Long>, JpaSpecificationExecutor<Role>
{
    /**
     * <查询不在 所选roleid的 其他角色列表>
     * 
     * @param roleId
     * @return
     */
    List<Role> findByIdNotIn(List<Long> roleId);
    
    /**
     * <查询所有角色>
     * 
     * @return
     */
    List<Role> findAll();
    
    /**
     * <一句话功能简述>
     * 
     * @param roleName
     * @return
     */
    Role findByName(String roleName);
    
    /**
     * <一句话功能简述>
     * 
     * @param roleId
     * @param roleName
     * @return
     */
    @Query("select p from Role p where name =?2 and id !=?1")
    Role findByIdAndName(Long roleId, String roleName);
}
