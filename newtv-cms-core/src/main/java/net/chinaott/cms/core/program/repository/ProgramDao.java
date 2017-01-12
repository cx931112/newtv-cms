package net.chinaott.cms.core.program.repository;

import java.util.List;

import net.chinaott.cms.core.program.entity.Program;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ProgramDao extends PagingAndSortingRepository<Program, Long>, JpaSpecificationExecutor<Program>{

    @Modifying
    @Query("UPDATE Program t SET t.status = ?2, t.statusTime = NOW(), t.updateUser = ?3 WHERE t.programId IN (?1)")
    void updateStatus(List<Long> programIds, String status, String loginName);
}
