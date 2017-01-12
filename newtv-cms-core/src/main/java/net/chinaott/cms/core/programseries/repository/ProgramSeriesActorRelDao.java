package net.chinaott.cms.core.programseries.repository;

import net.chinaott.cms.core.programseries.entity.ProgramSeriesActorRel;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ProgramSeriesActorRelDao extends PagingAndSortingRepository<ProgramSeriesActorRel, String>, JpaSpecificationExecutor<ProgramSeriesActorRel>{

}
