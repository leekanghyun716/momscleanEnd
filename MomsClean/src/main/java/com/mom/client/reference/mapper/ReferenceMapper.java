package com.mom.client.reference.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mom.client.reference.PageRequest2;
import com.mom.client.reference.Reference;
import com.mom.client.user.User;

@Mapper
public interface ReferenceMapper {

	// 게시글 등록 처리
	public void create(Reference reference) throws Exception;

	// 게시글 목록 페이지
	//public List<Reference> list() throws Exception;
	
	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	public List<Reference> list(PageRequest2 pageRequest) throws Exception;

	// 게시글 상세 페이지
	public Reference read(Integer referenceNo) throws Exception;

	//게시글 수정 처리
	public void update(Reference reference) throws Exception;
	
	// 게시글 전체 건수를 반환한다.
	public int count() throws Exception;
	
	public User user(String userId) throws Exception;
}
