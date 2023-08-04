package com.mom.client.reserve.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mom.client.item.Item;
import com.mom.client.item.Option;
import com.mom.client.reserve.Reserve;
import com.mom.client.user.User;
@Mapper
public interface ReserveMapper {

	public Item getItem(String itemNo) throws Exception;
	
	public User getUser(String userId) throws Exception;
	
	public List<Option> getOption() throws Exception;

	public void reserveRegister(Reserve reserve);

	public Option getOptionPrice(String itemName);
	
	public List<String> getDate() throws Exception;
	
	
}
