package com.mycompany.dao.MgtGoodsCalDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mycompany.vo.MgtGoodsCalVO;
import com.mycompany.vo.MgtGoodsCal_insert_VO;

public interface MgtGoodsCalDAO  {
	
	//	
	public List<MgtGoodsCalVO> retrieve_getList_MgtGoodsCal(MgtGoodsCalVO MgtGoodsCalVO);
	
	public HashMap retrieve_getList_MgtGoodsCal_Map(MgtGoodsCalVO MgtGoodsCalVO);
	
	//
	public void insert_calculationInfo(MgtGoodsCal_insert_VO calculationInfo);
	

}
