package com.mom.client.reference.controller;

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
import com.mom.client.reference.PageRequest2;
import com.mom.client.reference.Pagination2;
import com.mom.client.reference.Reference;
import com.mom.client.reference.service.ReferenceService;
import com.mom.client.user.User;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/client/reference")
public class ReferenceController {
	@Autowired
	private ReferenceService service;

	// 문의사항 게시글 등록페이지
	@RequestMapping(value = "/referenceRegister", method = RequestMethod.GET)

	public void registerForm(HttpServletRequest request, Model model) throws Exception {

		
		HttpSession newSession = request.getSession();
		UserInfo userInfo = (UserInfo) newSession.getAttribute("user");
		
		User user = service.user(userInfo.getUserId());
		
		Reference reference = new Reference();
		String referenceName = user.getUserName();
		reference.setUserNo(user.getUserNo());
		
		model.addAttribute("referenceName", referenceName);

		model.addAttribute(reference);
	}

	// 문의사항 등록 처리
	@RequestMapping(value = "/referenceRegister", method = RequestMethod.POST)
	public String register(Reference reference, RedirectAttributes rttr) throws Exception {
		service.register(reference);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/client/reference/referenceList";
	}

	@RequestMapping(value = "/referenceList", method = RequestMethod.GET)
	public void list(@ModelAttribute("pgrq") PageRequest2 pageRequest, Model
	model) throws Exception {

	// 뷰에 페이징 처리를 한 게시글 목록을 전달한다.
	model.addAttribute("list", service.list(pageRequest));
	// 페이징 네비게이션 정보를 뷰에 전달한다.
	Pagination2 pagination = new Pagination2();
	pagination.setPageRequest(pageRequest);
	pagination.setTotalCount(service.count());
	model.addAttribute("pagination", pagination);
	}
	
	// 문의글 상세 페이지
	@RequestMapping(value = "/referenceDetail", method = RequestMethod.GET)
	public void read(HttpServletRequest request,int referenceNo, Model model) throws Exception {
		HttpSession newSession = request.getSession();
		if(newSession.getAttribute("user") != null) {
			UserInfo userInfo = (UserInfo) newSession.getAttribute("user");
			
			User user = service.user(userInfo.getUserId());
			model.addAttribute("user",user);
		}
		
		model.addAttribute(service.read(referenceNo));
	}

	// 게시글 수정 페이지
	@RequestMapping(value = "/referenceModify", method = RequestMethod.GET)
	public void modifyForm(int referenceNo, Model model) throws Exception {
		String referenceName = "안휘";

		model.addAttribute("referenceName", referenceName);

		model.addAttribute(service.read(referenceNo));
	}

	// 게시글 수정 처리
	@RequestMapping(value = "/referenceModify", method = RequestMethod.POST)
	public String modify(Reference reference, RedirectAttributes rttr) throws Exception {

		service.modify(reference);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/client/reference/referenceList";
	}
	// 권한 부여
		@ResponseBody
		@RequestMapping(value = "/checkReference", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
		public String checkAuth(HttpServletRequest request) throws Exception {


			HttpSession newSession = request.getSession();

			String userId = null;

			UserInfo userInfo = null;
			

			if (newSession != null) {
				userInfo = (UserInfo) newSession.getAttribute("user");
				
				if (userInfo != null) {
					User user = service.user(userInfo.getUserId());
					userId = user.getUserId();
					}
				}

			if (userId == null) {
				return "SUCCESS";
			}
			return "FAIL";
		}

	}
