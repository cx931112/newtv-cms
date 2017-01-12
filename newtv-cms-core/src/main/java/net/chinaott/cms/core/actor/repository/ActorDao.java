package net.chinaott.cms.core.actor.repository;

import net.chinaott.cms.core.actor.entity.Actor;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ActorDao extends PagingAndSortingRepository<Actor, String>, JpaSpecificationExecutor<Actor>{

}
