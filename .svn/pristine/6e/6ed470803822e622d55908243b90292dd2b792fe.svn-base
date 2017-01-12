package net.chinaott.cms.web.module.program.web;

import net.chinaott.cms.core.common.base.ResultBean;
import net.chinaott.cms.core.program.bean.ProgramQueryBean;
import net.chinaott.cms.core.program.entity.Program;
import net.chinaott.cms.web.module.program.service.ProgramWebService;
import net.chinaott.cms.web.utils.constant.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/program")
public class ProgramWebController {

	@Autowired
	private ProgramWebService programWebService;
	
	@RequestMapping("/list")
	@ResponseBody
	public ModelAndView query(@Validated()ProgramQueryBean programQueryBean,
            BindingResult menuResult,
            @RequestParam(defaultValue = Constants.DEFAULT_PAGE_NUM) int pageNum,
            @RequestParam(defaultValue = Constants.DEFAULT_PAGE_SIZE) int numPerPage,
            HttpServletRequest request, HttpServletResponse response){
		ModelAndView view = new ModelAndView("program/create/program_info");
		view.addObject("page",this.programWebService.findListByConditions(programQueryBean, pageNum, numPerPage));
		return view;
	}
	
	@RequestMapping("/preAdd")
	public ModelAndView preAdd(@Validated()Program program,
            BindingResult menuResult,
            HttpServletRequest request, HttpServletResponse response){
		ModelAndView view = new ModelAndView("program/create/program_add");
		return view;
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public ResultBean add(@Validated()Program program,
			 BindingResult menuResult,
			 HttpServletRequest request, HttpServletResponse response){
		
		return ResultBean.SUCCESS().setCallbackType("closeCurrent").setNavTabId("/program/list").setMessage("成功!");
	}
	
}
