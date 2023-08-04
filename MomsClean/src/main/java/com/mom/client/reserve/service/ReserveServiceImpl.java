package com.mom.client.reserve.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mom.client.item.Item;
import com.mom.client.item.Option;
import com.mom.client.reserve.Reserve;
import com.mom.client.reserve.mapper.ReserveMapper;
import com.mom.client.user.User;
@Service
public class ReserveServiceImpl implements ReserveService{
	@Autowired
	ReserveMapper mapper;
	
	@Override
	public Item getItem(String itemNo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getItem(itemNo);
	}

	@Override
	public User getUser(String userId) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getUser(userId);
	}

	@Override
	public List<Option> getOption() throws Exception {
		// TODO Auto-generated method stub
		return mapper.getOption();
	}

	@Override
	public void reserveRegister(Reserve reserve) {
		mapper.reserveRegister(reserve);
		
	}

	@Override
	public Option getOptionPrice(String itemName) {
		// TODO Auto-generated method stub
		return mapper.getOptionPrice(itemName);
	}

	@Override
	public List<String> getDate() throws Exception {
		// TODO Auto-generated method stub
		return mapper.getDate();
	}


}
