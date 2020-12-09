package com.mycompany.myapp.controller;

import org.apache.log4j.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class memberController {
	
	
	//로그인 페이지 입장 defualt = get 방식
	@RequestMapping(value = "/login")
	public String loginpage(){
		
		
		return "logInfo/login";
	}
	
	//로그인 동작
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String member_login(){
		
		return "/";
	}
	
	//회원 가입
	@RequestMapping(value = "/memberJoin")
	public String member_Join(){
		return "logInfo/memberJoin";
	}

}
