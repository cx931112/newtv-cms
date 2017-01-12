package net.chinaott.cms.core.system.repository.mybatis;

import net.chinaott.cms.core.common.repository.mybatis.MyBatisRepository;
import net.chinaott.cms.core.system.entity.UserRoleRel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <> <功能详细描述>
 *
 * @author liwei
 * @version [1.0, 2013-11-22]
 */
@MyBatisRepository
public interface UserRoleRelMybatisDao {
    public void deleteUserRoleByUserId(@Param(value = "userId") Long userId);

    public void deleteUserRoleByUserRoleId(@Param(value = "userId") Long userId, @Param(value = "roleId") Long roleId);

    public int getCountByUserRoleId(@Param(value = "userId") Long userId, @Param(value = "roleId") Long RoleId);

    public void insertUserRoleAllId(@Param(value = "userId") Long userId, @Param(value = "roleId") Long roleId);

    public List<UserRoleRel> getRelByUserId(@Param(value = "userId") Long userId);

    public void deleteUserRoleByRoleId(@Param(value = "roleId") Long roleId);

}
