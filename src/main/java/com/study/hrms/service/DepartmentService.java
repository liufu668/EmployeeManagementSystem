package com.study.hrms.service;

import com.study.hrms.entity.Department;
import com.study.hrms.qo.DepartmentQO;
import com.study.hrms.vo.DepartmentVO;

import java.util.List;

public interface DepartmentService {

    List<DepartmentVO> list(DepartmentQO department);

    int add(Department department);

    Department findById(Integer deptId);

    void deleteByid(Integer id);
}
