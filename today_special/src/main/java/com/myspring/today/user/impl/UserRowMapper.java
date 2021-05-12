package com.myspring.today.user.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.myspring.today.user.UserVO;

public class UserRowMapper implements RowMapper<UserVO>{

	public UserVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		UserVO user=new UserVO();
		user.setId(rs.getString("ID"));
		user.setPassword(rs.getString("password"));
		user.setEmail(rs.getString("email"));
		user.setNickname(rs.getString("nickname"));
		return user;
	}
	

}
