package com.mycompany.service.MgtGoodsCalService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycompany.dao.MgtGoodsCalDAO.MgtGoodsCalDAO;
import com.mycompany.vo.MgtGoodsCalVO;

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
		str_RegInf.add("goods_nm="+retrieve_RegInf.get(0).getGoods_nm());
		str_RegInf.add("goods_pri="+retrieve_RegInf.get(0).getGoods_pri());
		//str_RegIng += "goods_nm="+retrieve_RegInf.get(0).getGoods_nm()+",";
		//str_RegIng += "goods_pri="+retrieve_RegInf.get(0).getGoods_pri();
		
		System.out.println("str_RegIng : "+str_RegInf);
		return str_RegInf;
	}


	@Override
	public void insert_data(MgtGoodsCalVO MgtGoodsCalVO) {
		//mgtGoodsCalDao.insert_MgtGoodsSale(MgtGoodsCalVO);
		
	}




	

}
