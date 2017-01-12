package net.chinaott.cms.core.program.repository;

import net.chinaott.cms.core.program.entity.ProgramExt;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ProgramExtDao extends PagingAndSortingRepository<ProgramExt, String>, JpaSpecificationExecutor<ProgramExt>{

}
