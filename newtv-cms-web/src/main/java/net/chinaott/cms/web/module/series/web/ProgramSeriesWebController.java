package net.chinaott.cms.web.module.series.web;

import java.util.ArrayList;
import java.util.List;

import net.chinaott.cms.web.module.series.service.ProgramSeriesWebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/series")
public class ProgramSeriesWebController {

	@Autowired
	private ProgramSeriesWebService programSeriesWebService;
	
	@RequestMapping("/query")
	public String query(){
		
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping("/searchparam")
	public List<Object[]> searchparam() {
		List<Object[]> result = new ArrayList<Object[]>();
		result.add(new Object[] { "EQ_programSeriesId", "节点集ID" });
		result.add(new Object[] { "LIKE_programSeriesName", "节目集名称" });
		return result;
	}
}
