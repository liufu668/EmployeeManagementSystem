package com.study.hrms.controller;

import com.study.hrms.common.CommonCode;
import com.study.hrms.entity.User;
import com.study.hrms.service.UserService;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;


@Controller
public class IndexController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserService userService;

    @ApiOperation("首页")
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String loginPage(HttpServletRequest request, Model model){
        User user = (User) request.getSession().getAttribute(CommonCode.SESSION_USER);
        model.addAttribute("user",user);
        return "/index";
    }

    @ApiOperation("员工管理")
    @RequestMapping(value = "/employee",method = RequestMethod.GET)
    public String employee(){
        return "/employee/employee";

    }

    @ApiOperation("登录账号")
    @RequestMapping(value = "/user",method = RequestMethod.GET)
    public String user(){
        return "/employee/user";
    }

    @ApiOperation("部门管理")
    @RequestMapping(value = "/dept",method = RequestMethod.GET)
    public String dept(){
        return "/employee/dept";
    }

    @ApiOperation("退出登录")
    @RequestMapping(value = "/logout",method = RequestMethod.POST)
    public String logout(){
        return "/login";
    }
}
