package com.study.hrms.service.impl;

import com.study.hrms.entity.Department;
import com.study.hrms.mapper.DepartmentMapper;
import com.study.hrms.service.DepartmentService;
import com.study.hrms.vo.DepartmentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public List<DepartmentVO> list(Department department) {
        return departmentMapper.list(department);
    }

    @Override
    public int add(Department department) {
        if(department.getId() != null){//部门已经存在
            return departmentMapper.updateByPrimaryKey(department);
        }else{
            return departmentMapper.insert(department);
        }
    }

    @Override
    public Department findById(Integer deptId) {
        return departmentMapper.selectByPrimaryKey(deptId);
    }
}
