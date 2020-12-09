package com.mycompany.dao.MgtGoodsCalDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mycompany.vo.MgtGoodsCalVO;


@Repository
public class MgtGoodsCalDaoImpl implements MgtGoodsCalDAO {

	@Inject
	private SqlSession sqlsession;
	
	private static final String NameSpace = "com.mycompany.mapper.mapper_XML";	
	@Override
	public List<MgtGoodsCalVO> retrieve_getList_MgtGoodsCal(MgtGoodsCalVO MgtGoodsCalVO) {
		String goods_b_cd = MgtGoodsCalVO.getGoods_b_cd();
		sqlsession.selectList(NameSpace+".select_MgtGoodsCal",MgtGoodsCalVO);
		
		System.out.println("DAO : goods_b_cd : "+goods_b_cd);
		return sqlsession.selectList(NameSpace+".select_MgtGoodsCal",MgtGoodsCalVO);		
	}
	
	@Override
	public HashMap retrieve_getList_MgtGoodsCal_Map(MgtGoodsCalVO MgtGoodsCalVO) {
		// TODO Auto-generated method stub
		HashMap<String,String> hs = new HashMap<String,String>();
		
		return hs;
	}
	

/*
	@Override
	public void insert_MgtGoodsSale(MgtGoodsCalVO MgtGoodsCalVO) {
		//sqlsession.insert(NameSpace+".insert_MgtGoodsReg",MgtGoodsCalVO);
		
	}
*/
	
}
