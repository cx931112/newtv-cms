package net.chinaott.cms.core.system.repository;

import net.chinaott.cms.core.system.entity.SystemDic;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface SystemDicDao extends PagingAndSortingRepository<SystemDic, Long>, JpaSpecificationExecutor<SystemDic>
{
    
    /**
     * <根据type 查询dic>
     * 
     * @param type
     * @return
     */
    List<SystemDic> findByType(String type);
    
    /**
     * <根据type和value查询数据字典>
     * @param type
     * @param value
     * @return
     * @see [类、类#方法、类#成员]
     */
    SystemDic findByTypeAndValue(String type, String value);

    /**
     * <根据type和name查询数据字典>
     * @param type
     * @param name
     * @return
     * @see [类、类#方法、类#成员]
     */
    SystemDic findByTypeAndName(String type, String name);
}
