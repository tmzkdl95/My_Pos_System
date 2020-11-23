package com.mycompany.dao.testPage_DAO;

import java.util.List;

import com.mycompany.vo.testPage;

public interface testPageDAO {
	
	//testPage 내용 출력
	public List<testPage> getList_testpage();
	
	//testPage에 insert
	public void insert_testPage(testPage testpage);

}
