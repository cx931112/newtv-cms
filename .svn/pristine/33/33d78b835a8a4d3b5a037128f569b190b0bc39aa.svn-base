package net.chinaott.cms.web.module.actor.web;


import lombok.extern.slf4j.Slf4j;
import net.chinaott.cms.core.actor.entity.Actor;
import net.chinaott.cms.core.common.base.Page;
import net.chinaott.cms.web.common.constant.Constant;
import net.chinaott.cms.web.common.exception.ServiceException;
import net.chinaott.cms.web.common.web.BusinessBasicController;
import net.chinaott.cms.web.log.entity.OperationType;
import net.chinaott.cms.web.module.actor.service.ActorWebService;
import net.chinaott.cms.web.module.log.service.OperationLogService;
import net.chinaott.cms.web.utils.ArrayUtil;
import net.chinaott.cms.web.utils.constant.Constants;
import net.chinaott.cms.web.utils.web.HttpResult;
import net.chinaott.cms.web.utils.web.HttpStatus;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yangzhenyu on 17/1/2.
 */
@Controller
@RequestMapping("/actor")
@Slf4j
public class ActorWebController extends BusinessBasicController {

    private static final Logger LOGGER = LoggerFactory.getLogger(ActorWebController.class);

    @Autowired
    private ActorWebService actorWebService;
    @Autowired
    private OperationLogService operationLogService;


    @RequestMapping("/list")
    @ResponseBody
    public ModelAndView query(@RequestParam(defaultValue = Constants.DEFAULT_PAGE_NUM) int pageNum,
                              @RequestParam(defaultValue = Constants.DEFAULT_PAGE_SIZE) int numPerPage,
                              HttpServletRequest request, HttpServletResponse response){
        LOGGER.info("Enter func[/actor/list");

        Map<String,Object> parameterMap = new HashMap<String,Object>();
        String searchName = request.getParameter("searchName");
        String searchValue = request.getParameter("searchValue");
        String isShow = request.getParameter("isShow");
        if (null!=searchName&&searchName.equals("LIKE_actorName")){
            parameterMap.put("actorName",searchValue);
            parameterMap.put("actorId",null);
        }
        if (null!=searchName&&searchName.equals("EQ_actorId")){
            parameterMap.put("actorId",searchValue);
            parameterMap.put("actorName",null);
        }
        if (null!=isShow||"".equals(isShow)){
            parameterMap.put("isShow",isShow);
        }
        ModelAndView view = new ModelAndView("actor/actor_info");
        parameterMap.put("start", (pageNum - 1) * numPerPage);
        parameterMap.put("offset", numPerPage);
        try{
            Page<Actor> actorPage = actorWebService.getActorByConditions(parameterMap);
            view.addObject("page", actorPage);
            view.addObject("searchName",searchName);
            view.addObject("searchValue",searchValue);
            view.addObject("isShow",isShow);

        }catch (Exception e){
            LOGGER.error("Exit func[/actor/list] catch exception..", e);
        }

        return view;
    }


    @RequestMapping("/forceOutActors/{ids}")
    @ResponseBody
    public HttpResult forceOutActors(@PathVariable String ids,
                              HttpServletRequest request, HttpServletResponse response){
        LOGGER.info("Enter func[/forceOutActors/{ids}]",ids);
        HttpResult result = new HttpResult();
        String[] actorIds = ids.split(Constant.SEP_COMMA);
        Map<String,Object> parameterMap = new HashMap<String,Object>();
        try
        {
            List<Long> idList = (List<Long>) ArrayUtil.toList(actorIds, Long.class);
            actorWebService.upateActorsIsShow(idList,Constant.ACTOR_IS_NOT_SHOW);
            result.setResult(HttpStatus.OK);
            for (Long id : idList)
            {
                // 写入操作日志
                operationLogService.logOptAsync(OperationType.IS_NOT_SHOW,
                        String.valueOf(id),
                        Constant.OPRDATATYPE_ACTOR,
                        getCurrentUser().id.longValue());
            }

        } catch (ServiceException e0) {
            // 执行失败则 返回信息 为 ERROR
            result.setResult(HttpResult.SYSTEM_ERROR, e0.getMessage());
            LOGGER.error("Exit func[/forceOutActors/{ids}] catch exception..", e0);
        } catch (Exception e) {
            // 执行失败则 返回信息 为 ERROR
            result.setResult(HttpResult.SYSTEM_ERROR, "操作失败");
            LOGGER.error("Exit func[/forceOutActors/{ids}] catch exception..", e);
        }
        // 页面返回信息
        return result;
    }

    @RequestMapping("/disForceOutActors/{ids}")
    @ResponseBody
    public HttpResult disForceOutActors(@PathVariable String ids,
                                     HttpServletRequest request, HttpServletResponse response){
        LOGGER.info("Enter func[/disForceOutActors/{ids}]",ids);
        HttpResult result = new HttpResult();
        String[] actorIds = ids.split(Constant.SEP_COMMA);
        Map<String,Object> parameterMap = new HashMap<String,Object>();
        try
        {
            List<Long> idList = (List<Long>) ArrayUtil.toList(actorIds, Long.class);
            actorWebService.upateActorsIsShow(idList,Constant.ACTOR_IS_SHOW);
            result.setResult(HttpStatus.OK);
            for (Long id : idList)
            {
                // 写入操作日志
                operationLogService.logOptAsync(OperationType.IS_SHOW,
                        String.valueOf(id),
                        Constant.OPRDATATYPE_ACTOR,
                        getCurrentUser().id.longValue());
            }

        } catch (ServiceException e0) {
            // 执行失败则 返回信息 为 ERROR
            result.setResult(HttpResult.SYSTEM_ERROR, e0.getMessage());
            LOGGER.error("Exit func[/disForceOutActors/{ids}] catch exception..", e0);
        } catch (Exception e) {
            // 执行失败则 返回信息 为 ERROR
            result.setResult(HttpResult.SYSTEM_ERROR, "操作失败");
            LOGGER.error("Exit func[/disForceOutActors/{ids}] catch exception..", e);
        }
        // 页面返回信息
        return result;
    }

    @RequestMapping("/showActorDetail/{id}")
    public String showActorDetail(@PathVariable Long id,ModelMap model){

        LOGGER.info("Enter func[/showActorDetail/{id}]");
        Actor actor = new Actor();
        try{
            Long actorId = id;
            actor = actorWebService.getActorDetail(actorId);
            model.addAttribute("actor",actor);
        }catch (Exception e){
            LOGGER.error("Exit func[showProgramDetail()] throw exception", e);
        }
        return "actor/actor_detail";
    }

}
