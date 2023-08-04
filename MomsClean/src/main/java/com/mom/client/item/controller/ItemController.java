package com.mom.client.item.controller;



import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.annotation.security.PermitAll;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mom.client.item.Item;
import com.mom.client.item.service.ItemService;

import lombok.extern.java.Log;
@Log
@PermitAll
@Controller
@RequestMapping("/client/item")
public class ItemController {

	@Autowired
	private ItemService service;

	@RequestMapping(value = "/itemInfo", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		// 뷰에 페이징 처리를 한 게시글 목록을 전달한다.
		List<Item> list = service.list();
		
		model.addAttribute("list", service.list());
	}

	

}
