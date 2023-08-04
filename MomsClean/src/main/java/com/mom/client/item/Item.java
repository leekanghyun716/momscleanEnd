package com.mom.client.item;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Item {
	private Integer iNo;
	private String itemNo;
	private String itemDivision;
	private String itemName;
	private Integer itemPrice;
	private String itemImgThumb;
	private String itemImg;
	private Date itemRegDate;
}
