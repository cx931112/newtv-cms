package net.chinaott.cms.web.module.publicinfo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import net.chinaott.cms.core.publicinfo.entity.OperatePlatform;
import net.chinaott.cms.core.publicinfo.repository.OperatePlatformDao;

import net.chinaott.cms.web.utils.persistence.DynamicSpecifications;
import net.chinaott.cms.web.utils.persistence.SearchFilter;
@Component
@Transactional(value="cmsTransactionManager")
public class OperatePlatformService {
	@Autowired
	private OperatePlatformDao operatePlatformDao;
	//条件查询和页面list显示
public Page<OperatePlatform> queryAllOperatePlatform(Map<String, Object> searchParams, int pageNumber, int pageSize){
    PageRequest pageRequest = buildPageRequest(pageNumber, pageSize);
    Specification<OperatePlatform> spec =buildSpecification(searchParams);
    
	return operatePlatformDao.findAll(spec, pageRequest);
}
public OperatePlatform findOperatePlatformById(Integer id){
	return operatePlatformDao.findById(id).get(0);
}
public void saveOperatePlatform(OperatePlatform operatePlatform){
	operatePlatformDao.save(operatePlatform);
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
private Specification<OperatePlatform> buildSpecification(Map<String, Object> searchParams)
{
    Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
    Specification<OperatePlatform> spec = DynamicSpecifications.bySearchFilter(filters.values(), OperatePlatform.class);
    return spec;
}

}
