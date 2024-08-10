package com.study.hrms.service.impl;

import com.study.hrms.entity.Salary;
import com.study.hrms.mapper.SalaryMapper;
import com.study.hrms.qo.SalaryQO;
import com.study.hrms.service.SalaryService;
import com.study.hrms.vo.SalaryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SalaryServiceImpl implements SalaryService {

    @Autowired
    SalaryMapper salaryMapper;

    @Override
    public List<SalaryVO> list(SalaryQO salaryQO) {
        return salaryMapper.list(salaryQO);
    }

    @Override
    public int edit(Salary salary) {
        return salaryMapper.updateByPrimaryKeySelective(salary);
    }

    @Override
    public int add(Salary salary) {
        return salaryMapper.insertSelective(salary);
    }

    @Override
    public SalaryVO findVOById(Integer id) {
        return salaryMapper.selectVOById(id);
    }

    @Override
    public void deleteById(Integer id) {
        salaryMapper.deleteByPrimaryId(id);
    }
}
