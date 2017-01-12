package net.chinaott.cms.core.programseries.repository;

import java.util.List;

import net.chinaott.cms.core.programseries.entity.ProgramSeriesRel;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ProgramSeriesRelDao extends PagingAndSortingRepository<ProgramSeriesRel, Long>, JpaSpecificationExecutor<ProgramSeriesRel>{

    @Query(value = "select t from ProgramSeriesRel t , Program p, ProgramSeries s where t.programId = p.programId and s.programSeriesId = t.programSeriesId and t.programId = ?1")
    List<ProgramSeriesRel> findByProgramId(Long programId);

}
