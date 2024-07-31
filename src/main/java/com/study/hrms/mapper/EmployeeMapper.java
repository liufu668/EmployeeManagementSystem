package com.study.hrms.mapper;

import com.study.hrms.entity.Employee;
import com.study.hrms.qo.EmployeeQO;
import com.study.hrms.vo.EmployeeVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeMapper {
    List<EmployeeVO> selectByEmployee(EmployeeQO employeeQO);

    int updateByPrimaryKey(Employee employee);

    int insert(Employee employee);

    Employee selectByPrimaryKey(Integer id);

    int deleteByPrimaryKey(Integer id);

}
