package com.mom.client.notice.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.mom.client.notice.Notice;
import com.mom.client.notice.PageRequest3;

@Service
public interface NoticeService{
	
	
	/*
	 * //공지사항 목록 페이지 public List<Notice> list()throws Exception;
	 */
	
	//공시사항 상세 페이지
	public Notice read(int noticeNo)throws Exception; 
	

	//게시글 전체 건수를 반환한다.
	public int count() throws Exception;
		
	//페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	public List<Notice> list(PageRequest3 pageRequest) throws Exception;




	
	
    
	
	
}