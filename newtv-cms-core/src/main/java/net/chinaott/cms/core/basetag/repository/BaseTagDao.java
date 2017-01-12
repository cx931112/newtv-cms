package net.chinaott.cms.core.basetag.repository;

import net.chinaott.cms.core.basetag.entity.BaseTag;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface BaseTagDao extends PagingAndSortingRepository<BaseTag, String>, JpaSpecificationExecutor<BaseTag>{

}
