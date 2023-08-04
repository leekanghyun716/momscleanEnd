package com.mom.client.mypage.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mom.client.mypage.PageRequest1;
import com.mom.client.mypage.ReserveInfo;
import com.mom.client.mypage.mapper.MypageMapper;

@Service
 public class  MypageReserveInfoServiceImpl implements MypageReserveInfoService{
	
	@Autowired
	MypageMapper mapper;
	
	private Map<String, ReserveInfo> reservationMap = new HashMap<>();
	
	//예약현황 리스트
	 @Override
	 public List<ReserveInfo> list(String userId, int page, int sizePerPage ) throws Exception{
		return mapper.list(userId, page, sizePerPage);
	 }
	
	//예약현황 상세보기 
	@Override
	public ReserveInfo read(String reserveNo) throws Exception {
		return mapper.read(reserveNo);
	}
	
	//예약취소 요청 
	@Override
	public void cancelRequest(String reserveNo, String userId) throws Exception{
		mapper.cancelRequest(reserveNo, userId);
		 
	}
	
	
	//예약 전체 건수를 반환
	@Override
	public int count(String userId) throws Exception {
		return mapper.count(userId);
	}
	
	
	//회원탈퇴
	public void withdraw(String userId) throws Exception{
		mapper.withdraw(userId);

	}
	


}

