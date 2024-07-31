package com.study.hrms.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.study.hrms.common.CommonResult;
import com.study.hrms.common.PageCommonResult;
import com.study.hrms.entity.Employee;
import com.study.hrms.qo.EmployeeQO;
import com.study.hrms.service.EmployeeService;
import com.study.hrms.vo.EmployeeVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class EmployeeController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private EmployeeService employeeService;

    @ApiOperation("查询员工")
    @ResponseBody
    @RequestMapping(value = "/employee/list",method = RequestMethod.POST)
    public PageCommonResult employeeList(@RequestBody EmployeeQO employeeQO){
        PageHelper.startPage(employeeQO.getPage(),employeeQO.getLimit());
        List<EmployeeVO> employeeList = employeeService.list(employeeQO);
        PageInfo<EmployeeVO> pageInfo = new PageInfo<>(employeeList);
        PageCommonResult commonResult = PageCommonResult.success(pageInfo.getList(), pageInfo.getTotal());
        return commonResult;
    }

    @ApiOperation("查询所有员工")
    @ResponseBody
    @RequestMapping(value = "/employee/searchAll",method = RequestMethod.POST)
    public CommonResult employeeSearchAll(@RequestBody EmployeeQO employeeQO){
        List<EmployeeVO> employeeList = employeeService.findByEmployee(employeeQO);
        CommonResult commonResult = CommonResult.success(employeeList);
        return commonResult;
    }

    @ApiOperation("添加或修改员工")
    @ResponseBody
    @RequestMapping(value = "/employee/add",method = RequestMethod.POST)
    public CommonResult employeeAdd(@RequestBody Employee employee){
        if(employee!=null && employee.getId()!=null){
            employeeService.edit(employee);
        }else{
            employeeService.add(employee);
        }
        CommonResult commonResult = CommonResult.success();
        return commonResult;
    }

    @ApiOperation("根据id查询单个员工信息")
    @ResponseBody
    @RequestMapping(value = "/employee/search/{id}",method = RequestMethod.GET)
    public CommonResult employeeSearch(@PathVariable Integer id){
        Employee employee = employeeService.findById(id);
        CommonResult commonResult = CommonResult.success(employee);
        return commonResult;
    }

    @ApiOperation("删除员工")
    @ResponseBody
    @RequestMapping(value = "/employee/delete/{id}",method = RequestMethod.DELETE)
    public CommonResult employeeDelete(@PathVariable Integer id){
        employeeService.deleteById(id);
        CommonResult commonResult = CommonResult.success();
        return commonResult;
    }
}
