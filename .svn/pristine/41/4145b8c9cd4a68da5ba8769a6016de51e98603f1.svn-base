package net.chinaott.cms.web.module.system.service;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import net.chinaott.cms.core.system.entity.SysMenu;
import net.chinaott.cms.core.system.repository.MenuDao;
import net.chinaott.cms.core.system.repository.RoleMenuRelDao;
import net.chinaott.cms.core.system.repository.mybatis.SysMenuMybatisDao;
import net.chinaott.cms.web.utils.persistence.DynamicSpecifications;
import net.chinaott.cms.web.utils.persistence.SearchFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.Collections;
import java.util.Comparator;
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
public class SysMenuService
{
    
    @Autowired
    private MenuDao menuDao;
    
    @Autowired
    private SysMenuMybatisDao menuMyBatisDao;
    
    @Autowired
    private RoleMenuRelDao roleMenuRelDao;
    
    /**
     * <根据 parentId获得menu列表>
     * 
     * @param parentId
     * @return
     */
    public List<SysMenu> getMenuByParentId(Long parentId)
    {
        List<SysMenu> list = menuDao.findByParentIdOrderBySortAsc(parentId);
        for (SysMenu menu : list)
        {
            if (menu != null)
            {
                List<SysMenu> childMenus = getMenuByParentId(menu.getId());
                menu.setChildMenus(childMenus);
            }
        }
        return list;
    }
    
    /**
     * <保存menu>
     * 
     * @param menu
     */
    public void saveMenu(SysMenu menu)
    {
        menuDao.save(menu);
    }

    /**
     * <更新菜单信息>
     * @param parentId
     * @param sort
     */
    public void updateMenu(Long parentId, Integer sort)
    {
        menuMyBatisDao.update(parentId, sort);
    }
    
    /**
     * <根据link删除menu信息-【用于运营商同步删除】>>
     * 
     * @param link
     */
    public void deleteMenu(String link)
    {
        menuMyBatisDao.deleteByMenuLink(link);
    }
    
    /**
     * <根据parentId获得最大的sortnum>
     * 
     * @param parentId
     * @return
     */
    public Integer getMaxSortNumByParentId(Long parentId)
    {
        return menuMyBatisDao.getMaxSortNumByParentId(parentId);
    }
    
    /**
     * <获得菜单管理信息>
     * 
     * @param searchParams
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public Page<SysMenu> getMenuList(Map<String, Object> searchParams, int pageNumber, int pageSize)
    {
        String parentId = "parentId";
        String sortnum = "sort";
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, parentId, sortnum);
        Specification<SysMenu> spec = buildSpecification(searchParams);
        
        return menuDao.findAll(spec, pageRequest);
    }
    
    /**
     * 创建分页请求.
     */
    private PageRequest buildPageRequest(int pageNumber, int pagzSize, String parentId, String sortnum)
    {
        Sort sort = null;
        
        sort = new Sort(Sort.Direction.ASC, parentId);
        sort.and(new Sort(Sort.Direction.ASC, sortnum));
        return new PageRequest(pageNumber - 1, pagzSize, sort);
    }
    
    /**
     * 创建动态查询条件组合.
     */
    private Specification<SysMenu> buildSpecification(Map<String, Object> searchParams)
    {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        Specification<SysMenu> spec = DynamicSpecifications.bySearchFilter(filters.values(), SysMenu.class);
        return spec;
    }
    
    /**
     * <一句话功能简述>
     * 
     * @return
     */
    public List<SysMenu> getAllMenuList()
    {
        return (List<SysMenu>)menuDao.findAll();
    }
    
    /**
     * <根据menuId查询>
     * 
     * @param id
     * @return
     */
    public SysMenu getMenuById(Long id)
    {
        return menuDao.findOne(id);
    }

    /**
     *  <删除 menu>
     * @param menuId
     */
    public void deleteMenuById(Long menuId)
    {
        roleMenuRelDao.deleteByMenuId(menuId);
        menuDao.delete(menuId);
    }

    /**
     * <根据menuId获得sort >
     * @param currMenuId
     * @param relMenuId
     * @param offset
     * @return
     */
    public Integer updateMenuRelSort(Long currMenuId, Long relMenuId, Integer offset)
    {
        return menuMyBatisDao.updateMenuRelSort(currMenuId, relMenuId, offset);
    }
    
    /**
     * 根据userId获取菜单列表
     * 当前菜单较少，采取一次查询后封装
     * 后续菜单增加后，可多次查询DB再封装
     * @param userId
     * @return
     * @see [类、类#方法、类#成员]
     */
    public List<SysMenu> getMenuByUserId(Long userId)
    {
        List<SysMenu> retMenus = Lists.newArrayList();
        List<SysMenu> menus = menuMyBatisDao.findMenuByUserId(userId);
        
        if (!CollectionUtils.isEmpty(menus))
        {
            Map<Long, SysMenu> parentMenus = Maps.newHashMap();
            
            // 封装主menu
            for (SysMenu menu : menus)
            {
                if (menu != null && menu.getParentId() != null && menu.getParentId().longValue() == 0L)
                {
                    parentMenus.put(menu.getId(), menu);
                }
            }
            
            // 封装子menu列表到主menu
            SysMenu parentMenu = null;
            List<SysMenu> childMenus = null;
            for (SysMenu menu : menus)
            {
                if (menu != null && menu.getParentId() != null)
                {
                    parentMenu = parentMenus.get(menu.getParentId());
                    if (parentMenu != null)
                    {
                        childMenus = parentMenu.getChildMenus();
                        if (null == childMenus)
                        {
                            childMenus = Lists.newArrayList();
                        }
                        childMenus.add(menu);
                        
                        parentMenu.setChildMenus(childMenus);
                    }
                }
            }
            
            retMenus = Lists.newArrayList(parentMenus.values());
            
            // 对子menu进行排序
            for (SysMenu sysMenu : retMenus)
            {
                if (sysMenu!=null && sysMenu.getChildMenus()!=null){
                    Collections.sort(sysMenu.getChildMenus(), new Comparator<SysMenu>()
                    {
                        public int compare(SysMenu o1, SysMenu o2)
                        {
                            return o1.getSort() - o2.getSort();
                        }
                    });
                }

            }
            
            // 对主menu进行排序
            Collections.sort(retMenus, new Comparator<SysMenu>()
            {
                public int compare(SysMenu o1, SysMenu o2)
                {
                    return o1.getSort() - o2.getSort();
                }
            });
        }
        
        return retMenus;
    }
}
