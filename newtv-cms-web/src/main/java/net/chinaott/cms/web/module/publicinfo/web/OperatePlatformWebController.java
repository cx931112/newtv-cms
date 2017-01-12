package net.chinaott.cms.web.module.publicinfo.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import lombok.Data;
import net.chinaott.cms.core.publicinfo.entity.OperatePlatform;
import net.chinaott.cms.core.system.entity.SystemConfig;
import net.chinaott.cms.web.common.constant.Constant;
import net.chinaott.cms.web.log.entity.OperationType;
import net.chinaott.cms.web.module.log.service.OperationLogService;
import net.chinaott.cms.web.module.publicinfo.service.OperatePlatformService;
import net.chinaott.cms.web.module.system.web.SystemConfigController;
import net.chinaott.cms.web.utils.web.HttpResult;
import net.chinaott.cms.web.utils.web.HttpStatus;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
@Data
@Controller
@RequestMapping(value="/operateplatform")
public class OperatePlatformWebController {
	private static final Logger LOGGER = LoggerFactory.getLogger(OperatePlatformWebController.class);
	
	@Autowired
	private OperatePlatformService operatePlatformService;
	
	@Autowired
	private OperationLogService operationLogService;
	
	@RequestMapping(value="/add")
	public ModelAndView operPlatFormAdd(){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("publicinfo/operateplatform/operateplatformaddandedit");
		
		return modelAndView;
	}
	@RequestMapping(value="/edit/{id}")
	
	public ModelAndView findOperatePlatformById(@PathVariable Integer id){
		
		ModelAndView modelAndView=new ModelAndView();
		OperatePlatform operatePlatform=operatePlatformService.findOperatePlatformById(id);
		modelAndView.addObject("operatePlatform", operatePlatform);
		modelAndView.setViewName("publicinfo/operateplatform/operateplatformaddandedit");
		return modelAndView;
	}
	@RequestMapping(value="/saveOperatePlatform")
	@ResponseBody
	public HttpResult saveOperatePlatform(@Valid @ModelAttribute("operatePlatform") OperatePlatform operatePlatform,
			ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{
		HttpResult result = new HttpResult();
		OperatePlatform platForm=new OperatePlatform();
		
		try{
			OperationType oprType;
		if(null!=operatePlatform.getId()){
			platForm=operatePlatformService.findOperatePlatformById(operatePlatform.getId());
			oprType = OperationType.MODIFY;
		}
		else{
			oprType = OperationType.ADD;
		}
		/*platForm.setId(3);*/
		platForm.setName(operatePlatform.getName());
		platForm.setSortNum(operatePlatform.getSortNum());
		operatePlatformService.saveOperatePlatform(platForm);
		result.setResult(HttpStatus.OK);
/*		 operationLogService.logOptAsync(oprType,
	                String.valueOf(operatePlatform.getId()),
	                Constant.OPRDATATYPE_SYSTEMCONFIG,
	                getCurrentUser().id.longValue());*/
		}catch(Exception e){
			result.setResult("300", "操作失败");
            LOGGER.debug("Enter func[saveMenu] catch exception" + e);
		}
		return result;
		
	}

}
