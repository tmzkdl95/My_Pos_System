package com.mycompany.dao.MgtGoodsCalDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mycompany.vo.MgtGoodsCalVO;

public interface MgtGoodsCalDAO  {
	
	//���ڵ� ��ȸ	
	public List<MgtGoodsCalVO> retrieve_getList_MgtGoodsCal(MgtGoodsCalVO MgtGoodsCalVO);
	
	public HashMap retrieve_getList_MgtGoodsCal_Map(MgtGoodsCalVO MgtGoodsCalVO);
	
	//�Ǹ� ���
	//public void insert_MgtGoodsSale(MgtGoodsCalVO MgtGoodsCalVO);

}
