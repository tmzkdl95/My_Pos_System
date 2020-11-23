package com.mycompany.service.testPageService;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycompany.dao.testPage_DAO.testPageDAO;
import com.mycompany.vo.testPage;

@Service
public class testPage_ServiceImpl implements testPage_Service{

	@Inject
	testPageDAO testPagedao;
	
	@Override
	public List<testPage> printDB() {
		System.out.println("testPage_service 실행");
		List<testPage> test = testPagedao.getList_testpage();
		return test;
	}

	@Override
	public void insert_data(testPage testpage){
		System.out.println("testPage_insert_service 실행");
		testPagedao.insert_testPage(testpage);
	}

	

}
