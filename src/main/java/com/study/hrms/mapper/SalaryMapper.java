package com.study.hrms.mapper;

import com.study.hrms.entity.Salary;
import com.study.hrms.qo.SalaryQO;
import com.study.hrms.vo.SalaryVO;

import java.util.List;

public interface SalaryMapper {
    List<SalaryVO> list(SalaryQO salaryQO);

    int updateByPrimaryKeySelective(Salary salary);

    int insertSelective(Salary salary);

    SalaryVO selectVOById(Integer id);

    void deleteByPrimaryId(Integer id);
}
