package net.chinaott.cms.web.common.service;

import net.chinaott.cms.web.common.constant.Constant;
import net.chinaott.cms.web.module.program.service.ProgramStatusService;
import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class DictionaryService
{
    @Autowired
    private ProgramStatusService programStatusService;
    
	@Autowired
	private Cache cache;

	public void initDictionary()
	{
		// 缓存公共信息
		cache.put(new Element(Constant.PROGRAMSTATUS, programStatusService.getProgramStatusKeyValue()));
	}

	public void flush(String entity)
	{
		if (Constant.PROGRAMSTATUS.equals(entity))
		{
			cache.put(new Element(Constant.PROGRAMSTATUS, programStatusService.getProgramStatusKeyValue()));
		}
	}
}
