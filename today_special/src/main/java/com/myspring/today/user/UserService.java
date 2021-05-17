package com.myspring.today.user;

public interface UserService {
	// 회원 추가
	void insertUser(UserVO vo);
	// 로그인
	int login(UserVO vo);
}