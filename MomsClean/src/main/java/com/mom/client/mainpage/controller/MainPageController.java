package com.mom.client.mainpage.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mom.client.mainpage.service.MainPageService;
import com.mom.client.review.Review;

import lombok.extern.java.Log;
@Log
@Controller
@RequestMapping("/client")
public class MainPageController{
	@Autowired
	MainPageService service;
	
	
	 @RequestMapping(value="/page",method = RequestMethod.GET)
	 public void page(Model model) throws Exception{
		 List<Review> list=service.getReview();
		 
		 model.addAttribute("list",list);
		 
	 }
}
