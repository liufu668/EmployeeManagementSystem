package com.study.hrms.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.study.hrms.common.CommonResult;
import com.study.hrms.common.PageCommonResult;
import com.study.hrms.entity.User;
import com.study.hrms.qo.UserQO;
import com.study.hrms.service.UserService;
import com.study.hrms.vo.EmployeeVO;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@Controller
public class UserController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    UserService userService;

    @ApiOperation("添加账号")
    @ResponseBody
    @RequestMapping(value = "/user/add",method = RequestMethod.POST)
    public CommonResult userAdd(@RequestBody User user){
        CommonResult commonResult = new CommonResult();
        User userByUsername = userService.getUserByUsername(user.getUsername());
        if(userByUsername != null){//用户名重复
            /**
             * user.getId() == null,说明是添加新用户,直接判定用户名重复
             * user.getId() != null,说明是修改旧用户,
             *                      如果当前用户ID与数据库中查到的ID不同,说明在数据库里一个用户名对应了多个ID
             */
            if(user.getId() == null || (user.getId() != null && userByUsername.getId() != user.getId())){
                commonResult = CommonResult.fail("用户名已存在");
                return commonResult;
            }
        }else{//用户名不重复
            if(user !=null && user.getId() != null){//修改旧用户
                User userDB = userService.findById(user.getId());
                userDB.setUsername(user.getUsername());
                userDB.setRealname(user.getRealname());
                userService.editSelective(userDB);
            }else{//添加新用户
                //对密码进行加密
                System.out.println(user.getPaword());
                user.setPaword(DigestUtils.md5DigestAsHex(user.getPaword().getBytes()));
                user.setCreatetime(new Date());
                userService.add(user);
            }
        }
        commonResult = CommonResult.success();
        return commonResult;
    }

    @ApiOperation("删除账号")
    @ResponseBody
    @RequestMapping(value = "/user/delete/{id}",method = RequestMethod.DELETE)
    public CommonResult userDelete(@PathVariable Integer id){
        userService.deleteById(id);
        CommonResult commonResult = CommonResult.success();
        return commonResult;
    }

    @ApiOperation("修改账号")
    @ResponseBody
    @RequestMapping(value = "/user/search/{id}",method = RequestMethod.POST)
    public CommonResult userSearch(@RequestBody String name,@PathVariable Integer id) throws JsonProcessingException {

        //从前端返回的JSON字符串中提取出用户名和真实姓名
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(name);
        String username = jsonNode.get("username").asText();
        String realname = jsonNode.get("realname").asText();

        //根据ID找到数据库中的这条用户信息,更改部分信息
        User user = userService.findById(id);
        user.setUsername(username);
        user.setRealname(realname);
        userService.editSelective(user);
        CommonResult commonResult = CommonResult.success();
        return commonResult;
    }

    @ApiOperation("修改密码")
    @ResponseBody
    @RequestMapping(value = "/user/editPaword/{id}",method = RequestMethod.POST)
    public CommonResult editPaword(@RequestBody String newPassword,@PathVariable Integer id) throws JsonProcessingException {
        /**
         * 因为前端返回的newPassword是JSON字符串,{"paword":"12121212","id":"user"}
         * 需要从中提取密码出来,所以使用JSON库,如Jackson来解析JSON字符串
         */
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(newPassword);
        String password = jsonNode.get("paword").asText();

        User userDB = userService.findById(id);
        userDB.setPaword(DigestUtils.md5DigestAsHex(password.getBytes()));
        userService.edit(userDB);
        CommonResult commonResult = CommonResult.success();
        return commonResult;
    }

    @ApiOperation("查询账号")
    @ResponseBody
    @RequestMapping(value = "/user/list",method = RequestMethod.POST)
    public PageCommonResult userList(@RequestBody UserQO userQO){
        PageHelper.startPage(userQO.getPage(),userQO.getLimit());
        List<User> userList = userService.list(userQO);
        PageInfo<EmployeeVO> pageInfo = new PageInfo(userList);
        PageCommonResult commonResult = PageCommonResult.success(pageInfo.getList(), pageInfo.getTotal());
        return commonResult;
    }
}
