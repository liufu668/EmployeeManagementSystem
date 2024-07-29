package com.study.hrms.vo;

import com.study.hrms.common.PageBean;
import io.swagger.annotations.ApiModelProperty;

public class EmployeeVO extends PageBean {
    @ApiModelProperty(value = "")
    private Integer id;

    @ApiModelProperty(value = "员工姓名")
    private String emName;

    @ApiModelProperty(value = "出生日期")
    private String birthday;

    @ApiModelProperty(value = "性别，F女，M男")
    private String sex;

    @ApiModelProperty(value = "政治面貌，0群众，1团员，2中共党员，3其他民主党派人士")
    private Integer policitalStatus;

    @ApiModelProperty(value = "邮箱")
    private String email;

    @ApiModelProperty(value = "学历，0无，1小学，2中学，3高中，4职高，5中专，6大专，7大专，8本科，9硕士，10博士")
    private Integer education;

    @ApiModelProperty(value = "毕业院校")
    private String university;

    @ApiModelProperty(value = "岗位")
    private String station;

    @ApiModelProperty(value = "薪资级别")
    private Integer salaryLevel;

    @ApiModelProperty(value = "工号")
    private String emnum;

    @ApiModelProperty(value = "所属部门")
    private String deptName;

    @ApiModelProperty(value = "所属部门")
    private String deptId;

    @ApiModelProperty(value = "电话")
    private String phone;

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

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getPolicitalStatus() {
        return policitalStatus;
    }

    public void setPolicitalStatus(Integer policitalStatus) {
        this.policitalStatus = policitalStatus;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getEducation() {
        return education;
    }

    public void setEducation(Integer education) {
        this.education = education;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public String getStation() {
        return station;
    }

    public void setStation(String station) {
        this.station = station;
    }

    public Integer getSalaryLevel() {
        return salaryLevel;
    }

    public void setSalaryLevel(Integer salaryLevel) {
        this.salaryLevel = salaryLevel;
    }

    public String getEmnum() {
        return emnum;
    }

    public void setEmnum(String emnum) {
        this.emnum = emnum;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }
}
