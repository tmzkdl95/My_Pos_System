package com.mycompany.myapp.controller;

import org.apache.log4j.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class memberController {
	
	
	//�α��� ������ ���� defualt = get ���
	@RequestMapping(value = "/login")
	public String loginpage(){
		
		
		return "logInfo/login";
	}
	
	//�α��� ����
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String member_login(){
		
		return "/";
	}
	
	//ȸ�� ����
	@RequestMapping(value = "/memberJoin")
	public String member_Join(){
		return "logInfo/memberJoin";
	}

}
