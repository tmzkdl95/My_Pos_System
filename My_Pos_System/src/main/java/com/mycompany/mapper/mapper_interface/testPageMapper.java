package com.mycompany.mapper.mapper_interface;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.mycompany.vo.testPage;


public interface testPageMapper {
	@Select("select * from testpage")
	public List<testPage> getList_testpage();
	
	@Insert("insert into testpage (user_name, content) values(#{user_name}, #{content})")
	public boolean insert_data(testPage testpage);
	
}
