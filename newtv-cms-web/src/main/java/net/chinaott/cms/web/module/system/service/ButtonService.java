package net.chinaott.cms.web.module.system.service;

import net.chinaott.cms.core.system.entity.Button;
import net.chinaott.cms.core.system.entity.RoleButtonRel;
import net.chinaott.cms.core.system.entity.UserRoleRel;
import net.chinaott.cms.core.system.repository.ButtonDao;
import net.chinaott.cms.core.system.repository.RoleButtonRelDao;
import net.chinaott.cms.core.system.repository.mybatis.UserRoleRelMybatisDao;
import net.chinaott.cms.web.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
/**
 * 
 * 按钮服务
 * <功能详细描述>
 * 
 * @author  Peter
 * @version  [版本号, 2014年5月21日]
 * @see  [相关类/方法]
 * @since  [产品/模块版本]
 */
@Component
@Transactional(value="cmsTransactionManager")
public class ButtonService
{
    
    @Autowired
    private RoleButtonRelDao roleButtonRelDao;
    @Autowired
    private ButtonDao buttonDao;
    @Autowired
    private UserRoleRelMybatisDao userRoleRelMybatisDao;
    
    /**
     * 根据用户ID查询该用户下的所有有权限的的按钮代码
     * <功能详细描述>
     * @param userId
     * @return
     * @see [类、类#方法、类#成员]
     */
    public List<String> findButtonCodesByUserId(Long userId){
        List<String> buttonList = new ArrayList<String>();
        List<UserRoleRel> userRoleRels =userRoleRelMybatisDao.getRelByUserId(userId);
        for(UserRoleRel userRoleRel:userRoleRels){
            buttonList.addAll(this.findRoleButtonCodesByRoleId(userRoleRel.getRoleId()));
        }
        return buttonList;
    }
    /**
     * 根据角色ID查询该角色下的所有有权限的按钮代码
     * <功能详细描述>
     * @param roleId
     * @return
     * @see [类、类#方法、类#成员]
     */
    public List<String> findRoleButtonCodesByRoleId(Long roleId){
        List<String> buttonCode = new ArrayList<String>();
        List<RoleButtonRel> roleButtonList = roleButtonRelDao.findByRoleId(roleId);
        for(RoleButtonRel roleButtonRel : roleButtonList){
            buttonCode.add(roleButtonRel.getButtonCode());
        }
        return buttonCode;
    }

    /**
     * 获取按钮分页列表
     * <功能详细描述>
     * @param searchParams
     * @param pageNumber
     * @param pageSize
     * @param direction
     * @param orderBy
     * @return
     * @see [类、类#方法、类#成员]
     */
    public Page<Button> getButtonList(Map<String, Object> searchParams, int pageNumber, int pageSize, String direction,
        String orderBy)
    {
        PageRequest pageRequest = PageUtil.buildPageRequest(pageNumber, pageSize, direction, orderBy);
        Specification<Button> spec = PageUtil.buildSpecification(searchParams, Button.class);
        return buttonDao.findAll(spec, pageRequest);
    }
    /**
     * 根据按钮代码查询按钮信息
     * <功能详细描述>
     * @param buttonCode
     * @return
     * @see [类、类#方法、类#成员]
     */
    public Button findByButtonCode(String buttonCode){
        return buttonDao.findByButtonCode(buttonCode);
    }

    /**
     * 保存按钮信息
     * @param button
     */
    public void saveButton(Button button)
    {
        buttonDao.save(button);
    }

    /**
     * 删除按钮信息以及其与角色的关系
     * <功能详细描述>
     * @param buttonCode
     * @see [类、类#方法、类#成员]
     */
    public void deleteButtonByButtonCode(String buttonCode)
    {
        roleButtonRelDao.deleteByButtonCode(buttonCode);
        buttonDao.deleteByButtonCode(buttonCode);
    }
}
