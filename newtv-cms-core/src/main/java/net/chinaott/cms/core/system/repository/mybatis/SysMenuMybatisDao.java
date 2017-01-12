package net.chinaott.cms.core.system.repository.mybatis;

import net.chinaott.cms.core.common.repository.mybatis.MyBatisRepository;
import net.chinaott.cms.core.system.entity.SysMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现. 方法名称必须与Mapper.xml中保持一致.
 * 
 * @author mahc
 */
@MyBatisRepository
public interface SysMenuMybatisDao
{
    
    /**
     * <根据parentId 查询相关联的最大的sortNum>
     * 
     * @param parentId
     * @return
     */
    public Integer getMaxSortNumByParentId(@Param(value = "parentId") Long parentId);
    
    /**
     * <根据link删除menu信息-【用于平台同步删除】>
     * 
     * @param link
     */
    public void deleteByMenuLink(String link);

    /**
     * <更新菜单信息>
     * @param parentId
     * @param sort
     */
    public void update(@Param(value = "parentId") Long parentId, @Param(value = "sort") Integer sort);
    
    /**
     * 更新
     * @param currMenuId
     * @param relMenuId
     * @param offset   
     */
    public Integer updateMenuRelSort(@Param(value = "currMenuId") Long currMenuId, @Param(value = "relMenuId") Long relMenuId, @Param(value = "offset") Integer offset);

    /**
     * <根据用户id获取菜单列表>
     * @param userId
     * @return
     * @see [类、类#方法、类#成员]
     */
    public List<SysMenu> findMenuByUserId(@Param(value = "userId") Long userId);
}
