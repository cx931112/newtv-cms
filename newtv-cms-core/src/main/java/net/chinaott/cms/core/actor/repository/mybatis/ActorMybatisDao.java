package net.chinaott.cms.core.actor.repository.mybatis;

import net.chinaott.cms.core.actor.entity.Actor;
import net.chinaott.cms.core.common.repository.mybatis.MyBatisRepository;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@MyBatisRepository
public interface ActorMybatisDao {

    List<Actor> getActorList(Map parameterMap);
    Integer getActorCount(Map parameterMap);
    void updateActorIsShow(Actor actor);
    Actor getActorDetailById(Actor actor);

}
