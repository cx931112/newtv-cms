package net.chinaott.cms.web.module.system.service;

import net.chinaott.cms.core.system.entity.User;
import net.chinaott.cms.core.system.repository.UserDao;
import net.chinaott.cms.web.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * <用户信息接口>
 * 
 * @author gy
 * @version [版本号, 2014年6月15日]
 * @see [相关类/方法]
 * @since [产品/模块版本]
 */
@Component
@Transactional(value = "cmsTransactionManager")
public class UserService
{
    @Autowired
    private UserDao userDao;

    /**
     *  <查询分页返回的用户列表信息>
     * @param searchParams
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public Page<User> getUsers(Map<String, Object> searchParams, int pageNumber, int pageSize)
    {
        PageRequest pageRequest = PageUtil.buildPageRequest(pageNumber, pageSize);
        Specification<User> spec = PageUtil.buildSpecification(searchParams, User.class);
        return userDao.findAll(spec, pageRequest);
    }
    
    public List<User> findUser(Map<String, Object> searchParams, Sort sort)
    {
        Specification<User> spec = PageUtil.buildSpecification(searchParams, User.class);
        return userDao.findAll(spec, sort);
    }
}
