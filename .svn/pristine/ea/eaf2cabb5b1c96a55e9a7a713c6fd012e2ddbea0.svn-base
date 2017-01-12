package net.chinaott.cms.core.system.repository;

import net.chinaott.cms.core.system.entity.User;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface UserDao extends PagingAndSortingRepository<User, Long>, JpaSpecificationExecutor<User>
{
    /**
     * <根据登陆名查询用户信息>
     * 
     * @param loginName
     * @return
     */
    User findByLoginName(String loginName);
    
    @Query("select u.id from User u where u.roles = ?1 and u.platformId = ?2")
    Long getInfUserId(String roles, Long platformId);
    
    @Query("select u.name from User u where u.id = ?1")
    String getOperUserName(Long operUserId);
    
    @Modifying
    @Query("update User u set u.cpCodes=?1,u.programTypeIds=?2,u.materialTypeIds=?3 where u.id in (?4)")
    void batchModify(String cpCodes, String programTypeIds, String materialTypeIds, List<Long> ids);
}
