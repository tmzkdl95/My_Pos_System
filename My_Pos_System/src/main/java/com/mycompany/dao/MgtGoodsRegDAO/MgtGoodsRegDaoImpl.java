package com.mycompany.dao.MgtGoodsRegDAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mycompany.dao.MgtGoodsRegDAO.MgtGoodsRegDAO;
import com.mycompany.vo.MgtGoodsRegVO;


@Repository
public class MgtGoodsRegDaoImpl implements MgtGoodsRegDAO{

	@Inject
	private SqlSession sqlsession;
	
	private static final String NameSpace = "com.mycompany.mapper.mapper_XML";
	@Override
	public List<MgtGoodsRegVO> getList_MgtGoodsReg() {
		System.out.println("DAO Ω√¿€");
		// TODO Auto-generated method stub
		return sqlsession.selectList(NameSpace+".select_MgtGoodsReg");
	}

	@Override
	public void insert_MgtGoodsReg(MgtGoodsRegVO MgtGoodsRegVO) {
		// TODO Auto-generated method stub
		sqlsession.insert(NameSpace+".insert_MgtGoodsReg",MgtGoodsRegVO);
	}

}
