package com.mycompany.service.MgtGoodsCalService;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycompany.dao.MgtGoodsCalDAO.MgtGoodsCalDAO;
import com.mycompany.vo.MgtGoodsCalVO;

@Service
public class MgtGoodsCalServiceImpl implements MgtGoodsCalService{

	@Inject
	MgtGoodsCalDAO mgtGoodsCalDao;
	
	@Override
	public List<MgtGoodsCalVO> retrieve_mgtGoodsRegAll(MgtGoodsCalVO MgtGoodsCalVO) {		
		List<MgtGoodsCalVO> retrieve_RegInf = mgtGoodsCalDao.retrieve_getList_MgtGoodsCal(MgtGoodsCalVO);		
		return retrieve_RegInf;
	}


	@Override
	public void insert_data(MgtGoodsCalVO MgtGoodsCalVO) {
		//mgtGoodsCalDao.insert_MgtGoodsSale(MgtGoodsCalVO);
		
	}

	

}
