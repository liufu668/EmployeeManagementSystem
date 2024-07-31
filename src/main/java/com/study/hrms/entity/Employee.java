package com.study.hrms.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;

public class Employee implements Serializable {
    private static final long serialVersionUID = 1L;


    @ApiModelProperty(value = "")
    private Integer id;

    @ApiModelProperty(value = "员工姓名")
    private String emName;

    @ApiModelProperty(value = "出生日期")
    private String birthday;

    @ApiModelProperty(value = "性别，F女，M男")
    private String sex;

    @ApiModelProperty(value = "政治面貌，0群众，1团员，2中共党员，3其他民主党派人士")
    private Integer politicalStatus;

    @ApiModelProperty(value = "邮箱")
    private String email;

    @ApiModelProperty(value = "学历，0无，1小学，2中学，3高中，4职高，5中专，6大专，7本科，8硕士，9博士")
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
    private Integer dept;

    @ApiModelProperty(value = "电话")
    private String phone;

    @JsonProperty("id")
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id =  id;
    }
    @JsonProperty("emName")
    public String getEmName() {
        return emName;
    }

    public void setEmName(String emName) {
        this.emName =  emName;
    }
    @JsonProperty("birthday")
    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday =  birthday;
    }
    @JsonProperty("sex")
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex =  sex;
    }

    @JsonProperty("politicalStatus")
    public Integer getPoliticalStatus() {
        return politicalStatus;
    }

    public void setPoliticalStatus(Integer politicalStatus) {
        this.politicalStatus =  politicalStatus;
    }
    @JsonProperty("email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email =  email;
    }
    @JsonProperty("education")
    public Integer getEducation() {
        return education;
    }

    public void setEducation(Integer education) {
        this.education =  education;
    }
    @JsonProperty("university")
    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university =  university;
    }
    @JsonProperty("station")
    public String getStation() {
        return station;
    }

    public void setStation(String station) {
        this.station =  station;
    }
    @JsonProperty("salaryLevel")
    public Integer getSalaryLevel() {
        return salaryLevel;
    }

    public void setSalaryLevel(Integer salaryLevel) {
        this.salaryLevel =  salaryLevel;
    }
    @JsonProperty("emnum")
    public String getEmnum() {
        return emnum;
    }

    public void setEmnum(String emnum) {
        this.emnum =  emnum;
    }
    @JsonProperty("dept")
    public Integer getDept() {
        return dept;
    }

    public void setDept(Integer dept) {
        this.dept =  dept;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Employee(Integer id, String emName, String birthday, String sex,
                    Integer politicalStatus, String email, Integer education,
                    String university, String station, Integer salaryLevel,
                    String emnum, Integer dept, String phone) {

        this.id = id;

        this.emName = emName;

        this.birthday = birthday;

        this.sex = sex;

        this.politicalStatus = politicalStatus;

        this.email = email;

        this.education = education;

        this.university = university;

        this.station = station;

        this.salaryLevel = salaryLevel;
        this.emnum = emnum;
        this.dept = dept;
        this.phone = phone;

    }

    public Employee() {
        super();
    }
}