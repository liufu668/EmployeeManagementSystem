package com.study.hrms.service;

import com.study.hrms.entity.Salary;
import com.study.hrms.qo.SalaryQO;
import com.study.hrms.vo.SalaryVO;

import java.util.List;

public interface SalaryService {
    List<SalaryVO> list(SalaryQO salaryQO);

    int edit(Salary salary);

    int add(Salary salary);

    SalaryVO findVOById(Integer id);

    void deleteById(Integer id);
}
