package com.mycompany.dao.MgtGoodsRegDAO;

import java.util.List;

import com.mycompany.vo.MgtGoodsRegVO;

public interface MgtGoodsRegDAO {
	
	//retrieve all
	public List<MgtGoodsRegVO> getList_MgtGoodsReg();
	
	//insert goods_inf
	public void insert_MgtGoodsReg(MgtGoodsRegVO MgtGoodsRegVO);

}
