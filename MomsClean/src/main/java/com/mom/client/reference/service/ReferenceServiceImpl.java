package com.mom.client.reference.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mom.client.reference.PageRequest2;
import com.mom.client.reference.Reference;
import com.mom.client.reference.mapper.ReferenceMapper;
import com.mom.client.user.User;

@Service
public class ReferenceServiceImpl implements ReferenceService {

	@Autowired
	private ReferenceMapper mapper;

	// 게시글 등록 처리
	@Override
	public void register(Reference reference) throws Exception {
		mapper.create(reference);
	}

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	@Override
	public List<Reference> list(PageRequest2 pageRequest) throws Exception {
		return mapper.list(pageRequest);
	}

	// 게시글 상세 페이지
	@Override
	public Reference read(Integer referenceNo) throws Exception {
		return mapper.read(referenceNo);
	}

	// 게시글 수정 처리
	@Override
	public void modify(Reference reference) throws Exception {
		mapper.update(reference);
	}

	// 게시글 전체 건수를 반환한다.
	@Override
	public int count() throws Exception {
		return mapper.count();
	}

	@Override
	public User user(String userId) throws Exception {
		return mapper.user(userId);
	}
}
