package com.mycompany.dao.MgtGoodsRegDAO;

import java.util.List;

import com.mycompany.vo.MgtGoodsRegVO;

public interface MgtGoodsRegDAO {
	
	//��ǰ��ȸ ���� ���
	public List<MgtGoodsRegVO> getList_MgtGoodsReg();
	
	//��ǰ ���
	public void insert_MgtGoodsReg(MgtGoodsRegVO MgtGoodsRegVO);

}
