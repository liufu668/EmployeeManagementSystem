package com.study.hrms.qo;

import com.study.hrms.common.PageBean;
import io.swagger.annotations.ApiModelProperty;

public class EmployeeQO extends PageBean {
    @ApiModelProperty(value = "")
    private Integer id;

    @ApiModelProperty(value = "员工姓名")
    private String emName;

    @ApiModelProperty(value = "性别，F女，M男")
    private String sex;

    @ApiModelProperty(value = "电话")
    private String phone;

    @ApiModelProperty(value = "工号")
    private String emnum;
    @ApiModelProperty(value = "所属部门")
    private Integer dept;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmName() {
        return emName;
    }

    public void setEmName(String emName) {
        this.emName = emName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmnum() {
        return emnum;
    }

    public void setEmnum(String emnum) {
        this.emnum = emnum;
    }

    public Integer getDept() {
        return dept;
    }

    public void setDept(Integer dept) {
        this.dept = dept;
    }
}
