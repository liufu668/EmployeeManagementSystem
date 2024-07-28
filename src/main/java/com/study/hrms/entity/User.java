package com.study.hrms.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
    private static final long serialVersionUID = 1L;


    @ApiModelProperty(value = "主键")
    private Integer id;

    @ApiModelProperty(value = "用户名")
    private String username;

    @ApiModelProperty(value = "真实姓名")
    private String realname;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    @ApiModelProperty(value = "上次登录时间")
    private Date lastLoginTime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    @ApiModelProperty(value = "注册/创建时间")
    private Date createtime;

    @ApiModelProperty(value = "密码")
    private String password;

    @JsonProperty("id")
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id =  id;
    }
    @JsonProperty("username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username =  username;
    }
    @JsonProperty("realname")
    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname =  realname;
    }
    @JsonProperty("lastLogineTime")
    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime =  lastLoginTime;
    }
    @JsonProperty("createtime")
    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime =  createtime;
    }
    @JsonProperty("password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password =  password;
    }


    public User(Integer id,String username,String realname,Date lastLoginTime,Date createtime,String password) {

        this.id = id;

        this.username = username;

        this.realname = realname;

        this.lastLoginTime = lastLoginTime;

        this.createtime = createtime;

        this.password = password;

    }

    public User() {
        super();
    }


}
