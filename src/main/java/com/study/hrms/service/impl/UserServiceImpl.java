package com.study.hrms.service.impl;


import com.study.hrms.entity.User;
import com.study.hrms.mapper.UserMapper;
import com.study.hrms.qo.UserQO;
import com.study.hrms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public List<User> list(UserQO userQO) {
        return userMapper.list(userQO);
    }

    @Override
    public User findById(Integer userId) {
        return userMapper.selectByPrimaryKey(userId);
    }

    @Override
    public void editSelective(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public void add(User user) {
        userMapper.insert(user);
    }

    @Override
    public void deleteById(Integer id) {
        userMapper.deleteByPrimaryKey(id);
    }
}
