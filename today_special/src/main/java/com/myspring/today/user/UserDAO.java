package com.myspring.today.user;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 회원가입
	public void insertUser(UserVO vo) {
		mybatis.insert("UserDAO.insertUser", vo);
	}
	
	// 로그인
	public int login(UserVO vo) {
		return mybatis.selectOne("UserDAO.login", vo);
	}

	//회원정보 가져오기
	public UserVO getUser(String ID) {
		return mybatis.selectOne("UserDAO.getUser", ID);
	}
	
}
