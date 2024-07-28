package com.study.hrms.service.impl;


import com.study.hrms.entity.User;
import com.study.hrms.mapper.UserMapper;
import com.study.hrms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User getUserByUsername(String username) {
        return userMapper.findByUsername(username);
    }

    @Override
    public void edit(User user) {
        userMapper.updateByPrimaryKey(user);
    }

    @Override
    public int addUser(User user) {
        return userMapper.insert(user);
    }
}
