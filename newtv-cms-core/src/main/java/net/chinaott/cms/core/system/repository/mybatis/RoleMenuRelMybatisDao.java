package net.chinaott.cms.core.system.repository.mybatis;

import net.chinaott.cms.core.common.repository.mybatis.MyBatisRepository;
import net.chinaott.cms.core.system.entity.RoleMenuRel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <> <功能详细描述>
 * 
 * @author liwei
 * @version [1.0, 2013-11-22]
 */
@MyBatisRepository
public interface RoleMenuRelMybatisDao
{
    public void deleteRoleMenuByRoleId(@Param(value = "roleId") Long roleId);
    
    public void insertAllId(@Param(value = "roleId") Long roleId, @Param(value = "menuId") Long menuId);
    
    public List<RoleMenuRel> getRelByRoleId(@Param(value = "roleId") Long roleId);
    
}
