package com.mom.client.review.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mom.client.login.UserInfo;
import com.mom.client.reserve.Reserve;
import com.mom.client.review.CodeLabelValue;
import com.mom.client.review.PageRequest;
import com.mom.client.review.Pagination;
import com.mom.client.review.Review;
import com.mom.client.review.service.ReviewService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("client/review")
public class ReviewController {

	@Autowired
	private ReviewService service;

	// 게시글 등록 페이지
	@RequestMapping(value = "/reviewRegister", method = RequestMethod.GET)
	public void registerForm(HttpServletRequest request, Model model, RedirectAttributes rttr) throws Exception {

		HttpSession newSession = request.getSession();
		UserInfo userInfo = (UserInfo) newSession.getAttribute("user");

		Reserve reserve = service.reserve(userInfo.getUserId());

		Review review = new Review();
		review.setReserveNo(reserve.getReserveNo());
		review.setUserNo(reserve.getUserNo());

		String serviceName = null;

		switch (Integer.parseInt(review.getReserveNo().substring(0, 2))) {

		case 18:
			serviceName = "A";
			break;
		case 25:
			serviceName = "B";
			break;
		case 30:
			serviceName = "C";
			break;
		case 35:
			serviceName = "D";
			break;
		case 40:
			serviceName = "E";
			break;
		case 50:
			serviceName = "F";
			break;
		}

		model.addAttribute(review);

		model.addAttribute("serviceName", serviceName);


	}

	// 게시글 등록 처리
	@RequestMapping(value = "/reviewRegister", method = RequestMethod.POST)
	public String register(Review review, RedirectAttributes rttr) throws Exception {
		service.register(review);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/client/review/reviewList";
	}

	// 게시글 상세 페이지
	@RequestMapping(value = "/reviewDetail", method = RequestMethod.GET)
	public void read(int reviewNo, @ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		Review review = service.read(reviewNo);

		String serviceName = null;

		switch (Integer.parseInt(review.getReserveNo().substring(0, 2))) {
		case 18:

			serviceName = "A";
			break;
		case 25:
			serviceName = "B";
			break;
		case 30:
			serviceName = "C";
			break;
		case 35:
			serviceName = "D";
			break;
		case 40:
			serviceName = "E";
			break;
		case 50:
			serviceName = "F";
			break;
		}

		model.addAttribute("serviceName", serviceName);
		model.addAttribute(review);
	}

	// 페이징 요청 정보를 매개 변수로 받고 다시 뷰에 전달한다.
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public void list(@ModelAttribute("pgrq") PageRequest pageRequest, Model model, HttpSession session)
			throws Exception {
		// 뷰에 페이징 처리를 한 게시글 목록을 전달한다.
		model.addAttribute("list", service.list(pageRequest));

		// 페이징 네비게이션 정보를 뷰에 전달한다.
		Pagination pagination = new Pagination();
		pagination.setPageRequest(pageRequest);

		// 페이지 네비게이션 정보에 검색 처리된 게시글 건수를 저장한다.
		pagination.setTotalCount(service.count(pageRequest));

		model.addAttribute("pagination", pagination);
		model.addAttribute("keyword", pageRequest.getKeyword());

	}

	// 권한 부여
	@ResponseBody
	@RequestMapping(value = "/checkRegister", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String checkAuth(HttpServletRequest request) throws Exception {


		HttpSession newSession = request.getSession();

		Reserve reserve;
		String reserveNo = null;
		String cleanDone = null;
		UserInfo userInfo = null;

		if (newSession != null) {
			userInfo = (UserInfo) newSession.getAttribute("user");
			if (userInfo != null) {
				reserve = service.reserve(userInfo.getUserId());
				if (reserve != null) {
					reserveNo = reserve.getReserveNo();
					cleanDone = reserve.getCleanDone();
				}
			}
		}

		if (reserveNo == null || cleanDone.equals("N")) {
			return "SUCCESS";
		}
		return "FAIL";
	}

}
