package com.mom.client.user.service;

import com.mom.client.login.UserInfo;
import com.mom.client.user.User;

public interface UserService {
    void registerUser(User user);

    UserInfo getUserByIdAndPassword(String userId, String userPw);

    boolean isUserIdDuplicate(String userId);

    String findIdByNameAndEmail(String userName, String userEmail);

	String findPwByIdNameAndEmail(String userId, String userName, String userEmail);
    
    
}
