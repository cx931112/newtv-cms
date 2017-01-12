package net.chinaott.cms.web.log.repository;

import net.chinaott.cms.web.log.entity.OperationLog;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * <日志记录Dao>
 *
 * @author chenc
 * @version [版本号, 2014年3月27日]
 * @see [相关类/方法]
 * @since [产品/模块版本]
 */
public interface OperationLogDao extends PagingAndSortingRepository<OperationLog, Long>,
		JpaSpecificationExecutor<OperationLog>
{

	/**
	 * <查询所有操作日志>
	 *
	 * @return
	 */
	List<OperationLog> findAll();

	@Query("FROM OperationLog t WHERE t.oprDataId = ?1")
	List<OperationLog> findByDataId(String dataId);

	/**
	 * <查找所有数据类型>
	 *
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	@Query("FROM OperationLog t GROUP BY t.oprDataType ORDER BY t.oprDataType")
	List<OperationLog> getOprDataTypeList();
}
