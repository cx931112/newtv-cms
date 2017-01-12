package net.chinaott.cms.core.basicinfo.repository;

import net.chinaott.cms.core.basicinfo.entity.ProgramStatus;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ProgramStatusDao extends PagingAndSortingRepository<ProgramStatus, String>, JpaSpecificationExecutor<ProgramStatus>{

}
