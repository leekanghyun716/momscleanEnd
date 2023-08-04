package com.mom.client.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.mom.client.login.UserInfo;
import com.mom.client.user.User;
@Mapper
public interface UserMapper {
    void insertUser(User user);

	UserInfo getUserByIdAndPassword(String userId, String userPw);

	int isUserIdDuplicate(String userId);

	int checkDuplicateId(String userId);

	String findIdByNameAndEmail(String userName, String userEmail);

	 String findPwByIdNameAndEmail(String userId, String userName, String userEmail);
}
