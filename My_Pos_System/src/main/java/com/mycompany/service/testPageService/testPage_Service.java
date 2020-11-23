package com.mycompany.service.testPageService;

import java.util.List;

import com.mycompany.vo.testPage;

public interface testPage_Service {
	// select testPage
	public List<testPage> printDB();
	
	// insert data to testPage
	public void insert_data(testPage testpage); 
}
