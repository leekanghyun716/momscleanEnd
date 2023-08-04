package com.mom.client.reserve.service;

import java.util.List;

import com.mom.client.item.Item;
import com.mom.client.item.Option;
import com.mom.client.reserve.Reserve;
import com.mom.client.user.User;

public interface ReserveService {

	public Item getItem(String itemNo) throws Exception;
	
	public User getUser(String userId) throws Exception;

	public List<Option> getOption()throws Exception;

	public void reserveRegister(Reserve reserve);

	public Option getOptionPrice(String itemName);
	
	public List<String> getDate() throws Exception;
	
	
	
	

}
