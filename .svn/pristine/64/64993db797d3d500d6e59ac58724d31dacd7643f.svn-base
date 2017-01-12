package net.chinaott.cms.web.module.system.service;

import net.chinaott.cms.core.system.entity.SystemConfig;
import net.chinaott.cms.core.system.repository.SystemConfigDao;
import net.chinaott.cms.web.utils.persistence.DynamicSpecifications;
import net.chinaott.cms.web.utils.persistence.SearchFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Component
@Transactional(value = "cmsTransactionManager")
public class SystemConfigService
{
    @Autowired
    private SystemConfigDao systemConfigDao;
    
    public List<SystemConfig> queryAllSystemConfig()
    {
        return systemConfigDao.findAll();
    }

    /**
     *  <根据ID删除配置信息>
     * @param id
     */
    public void deleteConfigById(Long id)
    {
        systemConfigDao.delete(id);
    }
    
    /**
     * <分页查询配置信息>
     * 
     * @param searchParams
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public Page<SystemConfig> getSystemConfigList(Map<String, Object> searchParams, int pageNumber, int pageSize)
    {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize);
        Specification<SystemConfig> spec = buildSpecification(searchParams);
        return systemConfigDao.findAll(spec, pageRequest);
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
    private Specification<SystemConfig> buildSpecification(Map<String, Object> searchParams)
    {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        Specification<SystemConfig> spec = DynamicSpecifications.bySearchFilter(filters.values(), SystemConfig.class);
        return spec;
    }
    
    /**
     * <查询配置>
     * 
     * @param id
     * @return
     */
    public SystemConfig getSystemConfigById(Long id)
    {
        return systemConfigDao.findOne(id);
    }
    
    /**
     * <保存>
     * 
     * @param config
     */
    public void saveSystemConfig(SystemConfig config)
    {
        systemConfigDao.save(config);
    }

    /** <一句话功能简述>
     * @param configName
     * @return
     */
    public SystemConfig getSystemConfigByName(String configName)
    {
        return systemConfigDao.findByConfigName(configName);
    }
}