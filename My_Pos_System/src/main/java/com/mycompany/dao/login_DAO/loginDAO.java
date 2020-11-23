package com.mycompany.dao.login_DAO;

import java.util.List;

import com.mycompany.vo.loginVO;

public interface loginDAO {
	
	//로그인 확인
	public List<loginVO> memberConfirm();
	public loginVO getUserById(String username);

}
