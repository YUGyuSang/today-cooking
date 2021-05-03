package com.myspring.today.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.today.user.UserService;
import com.myspring.today.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO userDAO;
	@Override
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
		
	}

}
