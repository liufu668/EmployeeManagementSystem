package com.study.hrms.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.study.hrms.common.CommonResult;
import com.study.hrms.common.PageCommonResult;
import com.study.hrms.entity.Salary;
import com.study.hrms.qo.SalaryQO;
import com.study.hrms.service.SalaryService;
import com.study.hrms.vo.SalaryVO;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class SalaryController {
    @Autowired
    SalaryService salaryService;

    @ApiOperation("查询工资")
    @ResponseBody
    @RequestMapping(value = "/salary/list",method = RequestMethod.POST)
    public PageCommonResult salaryList(@RequestBody SalaryQO salaryQO){
        PageHelper.startPage(salaryQO.getPage(),salaryQO.getLimit());
        List<SalaryVO> salaryList = salaryService.list(salaryQO);
        PageInfo<SalaryVO> pageInfo = new PageInfo<SalaryVO>(salaryList);
        PageCommonResult pageCommonResult = PageCommonResult.success(pageInfo.getList(),pageInfo.getTotal());
        return pageCommonResult;
    }

    @ApiOperation("生成或修改工资")
    @ResponseBody
    @RequestMapping(value = "/salary/generate",method = RequestMethod.POST)
    public CommonResult imitateCheck(@RequestBody Salary salary){
        if(salary.getId() != null && !salary.getId().equals("")){
            salaryService.edit(salary);
        }else{
            salaryService.add(salary);
        }
        CommonResult commonResult = CommonResult.success();
        return commonResult;
    }

    @ApiOperation("查询工资")
    @ResponseBody
    @RequestMapping(value = "/salary/search/{id}",method = RequestMethod.GET)
    public CommonResult salarySearch(@PathVariable Integer id){
        SalaryVO salaryVO = salaryService.findVOById(id);
        CommonResult commonResult = CommonResult.success(salaryVO);
        return commonResult;
    }

    @ApiOperation("删除工资")
    @ResponseBody
    @RequestMapping(value = "/salary/delete/{id}",method = RequestMethod.DELETE)
    public CommonResult salaryDelete(@PathVariable Integer id){
        salaryService.deleteById(id);
        CommonResult commonResult = CommonResult.success();
        return commonResult;
    }
}
