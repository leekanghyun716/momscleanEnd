package com.mom.client.item;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Option {
	private Integer iNo;
	private String itemDivision;
	private String itemName;
	private Integer itemPrice;
	private Date itemRegDate;
}
