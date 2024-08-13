package com.study.hrms.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;

import java.util.Date;

public class WorktimeVO {
    @ApiModelProperty(value = "主键")
    private Integer id;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    @ApiModelProperty(value = "考勤时间")
    private Date checkTime;

    @ApiModelProperty(value = "0：上班考勤，1：下班考勤 ")
    private Integer checkType;

    @ApiModelProperty(value = "打卡状态，0：正常，1：迟到，2：早退，3：外勤")
    private Integer status;

    @ApiModelProperty(value = "对应员工")
    private EmployeeVO employee;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(Date checkTime) {
        this.checkTime = checkTime;
    }

    public Integer getCheckType() {
        return checkType;
    }

    public void setCheckType(Integer checkType) {
        this.checkType = checkType;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public EmployeeVO getEmployee() {
        return employee;
    }

    public void setEmployee(EmployeeVO employee) {
        this.employee = employee;
    }
}
