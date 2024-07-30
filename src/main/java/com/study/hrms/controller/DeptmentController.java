package com.study.hrms.controller;

import com.study.hrms.common.CommonResult;
import com.study.hrms.entity.Department;
import com.study.hrms.service.DepartmentService;
import com.study.hrms.vo.DepartmentVO;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class DeptmentController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private DepartmentService departmentService;

    @ApiOperation("查询所有部门")
    @ResponseBody
    @RequestMapping(value = "/dept/list",method = RequestMethod.POST)
    public CommonResult deptList(@RequestBody Department department){
        List<DepartmentVO> depts = departmentService.list(department);
        CommonResult commonResult = CommonResult.success(depts);
        return commonResult;
    }

    @ApiOperation("添加部门")
    @ResponseBody
    @RequestMapping(value = "/dept/add",method = RequestMethod.POST)
    public CommonResult deptAdd(@RequestBody Department department){
        departmentService.add(department);
        CommonResult commonResult = CommonResult.success();
        return commonResult;
    }

    @ApiOperation("根据ID查询部门")
    @ResponseBody
    @RequestMapping(value = "/dept/search/{deptId}",method = RequestMethod.GET)
    public CommonResult deptAdd(@PathVariable Integer deptId){
        Department department = departmentService.findById(deptId);
        CommonResult commonResult = CommonResult.success(department);
        return commonResult;
    }
}
