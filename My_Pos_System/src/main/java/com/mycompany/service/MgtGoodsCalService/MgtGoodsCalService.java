package com.mycompany.service.MgtGoodsCalService;

import java.util.List;

import com.mycompany.vo.MgtGoodsCalVO;

public interface MgtGoodsCalService {
	// select 
	public List<MgtGoodsCalVO> retrieve_mgtGoodsRegAll(MgtGoodsCalVO MgtGoodsCalVO);
	
	//
	public List<String> retrieve_mgtGoodsRegAll_str(MgtGoodsCalVO MgtGoodsCalVO);
	
	// 결제 정보 인서트
	public void insert_calculationInfo(String[] calculationInfo);
	
}
