package com.study.hrms.qo;

import com.study.hrms.common.PageBean;
import io.swagger.annotations.ApiModelProperty;

public class DepartmentQO extends PageBean {
    @ApiModelProperty(value = "部门名称")
    private String deptname;

    @ApiModelProperty(value = "负责人")
    private Integer chargeman;

    public String getDeptname() {
        return deptname;
    }

    public void setDeptname(String deptname) {
        this.deptname = deptname;
    }

    public Integer getChargeman() {
        return chargeman;
    }

    public void setChargeman(Integer chargeman) {
        this.chargeman = chargeman;
    }
}
