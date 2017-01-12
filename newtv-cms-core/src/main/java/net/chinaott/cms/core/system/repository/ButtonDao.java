package net.chinaott.cms.core.system.repository;

import net.chinaott.cms.core.system.entity.Button;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface ButtonDao extends PagingAndSortingRepository<Button, String>, JpaSpecificationExecutor<Button>
{
    /**
     * <根据菜单ID获取菜单下的功能权限> <功能详细描述>
     * @param menuId
     * @return
     */
    List<Button> findByMenuId(Long menuId);

    /**
     * <根据buttonCode获取button信息> <功能详细描述>
     * @param buttonCode
     * @return
     */
    Button findByButtonCode(String buttonCode);
    
    /**
     * <根据button code删除>
     * 
     * @param buttonCode
     */
    @Modifying
    @Query("delete from Button where buttonCode=?1")
    void deleteByButtonCode(String buttonCode);
}
