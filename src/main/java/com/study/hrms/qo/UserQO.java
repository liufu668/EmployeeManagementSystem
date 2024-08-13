package com.study.hrms.qo;


import com.study.hrms.common.PageBean;
import io.swagger.annotations.ApiModelProperty;

public class UserQO extends PageBean {
    @ApiModelProperty(value = "用户名")
    private String username;

    @ApiModelProperty(value = "真实姓名")
    private String realname;

    @ApiModelProperty(value = "密码")
    private String paword;

    @ApiModelProperty(value = "原密码")
    private String oldpaword;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPaword() {
        return paword;
    }

    public void setPaword(String paword) {
        this.paword = paword;
    }

    public String getOldpaword() {
        return oldpaword;
    }

    public void setOldpaword(String oldpaword) {
        this.oldpaword = oldpaword;
    }
}
