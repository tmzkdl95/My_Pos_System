package com.mycompany.dao.testPage_DAO;

import java.util.List;

import com.mycompany.vo.testPage;

public interface testPageDAO {
	
	//testPage ���� ���
	public List<testPage> getList_testpage();
	
	//testPage�� insert
	public void insert_testPage(testPage testpage);

}
