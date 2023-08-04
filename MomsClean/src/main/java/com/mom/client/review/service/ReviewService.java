package com.mom.client.review.service;

import java.util.List;

import com.mom.client.reserve.Reserve;
import com.mom.client.review.PageRequest;
import com.mom.client.review.Review;

public interface ReviewService {
	
	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	public List<Review> list(PageRequest pageRequest) throws Exception;

	// 게시글 등록 처리
	public void register(Review review) throws Exception;

	// 게시글 상세 페이지
	public Review read(Integer reviewNo) throws Exception;
	
	// 검색 처리된 게시글 건수를 반환한다.
	public int count(PageRequest pageRequest) throws Exception;
	
	// 예약 테이블 참조
	public Reserve reserve(String userId) throws Exception;
	
	

}
