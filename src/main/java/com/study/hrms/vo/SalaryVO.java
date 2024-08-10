package com.study.hrms.vo;

import io.swagger.annotations.ApiModelProperty;

public class SalaryVO {
    @ApiModelProperty(value = "")
    private Integer id;

    @ApiModelProperty(value = "员工")
    private EmployeeVO employee;

    @ApiModelProperty(value = "基础工资")
    private Double baseSalary;

    @ApiModelProperty(value = "绩效")
    private Double meritsSalary;

    @ApiModelProperty(value = "奖金")
    private Double awardSalary;

    @ApiModelProperty(value = "交通补助")
    private Double transportSubsidy;

    @ApiModelProperty(value = "餐补")
    private Double mealSubsidy;

    @ApiModelProperty(value = "话费补助")
    private Double phoneSubsidy;

    @ApiModelProperty(value = "保险费")
    private Double insurance;

    @ApiModelProperty(value = "个人所得税")
    private Double tax;

    @ApiModelProperty(value = "其他加发")
    private Double otherSubsidy;

    @ApiModelProperty(value = "其他扣款")
    private Double otherCut;

    @ApiModelProperty(value = "所属月份")
    private String belongMonth;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public EmployeeVO getEmployee() {
        return employee;
    }

    public void setEmployee(EmployeeVO employee) {
        this.employee = employee;
    }

    public Double getBaseSalary() {
        return baseSalary;
    }

    public void setBaseSalary(Double baseSalary) {
        this.baseSalary = baseSalary;
    }

    public Double getMeritsSalary() {
        return meritsSalary;
    }

    public void setMeritsSalary(Double meritsSalary) {
        this.meritsSalary = meritsSalary;
    }

    public Double getAwardSalary() {
        return awardSalary;
    }

    public void setAwardSalary(Double awardSalary) {
        this.awardSalary = awardSalary;
    }

    public Double getTransportSubsidy() {
        return transportSubsidy;
    }

    public void setTransportSubsidy(Double transportSubsidy) {
        this.transportSubsidy = transportSubsidy;
    }

    public Double getMealSubsidy() {
        return mealSubsidy;
    }

    public void setMealSubsidy(Double mealSubsidy) {
        this.mealSubsidy = mealSubsidy;
    }

    public Double getPhoneSubsidy() {
        return phoneSubsidy;
    }

    public void setPhoneSubsidy(Double phoneSubsidy) {
        this.phoneSubsidy = phoneSubsidy;
    }

    public Double getInsurance() {
        return insurance;
    }

    public void setInsurance(Double insurance) {
        this.insurance = insurance;
    }

    public Double getTax() {
        return tax;
    }

    public void setTax(Double tax) {
        this.tax = tax;
    }

    public Double getOtherSubsidy() {
        return otherSubsidy;
    }

    public void setOtherSubsidy(Double otherSubsidy) {
        this.otherSubsidy = otherSubsidy;
    }

    public Double getOtherCut() {
        return otherCut;
    }

    public void setOtherCut(Double otherCut) {
        this.otherCut = otherCut;
    }

    public String getBelongMonth() {
        return belongMonth;
    }

    public void setBelongMonth(String belongMonth) {
        this.belongMonth = belongMonth;
    }
}
