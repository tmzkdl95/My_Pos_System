package com.mycompany.service.MgtGoodsCalService;

import java.util.List;

import com.mycompany.vo.MgtGoodsCalVO;

public interface MgtGoodsCalService {
	// select 
	public List<MgtGoodsCalVO> retrieve_mgtGoodsRegAll(MgtGoodsCalVO MgtGoodsCalVO);
	
	//
	public List<String> retrieve_mgtGoodsRegAll_str(MgtGoodsCalVO MgtGoodsCalVO);
	
	// insert data to testPage
	public void insert_data(MgtGoodsCalVO MgtGoodsCalVO);
	
}
