package com.mom.client.login.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mom.client.login.UserInfo;
import com.mom.client.user.mapper.UserMapper;
import com.mom.client.user.service.UserService;

@Service
public class LoginServiceImpl implements LoginService {

    private final UserService userService;
    private final UserMapper userMapper;

    @Autowired
    public LoginServiceImpl(UserService userService, UserMapper userMapper) {
        this.userService = userService;
        this.userMapper = userMapper;
    }

    @Override
    public boolean authenticate(String username, String password) {
        // User user = userService.getUserByIdAndPassword(username, password);
        // return user != null;
        return false;
    }

    public UserInfo getUserByIdAndPassword(String name, String password) {
        // TODO Auto-generated method stub
        return null;
    }

	@Override
	public String findIdByNameAndEmail(String name, String email) {
		// TODO Auto-generated method stub
		return null;
	}
}
