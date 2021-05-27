package com.myspring.view.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.today.user.UserDAO;
import com.myspring.today.user.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserDAO userDAO;

	// 회원가입
	@RequestMapping("/insertUser.do")
	public String insertUser(UserVO vo, @RequestParam("bf_profile") MultipartFile img) throws IOException {
		if (img != null && !img.isEmpty()) {
			vo.setProfile(img.getBytes());
		}
		userDAO.insertUser(vo);
		return "login.jsp";
	}

	// 회원정보 get
	@RequestMapping("getUser.do")
	public ModelAndView getUser(HttpSession session, ModelAndView mv) {
		String loginId = (String) session.getAttribute("loginId");
		mv.addObject("user", userDAO.getUser(loginId));
		mv.setViewName("myPage.jsp");
		return mv;
	}

	// 프로필 출력
	@RequestMapping("/profileView.do")
	public ResponseEntity<byte[]> profileView(HttpSession session, HttpServletRequest request) throws IOException {
		try {
			String loginId = (String) session.getAttribute("loginId");
			UserVO user = userDAO.getUser(loginId);
			HttpHeaders header = new HttpHeaders();
			header.setContentType(MediaType.IMAGE_PNG);
			ResponseEntity<byte[]> ret = new ResponseEntity<>(user.getProfile(), header, HttpStatus.OK);
			return ret;
		} catch (Exception e) {

		}
		return null;
	}

	// 회원정보 수정
	@RequestMapping("updateUser.do")
	public ModelAndView updateUser(UserVO vo, @RequestParam("bf_profile") MultipartFile img, ModelAndView mv,
			HttpServletResponse response) throws IOException {
		if (img != null && !img.isEmpty()) {
			vo.setProfile(img.getBytes());
		}
		userDAO.updateUser(vo);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('회원정보 수정 완료'); </script>");
		out.flush();
		mv.setViewName("getUser.do");
		return mv;
	}

	// 회원 탈퇴
	@RequestMapping("deleteUser.do")
	public String updateUser(UserVO vo){
		userDAO.deleteUser(vo);
		return "logout.do";
	}

	// 로그인
	@RequestMapping("/login.do")
	public String login(UserVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (vo.getId() == null || vo.getId().equals("")) {
			out.println("<script>alert('아이디를 입력하세요'); </script>");
			out.flush();
		}
		int check = userDAO.login(vo);
		if (check == 1) {
			session.setAttribute("loginId", vo.getId());
			String referer = request.getHeader("Referer");
			request.getSession().setAttribute("redirectURI", referer);
			return "index.jsp";
		} else {
			out.println("<script>alert('로그인에 실패하셨습니다..'); </script>");
			out.flush();
			return "login.jsp";
		}
	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		return "index.jsp";
	}

}
