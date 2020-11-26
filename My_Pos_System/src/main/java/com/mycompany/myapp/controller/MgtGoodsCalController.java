package com.mycompany.myapp.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.service.MgtGoodsCalService.MgtGoodsCalService;
import com.mycompany.vo.MgtGoodsCalVO;


@Controller
public class MgtGoodsCalController {

	@Inject
	private MgtGoodsCalService mgtGoodsRegService;
	
	//���� ȭ��
	@RequestMapping(value = "/Mgt_Goods_Cal", method = RequestMethod.GET)
	//DB ��� ���� �޼���
	public String MgtGoodsCal(Model model){
		
		return "Mgt_Goods_Cal/Mgt_Goods_Cal";
	}
	
	// DB��ȸ ��� ���� �޼���
	@RequestMapping(value = "/Mgt_Goods_Cal_retrieve", method = RequestMethod.POST)	
	public String MgtGoodsCal_retrieve(Model model,@ModelAttribute MgtGoodsCalVO MgtGoodsCalVO){
		
	 if(!MgtGoodsCalVO.getGoods_b_cd().isEmpty()){		
		List<MgtGoodsCalVO> retrieve_mgtGoodscal = mgtGoodsRegService.retrieve_mgtGoodsRegAll(MgtGoodsCalVO);		
		model.addAttribute("Mgt_Goods_Cal",retrieve_mgtGoodscal);
		
		return "Mgt_Goods_Cal/Mgt_Goods_Cal";
	 }
	 else{
		return "redirect:/Mgt_Goods_Cal";
	 }
	}
	
	@RequestMapping(value = "/Mgt_Goods_Cal/retrieve", method = RequestMethod.GET)	
	public String MgtGoodsCal_retrieve_get(Model model){
		
		
		return "Mgt_Goods_Cal/Mgt_Goods_Cal";
	}
	
	/*
	@RequestMapping(value = "/Mgt_Goods_Reg/insert_data", method = RequestMethod.POST)
	public String insert_data(@ModelAttribute MgtGoodsRegVO MgtGoodsRegVO){
		
		System.out.print(MgtGoodsRegVO.toString()); //view���� ����� �� �����ִ��� Ȯ���ϱ�	
		mgtGoodsRegService.insert_data(MgtGoodsRegVO);
		return "redirect:/Mgt_Goods_Reg";
	}
    */
}
