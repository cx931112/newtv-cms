package net.chinaott.cms.web.module.program.service;

import net.chinaott.cms.core.common.base.Page;
import net.chinaott.cms.core.program.bean.ProgramQueryBean;
import net.chinaott.cms.core.program.entity.Program;
import net.chinaott.cms.core.program.repository.mybatis.ProgramMyBatisDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProgramWebService {
	
	@Autowired
	private ProgramMyBatisDao programMybatisDao;

	@SuppressWarnings("unchecked")
	public Page<Program> findListByConditions(ProgramQueryBean programQueryBean, int pageNum, int numPerPage) {
		List<Program> list = this.programMybatisDao.findList(programQueryBean, (pageNum -1) * numPerPage, numPerPage);
		int total = this.programMybatisDao.getCount(programQueryBean);
		return new Page<Program>().instanceByPageNo(list, total, pageNum, numPerPage);
	}

}
