package com.study.hrms.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;

public class Salary implements Serializable {
    private static final long serialVersionUID = 1L;


    @ApiModelProperty(value = "")
    private Integer id;

    @ApiModelProperty(value = "员工id")
    private Integer employeeId;

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


    @JsonProperty("id")
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id =  id;
    }
    @JsonProperty("employeeId")
    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId =  employeeId;
    }
    @JsonProperty("baseSalary")
    public Double getBaseSalary() {
        return baseSalary;
    }

    public void setBaseSalary(Double baseSalary) {
        this.baseSalary =  baseSalary;
    }
    @JsonProperty("meritsSalary")
    public Double getMeritsSalary() {
        return meritsSalary;
    }

    public void setMeritsSalary(Double meritsSalary) {
        this.meritsSalary =  meritsSalary;
    }
    @JsonProperty("awardSalary")
    public Double getAwardSalary() {
        return awardSalary;
    }

    public void setAwardSalary(Double awardSalary) {
        this.awardSalary =  awardSalary;
    }
    @JsonProperty("transportSubsidy")
    public Double getTransportSubsidy() {
        return transportSubsidy;
    }

    public void setTransportSubsidy(Double transportSubsidy) {
        this.transportSubsidy =  transportSubsidy;
    }
    @JsonProperty("mealSubsidy")
    public Double getMealSubsidy() {
        return mealSubsidy;
    }

    public void setMealSubsidy(Double mealSubsidy) {
        this.mealSubsidy =  mealSubsidy;
    }
    @JsonProperty("phoneSubsidy")
    public Double getPhoneSubsidy() {
        return phoneSubsidy;
    }

    public void setPhoneSubsidy(Double phoneSubsidy) {
        this.phoneSubsidy =  phoneSubsidy;
    }
    @JsonProperty("insurance")
    public Double getInsurance() {
        return insurance;
    }

    public void setInsurance(Double insurance) {
        this.insurance =  insurance;
    }
    @JsonProperty("tax")
    public Double getTax() {
        return tax;
    }

    public void setTax(Double tax) {
        this.tax =  tax;
    }
    @JsonProperty("otherSubsidy")
    public Double getOtherSubsidy() {
        return otherSubsidy;
    }

    public void setOtherSubsidy(Double otherSubsidy) {
        this.otherSubsidy =  otherSubsidy;
    }
    @JsonProperty("otherCut")
    public Double getOtherCut() {
        return otherCut;
    }

    public void setOtherCut(Double otherCut) {
        this.otherCut =  otherCut;
    }

    public String getBelongMonth() {
        return belongMonth;
    }

    public void setBelongMonth(String belongMonth) {
        this.belongMonth = belongMonth;
    }

    public Salary(Integer id, Integer employeeId, Double baseSalary, Double meritsSalary, Double awardSalary, Double transportSubsidy, Double mealSubsidy, Double phoneSubsidy, Double insurance, Double tax, Double otherSubsidy, Double otherCut) {

        this.id = id;

        this.employeeId = employeeId;

        this.baseSalary = baseSalary;

        this.meritsSalary = meritsSalary;

        this.awardSalary = awardSalary;

        this.transportSubsidy = transportSubsidy;

        this.mealSubsidy = mealSubsidy;

        this.phoneSubsidy = phoneSubsidy;

        this.insurance = insurance;

        this.tax = tax;

        this.otherSubsidy = otherSubsidy;

        this.otherCut = otherCut;

    }

    public Salary() {
        super();
    }



}

