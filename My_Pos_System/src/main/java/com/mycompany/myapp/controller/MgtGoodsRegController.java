package com.mycompany.myapp.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.service.MgtGoodsRegService.MgtGoodsRegService;
import com.mycompany.service.cmCdService.CmCdService;
import com.mycompany.vo.MgtGoodsRegVO;
import com.mycompany.vo.CmCd_VO;


@Controller
public class MgtGoodsRegController {

	@Inject
	private MgtGoodsRegService mgtGoodsRegService;
	
	@Inject
	private CmCdService cmCdService; 
	
	@RequestMapping(value = "/Mgt_Goods_Reg", method = RequestMethod.GET)
	//조회
	public String MgtGoodsRegAll_retrieve(Model model){
				
		List<MgtGoodsRegVO> ret_mgtGoodsReg = mgtGoodsRegService.retrieve_mgtGoodsRegAll();
		List<CmCd_VO> ret_CmCd = cmCdService.retrieve_CmCd_SelectBox();
		
		model.addAttribute("Mgt_Goods_Reg",ret_mgtGoodsReg);
		model.addAttribute("ret_CmCd",ret_CmCd);
		//System.out.println("@@@@@@@@@@@@@@ret_CmCd = "+ret_CmCd);
		
		return "Mgt_Goods_Reg/Mgt_Goods_Reg";
	}
	
	
	//상품 등록
	@RequestMapping(value = "/Mgt_Goods_Reg/insert_data", method = RequestMethod.POST)
	public String insert_data(@ModelAttribute MgtGoodsRegVO MgtGoodsRegVO,@ModelAttribute CmCd_VO CmCd_VO){

		mgtGoodsRegService.insert_data(MgtGoodsRegVO);
		cmCdService.update_LastCmCd(CmCd_VO);
		
		return "redirect:/Mgt_Goods_Reg";
	}
	

}
