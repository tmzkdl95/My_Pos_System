package com.mycompany.mapper.mapper_interface;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.mycompany.vo.loginVO;

public interface memberMapper {
	
	@Select("SELECT * FROM USER WHERE id=#{id}")
	public loginVO readAccount(String id);
	
	@Select("SELECT authority_name FROM AUTHORITY WHERE username=#{id}")
	public List readAutorities(String id);
	
	@Insert("INSERT INTO userinfo VALUES(#{account.id},#{account.password},#{account.isEnabled})")
	public void insertUser(@Param("account") loginVO loginvo);
	
	@Insert("INSERT INTO AUTHORITY VALUES(#{id},#{autority})")
	public void insertUserAutority(@Param("id") String id,@Param("autority")String autority);
	
	@Select("SELECT* FROM USER")
	public List readAllUsers();

}
