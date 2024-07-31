package com.study.hrms.mapper;

import com.study.hrms.entity.Department;
import com.study.hrms.vo.DepartmentVO;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface DepartmentMapper {
    List<DepartmentVO> list(Department department);

    int insert(Department record);

    int updateByPrimaryKey(Department record);

    Department selectByPrimaryKey(Integer deptId);
}
