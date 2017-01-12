package net.chinaott.cms.core.program.repository;

import java.util.List;

import net.chinaott.cms.core.program.entity.ProgramBitrate;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ProgramBitrateDao extends PagingAndSortingRepository<ProgramBitrate, String>, JpaSpecificationExecutor<ProgramBitrate>{

    List<ProgramBitrate> findByProgramId(Long programId);

}
