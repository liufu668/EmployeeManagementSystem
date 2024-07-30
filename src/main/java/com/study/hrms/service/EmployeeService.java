package com.study.hrms.service;

import com.study.hrms.entity.Employee;
import com.study.hrms.qo.EmployeeQO;
import com.study.hrms.vo.EmployeeVO;

import java.util.List;

public interface EmployeeService {
    List<EmployeeVO> list(EmployeeQO employeeQO);

    int edit(Employee employee);

    int add(Employee employee);

    Employee findById(Integer id);

    void deleteById(Integer id);
}
