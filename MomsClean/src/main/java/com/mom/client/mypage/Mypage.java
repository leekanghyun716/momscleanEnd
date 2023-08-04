package com.mom.client.mypage;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Mypage {
    
	
	private int userNo;
	private String userId;
	private String userPw;
	private String checkPw;
	private String userName;
	private String userPhone;
	private String userEmail;
	private String emailAuth;
	private Date regDate;
	private Date withdrawDate;
	private String userDivision;
	
}
