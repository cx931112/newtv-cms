package net.chinaott.cms.web.module.system.service;

import net.chinaott.cms.core.system.entity.SystemDic;
import net.chinaott.cms.core.system.repository.SystemDicDao;
import net.chinaott.cms.web.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <系统字典业务接口>
 * 
 * @author zhaodd
 * @version [1.0 2014-1-8]
 * @see [相关类/方法]
 * @since [产品/模块版本]
 */

@Component
@Transactional(value = "cmsTransactionManager")
public class SystemDicService
{
    
    @Autowired
    private SystemDicDao systemDicDao;

    /**
     * <根据类型查询字典数据>
     * @param type
     * @return
     */
    public List<SystemDic> getDicListByType(String type)
    {
        return systemDicDao.findByType(type);
    }
    /**
     * 根据类型获取数据字典名称值
     * @param type
     * @return
     */
    public Map<String,String> getDicMapByType(String type)
    {
    	Map<String,String> map = new HashMap<String,String>();
    	List<SystemDic> listDic = getDicListByType(type);
    	for(SystemDic dic:listDic)
    	{
    		map.put(dic.getValue(), dic.getName());
    	}
    	return map;
    }
    
    /**
     * <根据type和value查询数据字典>
     * @param type
     * @param value
     * @return
     * @see [类、类#方法、类#成员]
     */
    public SystemDic getDicByTypeAndValue(String type, String value)
    {
        return systemDicDao.findByTypeAndValue(type, value);
    }

    /**
     * <根据type和name查询数据字典>
     * @param type
     * @param name
     * @return
     * @see [类、类#方法、类#成员]
     */
    public SystemDic getDicByTypeAndName(String type, String name)
    {
        return systemDicDao.findByTypeAndName(type, name);
    }

    /**
     * <查询系统字典表>
     * @param searchParams
     * @param pageNumber
     * @param pageSize
     * @return
     */
   public Page<SystemDic> getSysDicList(Map<String, Object> searchParams, int pageNumber, int pageSize)
   {
	   String[] orderBy = {"type","sortNum"};
	   PageRequest pageRequest = PageUtil.buildPageRequest(pageNumber, pageSize, "asc", orderBy);
	   Specification<SystemDic> spec = PageUtil.buildSpecification(searchParams, SystemDic.class);
       return systemDicDao.findAll(spec, pageRequest);
   }
   
   
   /**
    * <根据id获得系统字典表信息>
    * 
    * @param id
    * @return
    */
   public SystemDic getSystemDic(Long id)
   {
       return systemDicDao.findOne(id);
   }
   
   /**
    * <保存系统字典表信息>
    * 
    * @param entity
    */
   public void saveSysDic(SystemDic entity)
   {
       systemDicDao.save(entity);
   }
   
   /**
    * <删除系统字典表信息>
    * 
    * @param id
    */
   public void deleteSystemDic(Long id)
   {
       systemDicDao.delete(id);
   }
}
