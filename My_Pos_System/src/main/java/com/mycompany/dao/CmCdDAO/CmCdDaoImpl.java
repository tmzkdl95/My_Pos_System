package com.mycompany.dao.CmCdDAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mycompany.vo.CmCd_VO;


@Repository
public class CmCdDaoImpl implements CmCdDAO{

	@Inject
	private SqlSession sqlsession;
	
	private static final String NameSpace = "com.mycompany.mapper.mapper_XML";

	@Override
	public List<CmCd_VO> getRetrieve_CmCd(CmCd_VO CmCd_VO) {	
		
		return sqlsession.selectList(NameSpace+".select_retrieveCmCdSelectBox",CmCd_VO);	
	}

	@Override
	public void update_LastCmCd(CmCd_VO CmCd_VO) {
		sqlsession.update(NameSpace+".update_lastCmCd",CmCd_VO);		
	}

	

}
