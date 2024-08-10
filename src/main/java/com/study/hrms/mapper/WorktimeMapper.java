package com.study.hrms.mapper;

import com.study.hrms.entity.Worktime;
import com.study.hrms.qo.WorktimeQO;
import com.study.hrms.vo.WorktimeVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WorktimeMapper {
    List<WorktimeVO> list(WorktimeQO worktimeQO);

    void insert(Worktime worktime);

    Worktime selectByPrimaryKey(Integer workId);

    void updateByPrimaryKey(Worktime worktime);

    void deleteByPrimaryId(Integer workId);
}
