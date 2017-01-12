package net.chinaott.cms.web.module.publicinfo.web;

import java.util.Map;

import javax.servlet.ServletRequest;

import net.chinaott.cms.core.publicinfo.entity.OperatePlatform;
import net.chinaott.cms.web.module.publicinfo.service.OperatePlatformService;
import net.chinaott.cms.web.module.system.web.SystemConfigController;
import net.chinaott.cms.web.utils.web.Servlets;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/publicinfo")
public class PublicInfoWebController {
	private static final Logger LOGGER = LoggerFactory.getLogger(SystemConfigController.class);
	@Autowired
	private OperatePlatformService operatePlatformService;
	@RequestMapping("/operateplatform")
public ModelAndView toPlatForm(@RequestParam(value = "pageNum", defaultValue = "1") int pageNumber,
        @RequestParam(value = "numPerPage", defaultValue = "20") int pageSize,
        @RequestParam(value = "isAdvencedSearch", defaultValue = "0") Integer isAdvencedSearch,
        ServletRequest request){
		ModelAndView modelAndView=new ModelAndView();
		//获取查询条件
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		
		try{
			Page<OperatePlatform> operatePlatformList=operatePlatformService.queryAllOperatePlatform(searchParams, pageNumber, pageSize);
		
			modelAndView.addObject("operatePlatformList", operatePlatformList);
			modelAndView.addObject("totalCount", operatePlatformList.getTotalElements());
            if (isAdvencedSearch.intValue() != 0)
            {
                if (null != request.getParameter("searchName"))
                    searchParams.put(request.getParameter("searchName"), request.getParameter("searchValue"));
            }
			
		}catch(Exception e){
			if (LOGGER.isErrorEnabled())
            {
                LOGGER.error("Inner func[toPlatForm]." + " catch exception while get PlatForm list ", e);
            }
		}
		finally{
			modelAndView.setViewName("publicinfo/operateplatform/operateplatforminfo");
			modelAndView.addObject("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
			modelAndView.addObject("pageNum", pageNumber);
			modelAndView.addObject("numPerPage", pageSize);
			
		}
		return modelAndView;
}
	
	
}
