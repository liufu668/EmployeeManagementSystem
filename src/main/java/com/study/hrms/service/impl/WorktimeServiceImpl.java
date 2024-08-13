package com.study.hrms.service.impl;

import com.study.hrms.entity.Worktime;
import com.study.hrms.mapper.WorktimeMapper;
import com.study.hrms.qo.WorktimeQO;
import com.study.hrms.service.WorktimeService;
import com.study.hrms.vo.WorktimeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorktimeServiceImpl implements WorktimeService {

    @Autowired
    WorktimeMapper worktimeMapper;

    @Override
    public List<WorktimeVO> list(WorktimeQO worktimeQO) {
        return worktimeMapper.list(worktimeQO);
    }

    @Override
    public void imitateCheck(Worktime worktime) {
        worktimeMapper.insert(worktime);
    }

    @Override
    public void changeStatus(Integer workId) {
        Worktime worktime = worktimeMapper.selectByPrimaryKey(workId);
        worktime.setStatus(0);
        worktimeMapper.updateByPrimaryKey(worktime);
    }

    @Override
    public void deleteRecord(Integer workId) {
        worktimeMapper.deleteByPrimaryId(workId);
    }
}
