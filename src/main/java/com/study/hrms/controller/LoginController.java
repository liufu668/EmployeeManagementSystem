package com.study.hrms.controller;

import com.study.hrms.common.CommonCode;
import com.study.hrms.common.CommonResult;
import com.study.hrms.entity.User;
import com.study.hrms.service.UserService;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

@Controller
public class LoginController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserService userService;

    @ApiOperation("跳转登录页")
    @RequestMapping(value = "/loginPage",method = RequestMethod.GET)
    public String loginPage(){
        return "/login";
    }

    @ApiOperation("跳转注册页")
    @RequestMapping(value = "/registerPage",method = RequestMethod.GET)
    public String registerPage(){
        return "/register";
    }

    @ApiOperation("退出登录")
    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logPage(HttpServletRequest request){
        request.getSession().removeAttribute(CommonCode.SESSION_USER);
        return "/login";
    }

    @ApiOperation("登录")
    @ResponseBody
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public CommonResult login(@RequestBody User user, HttpServletRequest request, HttpServletResponse response){
        CommonResult commonResult = new CommonResult();
        //校验参数是否为空
        if(user == null || StringUtils.isEmpty(user.getUsername()) || StringUtils.isEmpty(user.getPassword())){
            commonResult.setCode(CommonCode.FAIL);
            commonResult.setMsg("用户名和密码不能为空!!");
            return commonResult;
        }
        //根据用户名查询用户
        User userByUsername = userService.getUserByUsername(user.getUsername());
        if(userByUsername != null){
            if(userByUsername.getPassword().equals(user.getPassword())){

                //更新最新登录时间
                userByUsername.setLastLoginTime(new Date());
                userService.edit(userByUsername);
                commonResult.setCode(CommonCode.SUCCESS);
                //将用户信息放入session
                request.getSession().setAttribute(CommonCode.SESSION_USER,user);
            }else{
                commonResult.setCode(CommonCode.FAIL);
                commonResult.setMsg("密码不正确!!");
            }
        }else{
            commonResult.setCode(CommonCode.FAIL);
            commonResult.setMsg("用户名不正确!!");
        }
        return commonResult;
    }

    @ApiOperation("注册")
    @ResponseBody
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public CommonResult register(@RequestBody User user,HttpServletRequest request,HttpServletResponse response){
        CommonResult commonResult = new CommonResult();
        //校验参数是否为空
        if(user == null || StringUtils.isEmpty(user.getUsername()) || StringUtils.isEmpty(user.getPassword())){
            commonResult.setCode(CommonCode.FAIL);
            commonResult.setMsg("用户名和密码不能为空!!");
            return commonResult;
        }
        User userByUsername = userService.getUserByUsername(user.getUsername());
        if(userByUsername != null){
            commonResult.setCode(CommonCode.FAIL);
            commonResult.setMsg("用户名已经存在!!");
        }else{
            //更新新用户创建时间
            user.setCreatetime(new Date());
            //存储加密后的新用户信息
            int result = userService.addUser(user);
            if(result == 1){
                commonResult.setCode(CommonCode.SUCCESS);
            }else{
                commonResult.setCode(CommonCode.FAIL);
                commonResult.setMsg("系统原因,请重试或联系管理员!!");
            }
        }
        return commonResult;
    }
}
