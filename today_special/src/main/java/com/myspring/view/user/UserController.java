package com.myspring.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myspring.today.user.UserVO;
import com.myspring.today.user.impl.UserDAO;

@Controller
public class UserController {
	@Autowired
	private UserDAO userDAO;
	
	//회원가입
	@RequestMapping("/insertUser.do")
	public String insertUser(UserVO vo) {
		userDAO.insertUser(vo);
		return "index.jsp";
	}
	
	//로그인
	@RequestMapping("/login.do")
	public String login(UserVO vo, HttpSession session) {
		if (vo.getId() == null || vo.getId().equals("")) {
			throw new IllegalArgumentException("로그인 실패");
		}
		int check = userDAO.login(vo);
		if (check == 1) {
			session.setAttribute("loginId", vo.getId());
			return "index.jsp";
		} else
			return "login.jsp";
	}
}
