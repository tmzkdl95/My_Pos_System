package com.mycompany.service.MgtGoodsCalService;

import java.util.List;

import com.mycompany.vo.MgtGoodsCalVO;

public interface MgtGoodsCalService {
	// select testPage
	public List<MgtGoodsCalVO> retrieve_mgtGoodsRegAll(MgtGoodsCalVO MgtGoodsCalVO);
	
	// insert data to testPage
	public void insert_data(MgtGoodsCalVO MgtGoodsCalVO);
	
}
