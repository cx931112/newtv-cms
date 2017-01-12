package net.chinaott.cms.core.program.repository;

import net.chinaott.cms.core.program.entity.CdnTask;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface CdnTaskDao extends PagingAndSortingRepository<CdnTask, Long>, JpaSpecificationExecutor<CdnTask>{

}
