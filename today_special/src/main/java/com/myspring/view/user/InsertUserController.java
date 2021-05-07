package com.myspring.view.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.today.user.UserVO;
import com.myspring.today.user.impl.UserDAO;

@Controller
public class InsertUserController {

	//회원가입
	@RequestMapping("/insertUser.do")
	public ModelAndView insertUser(UserVO vo,UserDAO userDAO) {
		// 회원 등록
		userDAO.insertUser(vo);
		// 화면 네비게이션
		ModelAndView mav = new ModelAndView();
		mav.setViewName("header.jsp");
		return mav;
	}

}
