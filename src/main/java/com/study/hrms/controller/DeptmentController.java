package com.study.hrms.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.study.hrms.common.CommonResult;
import com.study.hrms.common.PageBean;
import com.study.hrms.common.PageCommonResult;
import com.study.hrms.entity.Department;
import com.study.hrms.qo.DepartmentQO;
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
    public PageCommonResult deptList(@RequestBody DepartmentQO departmentQO){
        PageHelper.startPage(departmentQO.getPage(),departmentQO.getLimit());
        List<DepartmentVO> depts = departmentService.list(departmentQO);
        PageInfo<DepartmentVO> pageInfo = new PageInfo(depts);
        PageCommonResult commonResult = PageCommonResult.success(pageInfo.getList(), pageInfo.getTotal());
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

    @ApiOperation("删除部门")
    @ResponseBody
    @RequestMapping(value = "/dept/delete/{id}", method = RequestMethod.DELETE)
    public CommonResult deptDelete(@PathVariable Integer id){
        departmentService.deleteByid(id);
        CommonResult commonResult = CommonResult.success();
        return commonResult;
    }
}
