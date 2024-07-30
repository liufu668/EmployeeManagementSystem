package com.study.hrms.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;

public class Department implements Serializable {
    private static final long serialVersionUID = 1L;


    @ApiModelProperty(value = "")
    private Integer id;

    @ApiModelProperty(value = "部门名称")
    private String deptname;

    @ApiModelProperty(value = "负责人")
    private Integer chargeman;

    @JsonProperty("id")
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id =  id;
    }
    @JsonProperty("deptname")
    public String getDeptname() {
        return deptname;
    }

    public void setDeptname(String deptname) {
        this.deptname =  deptname;
    }
    @JsonProperty("chargeman")
    public Integer getChargeman() {
        return chargeman;
    }

    public void setChargeman(Integer chargeman) {
        this.chargeman =  chargeman;
    }


    public Department(Integer id, String deptname, Integer chargeman) {

        this.id = id;

        this.deptname = deptname;

        this.chargeman = chargeman;

    }

    public Department() {
        super();
    }
}

