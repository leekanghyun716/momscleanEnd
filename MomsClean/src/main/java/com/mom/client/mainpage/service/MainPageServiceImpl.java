package com.mom.client.mainpage.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mom.client.mainpage.mapper.MainPageMapper;
import com.mom.client.review.Review;

import lombok.extern.java.Log;
@Log
@Service
public class MainPageServiceImpl implements MainPageService{
	@Autowired
	MainPageMapper mapper;
	
	@Override
	public List<Review> getReview() throws Exception {
		// TODO Auto-generated method stub
		List<Review> list=mapper.getReview();
		return mapper.getReview();
	}
}
