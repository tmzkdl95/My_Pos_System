package com.mycompany.myapp.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.service.MgtGoodsCalService.MgtGoodsCalService;
import com.mycompany.vo.MgtGoodsCalVO;


@Controller
public class MgtGoodsCalController {

	@Inject
	private MgtGoodsCalService mgtGoodsRegService;
	
	//
	@RequestMapping(value = "/Mgt_Goods_Cal", method = RequestMethod.GET)
	public String MgtGoodsCal(Model model){
		
		return "Mgt_Goods_Cal/Mgt_Goods_Cal";
	}
	
	//바코드 찍을시 상품 정보 조회
	@RequestMapping(value = "/Mgt_Goods_Cal_retrieve", method = RequestMethod.POST)	
	public String MgtGoodsCal_retrieve(Model model,@ModelAttribute MgtGoodsCalVO MgtGoodsCalVO){
		
		
	 if(!MgtGoodsCalVO.getGoods_b_cd().isEmpty()){		
		//List<MgtGoodsCalVO> retrieve_mgtGoodscal = mgtGoodsRegService.retrieve_mgtGoodsRegAll(MgtGoodsCalVO);		
		List<String> retrieve_mgtGoodscal = mgtGoodsRegService.retrieve_mgtGoodsRegAll_str(MgtGoodsCalVO);
		
		model.addAttribute("Mgt_Goods_Cal",retrieve_mgtGoodscal);
				
		return "Mgt_Goods_Cal/Mgt_Goods_Cal";
	 }
	 else{
		return "redirect:/Mgt_Goods_Cal";
	 }
	}
	
	//ajax 조회
	@RequestMapping(value = "/Mgt_Goods_Cal/retrieve", method = RequestMethod.POST)	
	public String MgtGoodsCal_retrieve_get(Model model,@ModelAttribute MgtGoodsCalVO MgtGoodsCalVO){
				
		List<String> retrieve_mgtGoodscal = mgtGoodsRegService.retrieve_mgtGoodsRegAll_str(MgtGoodsCalVO);
		model.addAttribute("Mgt_Goods_Cal",retrieve_mgtGoodscal);
		
		return "returnAjax";
	}
	
	@RequestMapping(value = "/returnAjax", method = RequestMethod.GET)	
	public String MgtGoodsCal_returnAjax(Model model){
		
		return "returnAjax";
	}
	
	//insert Json으로 전달받기
	@ResponseBody
	@RequestMapping(value = "/Mgt_Goods_Cal/insert", method = RequestMethod.POST)
	//public String insert_data(@RequestBody String paramData,HttpServletRequest request){
	public String insert_data(HttpServletRequest request){
		String[] calculationInfo = request.getParameterValues("saleInfo_all_arr");
		//공객제거
		for(int i=0; i<calculationInfo.length; i++){
			calculationInfo[i] = calculationInfo[i].trim();
		}		 	
		mgtGoodsRegService.insert_calculationInfo(calculationInfo);
		
		
		return "redirect:/Mgt_Goods_Cal";
	}
 
}
