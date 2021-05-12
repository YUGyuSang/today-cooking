package com.myspring.today.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.myspring.today.user.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	// sql 명령어
	private final String USER_INSERT = "insert into user(id,password,email,nickname) values(?,?,?,?)";
	private final String USER_GET = "select * from user where id=? and password=?";

	// 회원가입
	public void insertUser(UserVO vo) {
		jdbcTemplate.update(USER_INSERT, vo.getId(), vo.getPassword(), vo.getEmail(), vo.getNickname());
	}
	
	// 로그인
	public UserVO getUser(UserVO vo) {
		System.out.println(jdbcTemplate);
		Object[] args = { vo.getId(),vo.getPassword() };
		return jdbcTemplate.queryForObject(USER_GET, args, new UserRowMapper());
	}
}
