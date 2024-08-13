package com.study.hrms.qo;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.study.hrms.common.PageBean;
import io.swagger.annotations.ApiModelProperty;

import java.util.Date;

public class WorktimeQO extends PageBean {
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    @ApiModelProperty(value = "考勤时间")
    private Date checkTime;

    @ApiModelProperty(value = "对应员工id")
    private Integer employeeId;

    @ApiModelProperty(value = "对应部门id")
    private Integer dept;

    private Date checkStartTime;
    private Date checkEndTime;

    public Date getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(Date checkTime) {
        this.checkTime = checkTime;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }

    public Date getCheckStartTime() {
        return checkStartTime;
    }

    public void setCheckStartTime(Date checkStartTime) {
        this.checkStartTime = checkStartTime;
    }

    public Date getCheckEndTime() {
        return checkEndTime;
    }

    public void setCheckEndTime(Date checkEndTime) {
        this.checkEndTime = checkEndTime;
    }

    public Integer getDept() {
        return dept;
    }

    public void setDept(Integer dept) {
        this.dept = dept;
    }
}
