package com.mom.client.mainpage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mom.client.review.Review;
@Mapper
public interface MainPageMapper {

	public List<Review> getReview()throws Exception;

}
