package com.mom.client.login.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface LoginMapper {
	
	 // 아이디 찾기를 위한 쿼리
    String findIdByNameAndEmail(@Param("name") String name, @Param("email") String email);

    
    
}


