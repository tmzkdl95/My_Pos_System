package com.mycompany.myapp.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.mapper.mapper_interface.testPageMapper;
import com.mycompany.service.testPageService.testPage_Service;
import com.mycompany.vo.testPage;

@Controller
public class MgtGoodsRegController {

	@Inject
	private testPage_Service testPage_service;
	
	@RequestMapping(value = "/Mgt_Goods_Reg", method = RequestMethod.GET)
	//DB 출력 동작 메서드
	public String testPage_print(Model model){
		
		//List<testPage> tpList = testPage_service.printDB();
		//model.addAttribute("testpage",tpList);
		
		return "Mgt_Goods_Reg/Mgt_Goods_Reg";
	}
	
	@RequestMapping(value = "/Mgt_Goods_Reg/insert_data", method = RequestMethod.POST)
	public String insert_data(@ModelAttribute testPage testpage){
		
		//System.out.print(testpage.toString()); //view에서 제대로 값 던져주는지 확인하기	
		//testPage_service.insert_data(testpage);
		return "redirect:/Mgt_Goods_Reg";
	}
	

}
