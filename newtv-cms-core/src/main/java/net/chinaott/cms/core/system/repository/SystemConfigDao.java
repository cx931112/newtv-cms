package net.chinaott.cms.core.system.repository;

import net.chinaott.cms.core.system.entity.SystemConfig;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface SystemConfigDao extends PagingAndSortingRepository<SystemConfig, Long>, JpaSpecificationExecutor<SystemConfig>
{
    List<SystemConfig> findAll();

    SystemConfig findByConfigName(String configName);
}
