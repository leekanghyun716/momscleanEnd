package com.mom.client.login.service;

public interface LoginService {
	boolean authenticate(String username, String password);
	
	 String findIdByNameAndEmail(String name, String email);
}
