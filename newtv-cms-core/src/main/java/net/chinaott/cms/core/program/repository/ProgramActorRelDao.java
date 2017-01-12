package net.chinaott.cms.core.program.repository;

import net.chinaott.cms.core.program.entity.ProgramActorRel;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ProgramActorRelDao extends PagingAndSortingRepository<ProgramActorRel, String>, JpaSpecificationExecutor<ProgramActorRel>{

}
