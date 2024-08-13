package com.study.hrms.mapper;


import com.study.hrms.entity.User;
import com.study.hrms.qo.UserQO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

    User findByUsername(String username);

    int updateByPrimaryKey(User record);

    int insert(User record);

    List<User> list(UserQO userQO);

    User selectByPrimaryKey(Integer id);

    void updateByPrimaryKeySelective(User user);

    int deleteByPrimaryKey(Integer id);

}
