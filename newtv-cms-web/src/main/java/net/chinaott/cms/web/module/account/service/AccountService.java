package net.chinaott.cms.web.module.account.service;

import net.chinaott.cms.core.system.entity.User;
import net.chinaott.cms.core.system.repository.UserDao;
import net.chinaott.cms.web.common.exception.ServiceException;
import net.chinaott.cms.web.common.security.utils.Digests;
import net.chinaott.cms.web.module.account.service.ShiroDbRealm.ShiroUser;
import net.chinaott.cms.web.utils.DateProvider;
import net.chinaott.cms.web.utils.Encodes;
import net.chinaott.cms.web.utils.persistence.DynamicSpecifications;
import net.chinaott.cms.web.utils.persistence.SearchFilter;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
 * 用户管理类.
 * 
 * @author mahc
 */
// Spring Service Bean的标识.
@Component
@Transactional(value = "cmsTransactionManager")
public class AccountService
{

	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	private static final int SALT_SIZE = 8;

	private static Logger logger = LoggerFactory.getLogger(AccountService.class);

	private UserDao userDao;
	private DateProvider dateProvider = DateProvider.DEFAULT;

	/**
	 * <获得用户信息列表>
	 * 
	 * @param searchParams
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public Page<User> getUserList(Map<String, Object> searchParams, int pageNumber, int pageSize)
	{
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize);
		Specification<User> spec = buildSpecification(searchParams);
		return userDao.findAll(spec, pageRequest);
	}

	public List<User> getAllUser()
	{
		return (List<User>) userDao.findAll();
	}

	public User getUser(Long id)
	{
		return userDao.findOne(id);
	}

	public User findUserByLoginName(String loginName)
	{
		return userDao.findByLoginName(loginName);
	}

	public void registerUser(User user)
	{
		entryptPassword(user);
		user.setRoles("user");
		user.setRegisterDate(dateProvider.getDate());
		user.setPlatformId(1L);//设置默认平台为1
		userDao.save(user);
	}

	public void addSystemUser(User user)
	{
		// entryptPassword(user);
		user.setRegisterDate(dateProvider.getDate());
		userDao.save(user);
	}

	public void updateUser(User user)
	{
		if (StringUtils.isNotBlank(user.getPlainPassword()))
		{
			entryptPassword(user);
		}
		userDao.save(user);
	}

	public void deleteUser(Long id)
	{
		if (isSupervisor(id))
		{
			logger.warn("操作员{}尝试删除超级管理员用户", getCurrentUserName());
			throw new ServiceException("不能删除超级管理员用户");
		}
		userDao.delete(id);

	}

	public void batchModify(String cpCodes, String programTypeIds, String materialTypeIds,
			List<Long> ids)
	{
		userDao.batchModify(cpCodes, programTypeIds, materialTypeIds, ids);
	}

	/**
	 * 判断是否超级管理员.
	 */
	private boolean isSupervisor(Long id)
	{
		return id == 1;
	}

	/**
	 * 取出Shiro中的当前用户LoginName.
	 */
	private String getCurrentUserName()
	{
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user.loginName;
	}

	/**
	 * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
	 */
	private void entryptPassword(User user)
	{
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		user.setSalt(Encodes.encodeHex(salt));

		byte[] hashPassword = Digests.sha1(user.getPlainPassword().getBytes(), salt,
				HASH_INTERATIONS);
		user.setPassword(Encodes.encodeHex(hashPassword));
	}

	@Autowired
	public void setUserDao(UserDao userDao)
	{
		this.userDao = userDao;
	}

	public void setDateProvider(DateProvider dateProvider)
	{
		this.dateProvider = dateProvider;
	}

	/**
	 * 创建分页请求.
	 */
	private PageRequest buildPageRequest(int pageNumber, int pagzSize)
	{
		Sort sort = null;
		return new PageRequest(pageNumber - 1, pagzSize, sort);
	}

	/**
	 * 创建动态查询条件组合.
	 */
	private Specification<User> buildSpecification(Map<String, Object> searchParams)
	{
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		// filters.put("firm.firmId", new SearchFilter("firm.firmId",
		// Operator.EQ, userId));
		Specification<User> spec = DynamicSpecifications.bySearchFilter(filters.values(),
				User.class);
		return spec;
	}
}
