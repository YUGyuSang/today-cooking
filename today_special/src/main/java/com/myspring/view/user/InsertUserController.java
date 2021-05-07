package com.myspring.view.user;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.today.user.UserService;
import com.myspring.today.user.UserVO;
import com.myspring.today.user.impl.UserDAO;

@Controller
public class InsertUserController{
	
	@RequestMapping("/insertUser.do")
	public ModelAndView insertUser(UserVO vo, UserDAO userDAO) {
		AbstractApplicationContext container = new GenericXmlApplicationContext("applicationContext.xml");
		
		UserService userService=(UserService) container.getBean("userService");
		System.out.println(vo.getNickname());
		//회원 등록
		userService.insertUser(vo);
		
		//화면 네비게이션
		ModelAndView mav=new ModelAndView();
		mav.setViewName("header.jsp");
		return mav;
	}

}
