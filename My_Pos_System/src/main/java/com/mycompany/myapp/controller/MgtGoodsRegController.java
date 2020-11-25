package com.mycompany.myapp.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.service.MgtGoodsRegService.MgtGoodsRegService;
import com.mycompany.vo.MgtGoodsRegVO;


@Controller
public class MgtGoodsRegController {

	@Inject
	private MgtGoodsRegService mgtGoodsRegService;
	
	@RequestMapping(value = "/Mgt_Goods_Reg", method = RequestMethod.GET)
	//DB 출력 동작 메서드
	public String MgtGoodsRegAll_retrieve(Model model){
		System.out.println("Controller 시작");		
		List<MgtGoodsRegVO> ret_mgtGoodsReg = mgtGoodsRegService.retrieve_mgtGoodsRegAll();
		System.out.println("ret_mgtGoodsReg : "+ret_mgtGoodsReg);
		model.addAttribute("Mgt_Goods_Reg",ret_mgtGoodsReg);
		
		return "Mgt_Goods_Reg/Mgt_Goods_Reg";
	}
	
	
	@RequestMapping(value = "/Mgt_Goods_Reg/insert_data", method = RequestMethod.POST)
	public String insert_data(@ModelAttribute MgtGoodsRegVO MgtGoodsRegVO){
		
		System.out.print(MgtGoodsRegVO.toString()); //view에서 제대로 값 던져주는지 확인하기	
		mgtGoodsRegService.insert_data(MgtGoodsRegVO);
		return "redirect:/Mgt_Goods_Reg";
	}
	

}
