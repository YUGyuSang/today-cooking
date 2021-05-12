package com.myspring.view.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myspring.today.user.UserVO;
import com.myspring.today.user.impl.UserDAO;

@Controller
public class InsertUserController {
	@Autowired
	private UserDAO userDAO;
	
	//회원가입
	@RequestMapping("/insertUser.do")
	public String insertUser(UserVO vo) {
		//AbstractApplicationContext container = new GenericXmlApplicationContext("applicationContext.xml");
		userDAO.insertUser(vo);
		// 화면 네비게이션
		return "index.jsp";
	}

}
