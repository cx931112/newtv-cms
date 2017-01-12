package net.chinaott.cms.web.module.program.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import net.chinaott.cms.core.basicinfo.entity.ProgramStatus;
import net.chinaott.cms.core.basicinfo.repository.ProgramStatusDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

@Service
public class ProgramStatusService
{
    @Autowired
    private ProgramStatusDao programStatusDao;

    public Map<String, String> getProgramStatusKeyValue()
    {
        Map<String, String> result = new LinkedHashMap<String, String>();
        Sort sort = new Sort(Direction.ASC, "sortNum");
        List<ProgramStatus> programStatus = (List<ProgramStatus>)programStatusDao.findAll(sort);
        for (ProgramStatus status : programStatus)
        {
            result.put(status.getStatusValue(), status.getStatusName());
        }
        return result;
    }
    
}
