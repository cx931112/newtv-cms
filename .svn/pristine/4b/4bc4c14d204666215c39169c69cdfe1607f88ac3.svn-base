package net.chinaott.cms.core.programseries.repository;

import java.util.List;

import net.chinaott.cms.core.programseries.entity.ProgramSeries;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ProgramSeriesDao extends PagingAndSortingRepository<ProgramSeries, Long>, JpaSpecificationExecutor<ProgramSeries>{

    @Query(value = "select t from ProgramSeries t , Program p, ProgramSeriesRel s where t.programSeriesId = s.programSeriesId and s.programId = p.programId and p.programId = ?1")
    List<ProgramSeries> findByProgramId(Long programId);

}
