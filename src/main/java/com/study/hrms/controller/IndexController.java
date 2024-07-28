package com.study.hrms.controller;

import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class IndexController {

    @ApiOperation("首页")
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String loginPage(){
        return "/index";
    }
}
