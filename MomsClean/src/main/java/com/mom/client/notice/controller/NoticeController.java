
package com.mom.client.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mom.client.notice.Notice;
import com.mom.client.notice.PageRequest3;
import com.mom.client.notice.Pagination3;
import com.mom.client.notice.service.NoticeService;

import lombok.extern.java.Log;

@Log
@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;

	// 공지사항 상세 페이지
	@RequestMapping(value = "/client/notice/noticeDetail", method = RequestMethod.GET)
	public void read(int noticeNo, Model model) throws Exception {

		model.addAttribute(service.read(noticeNo));

	}

	@RequestMapping(value = "/client/notice/noticeList", method = RequestMethod.GET)
	public void list(@ModelAttribute("pgrq") PageRequest3 pageRequest, Model model, int page) throws Exception { // 뷰에
																													// 페이징
																													// 처리를
																													// 한
																													// 게시글
																													// 목록을
																													// 전달한다.
		model.addAttribute("list", service.list(pageRequest));

		// 페이징 네비게이션 정보를 뷰에 전달한다.
		Pagination3 pagination = new Pagination3();
		pagination.setPageRequest(pageRequest);
		pagination.setTotalCount(service.count());

		model.addAttribute("pagination", pagination);

	}

	// 회사소개 페이지

	@RequestMapping(value = "/client/intro/companyintr", method = RequestMethod.GET)
	public void Commpanyintr(Model model) throws Exception {

		Notice notice = new Notice();

		model.addAttribute(notice);

	}

}
