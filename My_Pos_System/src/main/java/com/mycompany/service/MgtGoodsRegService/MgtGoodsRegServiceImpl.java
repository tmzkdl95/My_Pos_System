package com.mycompany.service.MgtGoodsRegService;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycompany.dao.MgtGoodsRegDAO.MgtGoodsRegDAO;
import com.mycompany.vo.MgtGoodsRegVO;

@Service
public class MgtGoodsRegServiceImpl implements MgtGoodsRegService{

	@Inject
	MgtGoodsRegDAO mgtGoodsRegDao;
	
	@Override
	public List<MgtGoodsRegVO> retrieve_mgtGoodsRegAll() {
		
		List<MgtGoodsRegVO> retrieve_RegInf = mgtGoodsRegDao.getList_MgtGoodsReg();
		return retrieve_RegInf;
	}

	@Override
	public void insert_data(MgtGoodsRegVO MgtGoodsRegVO){		
		mgtGoodsRegDao.insert_MgtGoodsReg(MgtGoodsRegVO);
	}

	

}
