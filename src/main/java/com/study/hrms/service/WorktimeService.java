package com.study.hrms.service;

import com.study.hrms.entity.Worktime;
import com.study.hrms.qo.WorktimeQO;
import com.study.hrms.vo.WorktimeVO;

import java.util.List;

public interface WorktimeService {
    List<WorktimeVO> list(WorktimeQO worktimeQO);

    void imitateCheck(Worktime worktime);

    void changeStatus(Integer workId);

    void deleteRecord(Integer workId);
}
