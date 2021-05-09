package com.myspring.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myspring.today.user.UserVO;
import com.myspring.today.user.impl.UserDAO;

@Controller
public class loginController {
	@Autowired
	private UserDAO userDAO;
	
	//로그인
	@RequestMapping("/login.do")
	public String login(UserVO vo, HttpSession session) {
		if (vo.getId() == null || vo.getId().equals("")) {
			throw new IllegalArgumentException("로그인 실패");
		}
		UserVO user = userDAO.getUser(vo);
		if (user != null) {
			session.setAttribute("userId", user.getId());
			return "index.jsp";
		} else
			return "login.jsp";
	}

}
