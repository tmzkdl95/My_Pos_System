package com.mycompany.service.MgtGoodsCalService;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycompany.dao.MgtGoodsCalDAO.MgtGoodsCalDAO;
import com.mycompany.vo.MgtGoodsCalVO;
import com.mycompany.vo.MgtGoodsCal_insert_VO;

@Service
public class MgtGoodsCalServiceImpl implements MgtGoodsCalService{

	@Inject
	MgtGoodsCalDAO mgtGoodsCalDao;
	
	@Override
	public List<MgtGoodsCalVO> retrieve_mgtGoodsRegAll(MgtGoodsCalVO MgtGoodsCalVO) {		
		List<MgtGoodsCalVO> retrieve_RegInf = mgtGoodsCalDao.retrieve_getList_MgtGoodsCal(MgtGoodsCalVO);

		return retrieve_RegInf;
	}
		
	@Override
	public List<String> retrieve_mgtGoodsRegAll_str(MgtGoodsCalVO MgtGoodsCalVO) {
		List<MgtGoodsCalVO> retrieve_RegInf = mgtGoodsCalDao.retrieve_getList_MgtGoodsCal(MgtGoodsCalVO);
		
		System.out.println("retrieve_RegInf : "+retrieve_RegInf);
		List<String> str_RegInf = new ArrayList<String>();
		str_RegInf.add("goods_b_cd="+retrieve_RegInf.get(0).getGoods_b_cd());
		str_RegInf.add("goods_cd="+retrieve_RegInf.get(0).getGoods_cd());
		str_RegInf.add("goods_nm="+retrieve_RegInf.get(0).getGoods_nm());
		str_RegInf.add("goods_price="+retrieve_RegInf.get(0).getGoods_price());
		//str_RegIng += "goods_nm="+retrieve_RegInf.get(0).getGoods_nm()+",";
		//str_RegIng += "goods_pri="+retrieve_RegInf.get(0).getGoods_pri();
		
		System.out.println("str_RegIng : "+str_RegInf);
		return str_RegInf;
	}
	

	@Override
	public void insert_calculationInfo(String[] calculationInfo) {		
		//상품명,가격,판수량,계산
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat create_ordNo = new SimpleDateFormat("yyMMddHHmmss");
		String ord_no = create_ordNo.format(today).toString(); // YYMMDDHHMMSS
		int i=0;
		while(i<calculationInfo.length){
			MgtGoodsCal_insert_VO mgcVo = new MgtGoodsCal_insert_VO();
			if(i==calculationInfo.length-6){				
				mgcVo.setOrd_no(ord_no);
				mgcVo.setGoods_b_cd(ord_no);				
				mgcVo.setGoods_nm("총 합");				
				mgcVo.setGoods_total_price(Integer.parseInt(calculationInfo[i+5]));
				mgcVo.setSale_date(date.format(today).toString());
			}else{			
				mgcVo.setOrd_no(ord_no);
				mgcVo.setGoods_b_cd(calculationInfo[i]);
				mgcVo.setGoods_cd(calculationInfo[i+1]);
				mgcVo.setGoods_nm(calculationInfo[i+2]);
				mgcVo.setGoods_price(Integer.parseInt(calculationInfo[i+3]));
				mgcVo.setGoods_sale_qty(Integer.parseInt(calculationInfo[i+4]));
				mgcVo.setGoods_total_price(Integer.parseInt(calculationInfo[i+5]));
				mgcVo.setSale_date(date.format(today).toString());
			}
			i= i+6;
			
			mgtGoodsCalDao.insert_calculationInfo(mgcVo);
		}
		
		
	}



	

}
