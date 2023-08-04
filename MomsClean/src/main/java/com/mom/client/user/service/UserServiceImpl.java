package com.mom.client.user.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mom.client.login.UserInfo;
import com.mom.client.user.User;
import com.mom.client.user.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

    private UserMapper userMapper;

    @Autowired
    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    @Transactional
    public void registerUser(User user) {
        userMapper.insertUser(user);
    }

    @Override
    public UserInfo getUserByIdAndPassword(String userId, String userPw) {
        return userMapper.getUserByIdAndPassword(userId, userPw);
    }

    @Override
    public boolean isUserIdDuplicate(String userId) {
        int count = userMapper.checkDuplicateId(userId);
        return count > 0;
    }

    @Override
    public String findIdByNameAndEmail(String userName, String userEmail) {
        

        return userMapper.findIdByNameAndEmail(userName,userEmail);
    }

    @Override
    public String findPwByIdNameAndEmail(String userId, String userName, String userEmail) {
        return userMapper.findPwByIdNameAndEmail(userId, userName, userEmail);
    }
}

