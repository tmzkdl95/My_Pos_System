package com.mycompany.dao.MgtGoodsRegDAO;

import java.util.List;

import com.mycompany.vo.MgtGoodsRegVO;

public interface MgtGoodsRegDAO {
	
	//상품조회 내용 출력
	public List<MgtGoodsRegVO> getList_MgtGoodsReg();
	
	//상품 등록
	public void insert_MgtGoodsReg(MgtGoodsRegVO MgtGoodsRegVO);

}
