package com.mycompany.dao.login_DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.mycompany.vo.loginVO;

public class loginDAOImpl implements loginDAO{
	
	@Inject
	private SqlSession sqlsession;
	
	private static final String NameSpace = "com.mycompany.mapper.mapper_XML";
	private loginVO loginvo;
	
	@Override
	public List<loginVO> memberConfirm() {
		
		return sqlsession.selectList(NameSpace+".select_userInfo");
	}
	
	public loginVO getUserById(String username) {
	       return sqlsession.selectOne(NameSpace+".select_userInfo", username);
	}


}
