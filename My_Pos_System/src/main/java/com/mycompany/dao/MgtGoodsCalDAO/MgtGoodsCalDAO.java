package com.mycompany.dao.MgtGoodsCalDAO;

import java.util.List;

import com.mycompany.vo.MgtGoodsCalVO;

public interface MgtGoodsCalDAO {
	
	//바코드 조회
	public List<MgtGoodsCalVO> retrieve_getList_MgtGoodsCal(MgtGoodsCalVO MgtGoodsCalVO);
	
	//판매 등록
	//public void insert_MgtGoodsSale(MgtGoodsCalVO MgtGoodsCalVO);

}
