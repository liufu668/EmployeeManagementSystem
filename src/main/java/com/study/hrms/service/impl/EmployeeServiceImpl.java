package com.study.hrms.service.impl;

import com.study.hrms.entity.Employee;
import com.study.hrms.mapper.EmployeeMapper;
import com.study.hrms.qo.EmployeeQO;
import com.study.hrms.service.EmployeeService;
import com.study.hrms.vo.EmployeeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;
    @Override
    public List<EmployeeVO> list(EmployeeQO employeeQO) {
        return employeeMapper.selectByEmployee(employeeQO);
    }

    @Override
    public int edit(Employee employee) {
        return employeeMapper.updateByPrimaryKey(employee);
    }

    @Override
    public int add(Employee employee) {
        return employeeMapper.insert(employee);
    }

    @Override
    public Employee findById(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    @Override
    public void deleteById(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }
}
