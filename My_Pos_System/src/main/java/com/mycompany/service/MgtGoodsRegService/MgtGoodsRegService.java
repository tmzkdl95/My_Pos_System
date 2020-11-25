package com.mycompany.service.MgtGoodsRegService;

import java.util.List;

import com.mycompany.vo.MgtGoodsRegVO;

public interface MgtGoodsRegService {
	// select testPage
	public List<MgtGoodsRegVO> retrieve_mgtGoodsRegAll();
	
	// insert data to testPage
	public void insert_data(MgtGoodsRegVO MgtGoodsRegVO); 
}
