package com.mom.client.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mom.client.reserve.Reserve;
import com.mom.client.review.PageRequest;
import com.mom.client.review.Review;
import com.mom.client.review.mapper.ReviewMapper;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper mapper;

	// 게시글 등록 처리
	@Override
	public void register(Review review) throws Exception {
		mapper.create(review);
	}

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	@Override
	public List<Review> list(PageRequest pageRequest) throws Exception{
		return mapper.list(pageRequest);
	}

	// 게시글 상세 페이지
	@Override
	public Review read(Integer reviewNo) throws Exception {
		return mapper.read(reviewNo);
	}
	
	// 게시글 전체 건수를 반환한다.
	@Override
	public int count(PageRequest pageRequset) throws Exception{
		return mapper.count(pageRequset);
	}
	
	@Override
	public Reserve reserve(String userId) throws Exception {
		return mapper.reserve(userId);
	}

}
