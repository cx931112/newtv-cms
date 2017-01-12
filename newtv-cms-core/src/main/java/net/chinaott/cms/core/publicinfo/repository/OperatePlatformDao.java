package net.chinaott.cms.core.publicinfo.repository;

import java.util.List;

import net.chinaott.cms.core.publicinfo.entity.OperatePlatform;
import net.chinaott.cms.core.system.entity.SystemConfig;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
//继承PagingAndSortingRepository使用泛型传入实体类名和id类型
public interface OperatePlatformDao extends PagingAndSortingRepository<OperatePlatform, Integer>, JpaSpecificationExecutor<OperatePlatform>
{
/*List <OperatePlatform> findAll();*/

List<OperatePlatform> findById(Integer id);
}
