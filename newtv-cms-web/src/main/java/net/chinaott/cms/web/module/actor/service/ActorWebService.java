package net.chinaott.cms.web.module.actor.service;

import net.chinaott.cms.core.actor.entity.Actor;
import net.chinaott.cms.core.actor.repository.mybatis.ActorMybatisDao;
import net.chinaott.cms.core.common.base.Page;
import net.chinaott.cms.web.common.constant.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created by yangzhenyu on 17/1/2.
 */
@Service
public class ActorWebService {

    @Autowired
    private ActorMybatisDao actorMybatisDao;

    public Page<Actor> getActorByConditions(Map parameterMap){

        List<Actor> actors = actorMybatisDao.getActorList(parameterMap);
        Integer count = actorMybatisDao.getActorCount(parameterMap);
        return new Page<Actor>().instanceByStartRow(actors,count,(Integer)parameterMap.get("start"),(Integer)parameterMap.get("offset"));
    }

    @Transactional
    public void upateActorsIsShow(List<Long> actorIds,Integer isShow){
        if (null!=actorIds&&actorIds.size()>0){
            for (Long id:actorIds){
                Actor actor = new Actor();
                actor.setActorId(id);
                actor.setIsShow(isShow);
                actorMybatisDao.updateActorIsShow(actor);
            }
            //TODO
        }
    }

    public Actor getActorDetail(Long actorId){

        Actor actor = new Actor();
        actor.setActorId(actorId);
        actor = actorMybatisDao.getActorDetailById(actor);
        return actor;
    }

}
