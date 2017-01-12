package net.chinaott.cms.core.program.repository.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import net.chinaott.cms.core.common.repository.mybatis.MyBatisRepository;
import net.chinaott.cms.core.program.bean.ProgramQueryBean;
import net.chinaott.cms.core.program.entity.Program;

@MyBatisRepository
public interface ProgramMyBatisDao {

	List<Program> findList(@Param("bean")ProgramQueryBean bean, @Param("pageNo")int pageNo, @Param("pageSize")int pageSize);

	int getCount(@Param("bean")ProgramQueryBean bean);
   
}