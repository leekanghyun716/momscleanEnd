package com.mom.client.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mom.client.notice.Notice;
import com.mom.client.notice.PageRequest3;
import com.mom.client.notice.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;

	@Override
	public Notice read(int noticeNo) throws Exception {
		return mapper.read(noticeNo);

	}

	// 게시글 전체 건수를 반환한다.
	@Override
	public int count() throws Exception {
		return mapper.count();
	}

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	@Override

	public List<Notice> list(PageRequest3 pageRequest) throws Exception {

		return mapper.list(pageRequest);
	}

}
