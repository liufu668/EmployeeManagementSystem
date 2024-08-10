package com.study.hrms.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.study.hrms.common.CommonResult;
import com.study.hrms.common.PageCommonResult;
import com.study.hrms.entity.Worktime;
import com.study.hrms.qo.WorktimeQO;
import com.study.hrms.service.WorktimeService;
import com.study.hrms.vo.WorktimeVO;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
public class WorktimeController {

    @Autowired
    WorktimeService worktimeService;

    @ApiOperation("查询考勤")
    @ResponseBody
    @RequestMapping(value = "/worktime/list",method = RequestMethod.POST)
    public PageCommonResult workList(@RequestBody WorktimeQO worktime){
        PageHelper.startPage(worktime.getPage(),worktime.getLimit());
        if(worktime.getCheckTime()!=null){
            Date checkTime = worktime.getCheckTime();
            Calendar checkCalender = Calendar.getInstance();
            checkCalender.setTime(checkTime);
            checkCalender.set(Calendar.HOUR,0);
            checkCalender.set(Calendar.MINUTE,0);
            checkCalender.set(Calendar.SECOND,0);
            Date startTime = checkCalender.getTime();
            checkCalender.add(Calendar.DAY_OF_YEAR,1);
            Date endTime = checkCalender.getTime();
            worktime.setCheckStartTime(startTime);
            worktime.setCheckEndTime(endTime);
        }
        List<WorktimeVO> worktimeVOList = worktimeService.list(worktime);
        PageInfo<WorktimeVO> pageInfo = new PageInfo(worktimeVOList);
        //返回结果
        PageCommonResult commonResult = PageCommonResult.success(pageInfo.getList(),pageInfo.getTotal());
        return commonResult;
    }

    @ApiOperation("模拟打卡")
    @ResponseBody
    @RequestMapping(value = "/worktime/imitateCheck",method = RequestMethod.POST)
    public CommonResult imitateCheck(@RequestBody Worktime worktime){
        worktimeService.imitateCheck(worktime);
        CommonResult commonResult = CommonResult.success();
        return commonResult;
    }

    @ApiOperation("修改考勤为正常状态")
    @ResponseBody
    @RequestMapping(value = "/work/changeStatus/{workId}",method = RequestMethod.GET)
    public CommonResult changeStatus(@PathVariable Integer workId){
        worktimeService.changeStatus(workId);
        CommonResult commonResult = CommonResult.success();
        return commonResult;
    }

    @ApiOperation("删除考勤记录")
    @ResponseBody
    @RequestMapping(value = "/work/deleteRecord/{workId}",method = RequestMethod.DELETE)
    public CommonResult deleteRecord(@PathVariable Integer workId){
        worktimeService.deleteRecord(workId);
        CommonResult commonResult = CommonResult.success();
        return commonResult;
    }
}
