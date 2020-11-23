package com.mycompany.dao.testPage_DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.vo.testPage;

@Repository
public class testPageDAOImpl implements testPageDAO{

	@Inject
	private SqlSession sqlsession;
	
	private static final String NameSpace = "com.mycompany.mapper.mapper_XML";
	@Override
	public List<testPage> getList_testpage() {
		
		System.out.println("testPageDAO 실행");
		return sqlsession.selectList(NameSpace+".select_testPage");
	}
	
	@Override
	public void insert_testPage(testPage testpage) {
		//insert에는 return값이 없다.
		sqlsession.insert(NameSpace+".insert_testPage",testpage);
	}

}
