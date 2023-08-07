package com.mom.client.mypage.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mom.client.mypage.Mypage;

import com.mom.client.mypage.ReserveInfo;

@Mapper
public interface MypageMapper {
	//내정보 보기 
	public Mypage view(String userId) throws Exception;
	
	//내정보 수정처리
	public void update(Mypage mypage) throws Exception;
	
	
	//회원탈퇴 유지->탈퇴 처리
	public void withdraw(String userId) throws Exception;
		  
	//예약현황 리스트 
	public List<ReserveInfo> list(String userId, int page, int sizePerPage ) throws Exception;
		
	//예약 상세보기
	public ReserveInfo read(String reserveNo) throws Exception;
	
	//예약취소요청
	public void cancelRequest(@Param("reserveNo")String reserveNo, @Param("userId") String userId) throws Exception;
		
	//예약 전체 건수를 반환
	public int count(String userId) throws Exception;
	
	
 
}
