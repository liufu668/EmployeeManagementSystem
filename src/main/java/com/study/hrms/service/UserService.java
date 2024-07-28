package com.study.hrms.service;

import com.study.hrms.entity.User;

public interface UserService {

    //根据用户名获取用户信息
    User getUserByUsername(String username);

    //更新用户信息
    void edit(User user);

    //新增用户
    int addUser(User user);
}
