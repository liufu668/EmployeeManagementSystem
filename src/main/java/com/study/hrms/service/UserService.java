package com.study.hrms.service;

import com.study.hrms.entity.User;
import com.study.hrms.qo.UserQO;

import java.util.List;

public interface UserService {

    //根据用户名获取用户信息
    User getUserByUsername(String username);

    //更新用户信息
    void edit(User user);

    //新增用户
    int addUser(User user);

    //系统用户列表
    List<User> list(UserQO userQO);

    User findById(Integer userId);

    void editSelective(User user);

    void add(User user);

    void deleteById(Integer id);
}
