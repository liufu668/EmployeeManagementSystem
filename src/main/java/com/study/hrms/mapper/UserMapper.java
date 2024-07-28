package com.study.hrms.mapper;


import com.study.hrms.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {

    User findByUsername(String username);

    int updateByPrimaryKey(User record);

    int insert(User record);;
}
