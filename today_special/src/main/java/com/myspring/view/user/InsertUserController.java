package com.myspring.view.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.myspring.today.user.UserVO;
import com.myspring.today.user.impl.UserDAO;

public class InsertUserController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//사용자 입력 정보 추출
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String email = request.getParameter("email");
		String nickname=request.getParameter("nickname");
		System.out.println(nickname);
		
		//DB 연동 처리
		UserVO vo=new UserVO();
		vo.setId(id);
		vo.setPassword(pw);
		vo.setEmail(email);
		vo.setNickname(nickname);
		
		UserDAO userDAO=new UserDAO();
		userDAO.insertUser(vo);
		
		//화면 네비게이션
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:header.jsp");
		return mav;
	}

}
