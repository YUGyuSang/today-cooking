package com.myspring.today.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.myspring.today.user.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//sql 명령어들
	private final String USER_INSERT="insert into user(id,password,email,nickname) values(?,?,?,?)";
	
	// 회원 추가
	public void insertUser(UserVO vo) {
		jdbcTemplate.update(USER_INSERT,vo.getId(),vo.getPassword(),vo.getEmail(),vo.getNickname());
		System.out.println("회원 추가 성공");
	}
}