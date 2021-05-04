package com.myspring.view.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.myspring.today.user.UserService;
import com.myspring.today.user.UserVO;

public class InsertUserController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		AbstractApplicationContext container = new GenericXmlApplicationContext("applicationContext.xml");
		
		UserService userService=(UserService) container.getBean("userService");
		
		//사용자 입력 정보 추출
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String email = request.getParameter("email");
		String nickname=request.getParameter("nickname");
		
		//DB 연동 처리
		UserVO vo=new UserVO();
		vo.setId(id);
		vo.setPassword(pw);
		vo.setEmail(email);
		vo.setNickname(nickname);
		
		userService.insertUser(vo);
		
		//화면 네비게이션
		ModelAndView mav=new ModelAndView();
		mav.setViewName("header.jsp");
		return mav;
	}

}