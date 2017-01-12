package net.chinaott.cms.core.programseries.repository;

import net.chinaott.cms.core.programseries.entity.ProgramSeriesAudit;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ProgramSeriesAuditDao extends PagingAndSortingRepository<ProgramSeriesAudit, String>, JpaSpecificationExecutor<ProgramSeriesAudit>{

}
