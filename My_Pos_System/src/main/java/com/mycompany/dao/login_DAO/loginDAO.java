package com.mycompany.dao.login_DAO;

import java.util.List;

import com.mycompany.vo.loginVO;

public interface loginDAO {
	
	//�α��� Ȯ��
	public List<loginVO> memberConfirm();
	public loginVO getUserById(String username);

}
