package com.mom.client.mypage.service;

import com.mom.client.mypage.Mypage;
import com.mom.client.mypage.ReserveInfo;



public interface MypageInfoService {
	
	//내정보 보기
	public Mypage view(String userId) throws Exception;
	//내정보 수정하기
	public void modify(Mypage mypage) throws Exception;
    //회원탈퇴
	public void withdraw(String userId)throws Exception;
	//로그아웃
	public void logout(Mypage mypage) throws Exception;
	

	
	

}


		  

