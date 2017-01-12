package net.chinaott.cms.core.system.repository;

import net.chinaott.cms.core.system.entity.SysMenu;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface MenuDao extends PagingAndSortingRepository<SysMenu, Long>, JpaSpecificationExecutor<SysMenu>
{
    /**
     * 根据父id获取menu
     * 
     * @param parentId
     * @return
     */
    List<SysMenu> findByParentId(Long parentId);
    
    /**
     * 根据id获取menu
     * 
     * @param id
     * @return
     */
    List<SysMenu> findById(Long id);
    
    /**
     * <根据父id获取menu>
     * 
     * @param parentId
     * @return
     */
    List<SysMenu> findByParentIdOrderBySortAsc(Long parentId);

}
