package com.mycompany.service.userService;


import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.mycompany.dao.login_DAO.loginDAO;
import com.mycompany.vo.loginVO;


@Service
public class UserService implements UserDetailsService{

	private loginVO user;
	private loginDAO logindao;
	
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
		user = logindao.getUserById(userid);
		if(user==null) {
            throw new UsernameNotFoundException(userid);
        }

		return user;
	}

}
