package com.mom.client.login;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserInfo {
    private String userId;
    private String userPw;
	public String userName;
	public String userEmail;
    
}