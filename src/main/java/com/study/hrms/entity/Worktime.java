package com.study.hrms.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.util.Date;

public class Worktime implements Serializable {
    private static final long serialVersionUID = 1L;


    @ApiModelProperty(value = "主键")
    private Integer id;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    @ApiModelProperty(value = "考勤时间")
    private Date checkTime;

    @ApiModelProperty(value = "0：上班考勤，1：下班考勤 ")
    private Integer checkType;

    @ApiModelProperty(value = "打卡状态，0：正常，1：迟到，2：早退，3：外勤")
    private Integer status;

    @ApiModelProperty(value = "对应员工id")
    private Integer employeeId;

    @JsonProperty("id")
    public Integer getId() {
    return id;
    }

    public void setId(Integer id) {
this.id =  id;
}
    @JsonProperty("checkTime")
    public Date getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(Date checkTime) {
        this.checkTime =  checkTime;
    }
    @JsonProperty("checkType")
    public Integer getCheckType() {
        return checkType;
    }

    public void setCheckType(Integer checkType) {
        this.checkType =  checkType;
    }
    @JsonProperty("status")
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status =  status;
    }
    @JsonProperty("employeeId")
    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId =  employeeId;
    }


    public Worktime(Integer id, Date checkTime, Integer checkType, Integer status, Integer employeeId) {

        this.id = id;

        this.checkTime = checkTime;

        this.checkType = checkType;

        this.status = status;

        this.employeeId = employeeId;

    }

    public Worktime() {
        super();
    }


}
