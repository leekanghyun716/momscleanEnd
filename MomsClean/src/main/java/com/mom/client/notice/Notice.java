package com.mom.client.notice;

import java.util.Date;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Notice {
	private int noticeNo;
    private String noticeTitle;
    private String noticeContent;
    private Date noticeDate;
	


}
