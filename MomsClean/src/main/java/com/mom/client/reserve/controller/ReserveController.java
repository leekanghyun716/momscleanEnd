package com.mom.client.reserve.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.mom.client.item.Option;
import com.mom.client.item.service.ItemService;
import com.mom.client.login.UserInfo;
import com.mom.client.reserve.Reserve;
import com.mom.client.reserve.service.ReserveService;
import com.mom.client.user.User;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/client/reserve")
public class ReserveController {
	@Autowired
	private ItemService service;

	@Autowired
	private ReserveService reserveService;

	@Value("${upload.path}")
	private String uploadPath;

	@RequestMapping(value = "/reserveRegister", method = RequestMethod.GET)
	public void list(String itemNo, Model model, HttpSession session) throws Exception {
		// 뷰에 페이징 처리를 한 게시글 목록을 전달한다.
		Reserve reserve = new Reserve();
		Item item = reserveService.getItem(itemNo);
		List<Option> option = reserveService.getOption();
		List<Option> yang = new ArrayList<Option>();
		List<Option> gimchi = new ArrayList<Option>();
		List<Option> common = new ArrayList<Option>();
		List<Option> smart = new ArrayList<Option>();
		List<Option> home = new ArrayList<Option>();
		List<Option> room = new ArrayList<Option>();
		for (Option list : option) {
			String nang = list.getItemName();
			String[] list2 = nang.split(" ");
			switch (list2[0]) {
			case "냉장고":
				yang.add(list);
				break;
			case "김치":
				gimchi.add(list);
				break;
			case "일반형":
				common.add(list);
				break;
			case "스마트":
				smart.add(list);
				break;
			case "가정용":
				home.add(list);
				break;
			case "방추가":
				room.add(list);
				break;
			}
		}
		UserInfo userInfo = (UserInfo) session.getAttribute("user");
		log.info(userInfo.getUserId());
		User user = reserveService.getUser(userInfo.getUserId());
		model.addAttribute("item", item);
		model.addAttribute("user", user);
		model.addAttribute("yang", yang);
		model.addAttribute("gimchi", gimchi);
		model.addAttribute("common", common);
		model.addAttribute("smart", smart);
		model.addAttribute("home", home);
		model.addAttribute("room", room);
		reserve.setItemNo(item.getItemNo());
		reserve.setReserveItemName(item.getItemName());
		reserve.setReserveItemPrice(item.getItemPrice());
		reserve.setUserId(user.getUserId());
		reserve.setUserName(user.getUserName());
		reserve.setUserNo(user.getUserNo());

		model.addAttribute(reserve);

	}

	@RequestMapping(value = "/reserveRegister", method = RequestMethod.POST)
	public String register(Reserve reserve, Model model, HttpSession session) throws Exception {

		String reserveOption1 = reserve.getReserveOptionName();
		StringBuilder reserveOptionBuilder = new StringBuilder();

		if (reserve.getReserveOptionName() != null && !reserve.getReserveOptionName().isEmpty()) {
			reserveOptionBuilder.append(reserve.getReserveOptionName()).append(",");
		}
		if (reserve.getReserveOptionName2() != null && !reserve.getReserveOptionName2().isEmpty()) {
			reserveOptionBuilder.append(reserve.getReserveOptionName2()).append(",");
		}
		if (reserve.getReserveOptionName3() != null && !reserve.getReserveOptionName3().isEmpty()) {
			reserveOptionBuilder.append(reserve.getReserveOptionName3()).append(",");
		}
		if (reserve.getReserveOptionName4() != null && !reserve.getReserveOptionName4().isEmpty()) {
			reserveOptionBuilder.append(reserve.getReserveOptionName4()).append(",");
		}
		if (reserve.getReserveOptionName5() != null && !reserve.getReserveOptionName5().isEmpty()) {
			reserveOptionBuilder.append(reserve.getReserveOptionName5()).append(",");
		}
		if (reserve.getReserveOptionName6() != null && !reserve.getReserveOptionName6().isEmpty()) {
			reserveOptionBuilder.append(reserve.getReserveOptionName6()).append(",");
		}

		String reserveOption = reserveOptionBuilder.toString();
		// 마지막에 추가된 쉼표 제거
		if (reserveOption.endsWith(",")) {
			reserveOption = reserveOption.substring(0, reserveOption.length() - 1);
		}

		String[] addr = reserve.getReserveAddr().split(",");
		String addr2 = null;
		if (addr.length == 2) {
			addr2 = addr[0] + " " + addr[1];
		} else if (addr.length == 3) {
			addr2 = addr[0] + " " + addr[1] + " " + addr[2];
		} else {
			addr2 = addr[0] + " " + addr[1] + " " + addr[2] + " " + addr[3];
		}
		reserve.setReserveOptionName(reserveOption);
		reserve.setReserveAddr(addr2);

		String userIdLength = Integer.toString(reserve.getUserNo());
		switch (userIdLength.length()) {
		case 1:
			userIdLength = "00000" + userIdLength;
			break;
		case 2:
			userIdLength = "0000" + userIdLength;
			break;
		case 3:
			userIdLength = "000" + userIdLength;
			break;
		case 4:
			userIdLength = "00" + userIdLength;
			break;
		case 5:
			userIdLength = "0" + userIdLength;
			break;
		}
		// 현재 시스템 날짜와 시간 정보를 가져온다.
		Date now = new Date();

		// 원하는 날짜 포맷 형식을 정의한다. (년도 끝 두 자리, 월, 일, 시간, 분, 초)
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");

		// 현재 날짜와 시간을 원하는 형식의 문자열로 변환한다.
		String formattedDate = sdf.format(now);
		String rNo = reserve.getItemNo() + userIdLength + formattedDate;
		reserve.setReserveNo(rNo);
		Option optionPrice1 = null;
		Option optionPrice2 = null;
		Option optionPrice3 = null;
		Option optionPrice4 = null;
		Option optionPrice5 = null;
		Option optionPrice6 = null;
		String itemName = reserveOption1;
		if (itemName.equals("") || itemName == null) {
			optionPrice1 = new Option();
			optionPrice1.setItemPrice(0);
		} else {
			optionPrice1 = reserveService.getOptionPrice(itemName);
		}
		itemName = reserve.getReserveOptionName2();
		if (itemName.equals("") || itemName == null) {
			optionPrice2 = new Option();
			optionPrice2.setItemPrice(0);
		} else {
			optionPrice2 = reserveService.getOptionPrice(itemName);
		}
		itemName = reserve.getReserveOptionName3();
		if (itemName.equals("") || itemName == null) {
			optionPrice3 = new Option();
			optionPrice3.setItemPrice(0);
		} else {
			optionPrice3 = reserveService.getOptionPrice(itemName);
		}
		itemName = reserve.getReserveOptionName4();
		if (itemName.equals("") || itemName == null) {
			optionPrice4 = new Option();
			optionPrice4.setItemPrice(0);
		} else {
			optionPrice4 = reserveService.getOptionPrice(itemName);
		}
		itemName = reserve.getReserveOptionName5();
		if (itemName.equals("") || itemName == null) {
			optionPrice5 = new Option();
			optionPrice5.setItemPrice(0);
		} else {
			optionPrice5 = reserveService.getOptionPrice(itemName);
		}
		itemName = reserve.getReserveOptionName6();
		if (itemName.equals("") || itemName == null) {
			optionPrice6 = new Option();
			optionPrice6.setItemPrice(0);
		} else {
			optionPrice6 = reserveService.getOptionPrice(itemName);
		}
		Integer totalOptionPrice = optionPrice1.getItemPrice() + optionPrice2.getItemPrice()
				+ optionPrice3.getItemPrice() + optionPrice4.getItemPrice() + optionPrice5.getItemPrice()
				+ optionPrice6.getItemPrice();
		reserve.setReserveOptionPrice(totalOptionPrice);
		reserveService.reserveRegister(reserve);

		return "redirect:/client/page";
	}

	@RequestMapping(value = "/getDisabledDates", method = RequestMethod.POST)
	@ResponseBody
	public List<String> getDisabledDates() throws Exception {
		// Your code to retrieve the list of dates to be disabled
		List<String> reserve = reserveService.getDate();
		List<String> disabledDates = new ArrayList<>();
		for (int i = 0; i < reserve.size(); i++) {
			String reserve2 = reserve.get(i);
			String[] reserveStr = reserve2.split("-");
			String[] reserveStr2 = reserveStr[2].split(" ");
			String[] reserveStr3;
			if (reserveStr[1].equals("11") || reserveStr[1].equals("12") || reserveStr[1].equals("10")) {
				reserveStr[1] = reserveStr[1];
			} else {
				reserveStr3 = reserveStr[1].split("0");
				reserveStr[1] = reserveStr3[1];
			}
			Integer integerNumber = Integer.parseInt(reserveStr2[0]);
			if (integerNumber < 10) {
				String[] reserveStr4 = reserveStr2[0].split("0");
				reserveStr[2] = reserveStr4[1];
			} else {
				String reserveStr4 = reserveStr2[0];
				reserveStr[2] = reserveStr4;
			}
			String reserveStr5 = reserveStr[0] + "-" + reserveStr[1] + "-" + reserveStr[2];
			disabledDates.add(reserveStr5);
		}
		// Add more dates if needed
		return disabledDates;
	}
}
