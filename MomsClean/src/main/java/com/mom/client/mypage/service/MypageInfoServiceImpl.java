package com.mom.client.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mom.client.mypage.Mypage;
import com.mom.client.mypage.mapper.MypageMapper;


@Service
public class MypageInfoServiceImpl implements MypageInfoService {
	
	@Autowired
	MypageMapper mapper;
	

	//내정보 보기
	@Override
	public Mypage view(String userId) throws Exception{
		 return mapper.view(userId);
	}
	//수정하기
	@Transactional
	@Override
	public void modify(Mypage mypage) throws Exception{
		mapper.update(mypage);
		
	}
	//탈퇴하기
	@Override
	public void withdraw(String userId) throws Exception{
	    mapper.withdraw(userId);
	}
	//로그아웃하기
	@Override
	public void logout(Mypage mypage) throws Exception{
		
	}
	
	

}
