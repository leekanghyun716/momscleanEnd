package com.mom.client.mypage;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReserveInfo {
	
	private int rNo;
	private String reserveNo;
	private String userNo;
	private String userName;
	private String userId;
	private String itemNo;
	private String reserveItemName;
	private String reserveItemPrice;
	private String reserveOptionName;
	private String reserveOptionPrice;
	private String reserveState;
	private String reserveAddr;
	private Date reserveDate;
	private Date cleanDate;
	private Date cancelDate;
	private String reserveRequest;
	private String cleanDone;
	
	
	

}

