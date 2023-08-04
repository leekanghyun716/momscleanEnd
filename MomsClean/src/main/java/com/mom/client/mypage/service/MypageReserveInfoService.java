package com.mom.client.mypage.service;

import java.util.List;

import com.mom.client.mypage.PageRequest1;
import com.mom.client.mypage.ReserveInfo;

public interface MypageReserveInfoService {

	
	
	//예약현황 리스트 
	public List<ReserveInfo> list(String userId, int page, int sizePerPage ) throws Exception;
	
	
	//예약현황 상세보기
	public ReserveInfo read(String reserveNo) throws Exception;
	
	//예약 취소신청
	public void  cancelRequest(String reserveNo, String userId) throws Exception;
	
	
	//게시글 전체 건수를 반환
	public int count(String userId) throws Exception;
	
	//회원탈퇴
	public void withdraw(String userId) throws Exception;


}
