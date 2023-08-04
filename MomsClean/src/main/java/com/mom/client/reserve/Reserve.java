package com.mom.client.reserve;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Reserve {
	private Integer rNo;
	private String reserveNo;
	private Integer userNo;
	private String userId;
	private String userName;
	private String itemNo;
	private String reserveItemName;
	private Integer reserveItemPrice;
	private String reserveOptionName;
	private String reserveOptionName2;
	private String reserveOptionName3;
	private String reserveOptionName4;
	private String reserveOptionName5;
	private String reserveOptionName6;
	private Integer reserveOptionPrice;
	private String reserveState;
	private String reserveAddr;
	private Date reserveDate;
	private String cleanDate;
	private Date cancleDate;
	private String reserveRequest;
	private String cleanDone;

}
