package com.myspring.today.user;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.today.recipe.RecipeVO;

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

	// 회원정보 가져오기
	public UserVO getUser(String ID) {
		return mybatis.selectOne("UserDAO.getUser", ID);
	}

	// 회원정보 수정
	public void updateUser(UserVO vo) {
		mybatis.update("UserDAO.updateUser", vo);
	}
	
	// 회원 탈퇴
	public void deleteUser(UserVO vo) {
		mybatis.delete("UserDAO.deleteUser", vo);
	}
	
}
