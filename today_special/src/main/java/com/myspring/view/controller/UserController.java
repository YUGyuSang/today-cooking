package com.myspring.view.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
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

import com.myspring.today.user.UserVO;
import com.myspring.today.user.impl.UserDAO;

@Controller
public class UserController {
	@Autowired
	private UserDAO userDAO;

	// 회원가입
	@RequestMapping("/insertUser.do")
	public String insertUser(UserVO vo, @RequestParam("bf_profile") MultipartFile img)
			throws IOException {
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

	// 이미지 출력
	@RequestMapping("/profileView.do")
	public ResponseEntity<byte[]> profileView(HttpSession session, HttpServletRequest request)
			throws IOException {
		try {
			String loginId = (String) session.getAttribute("loginId");
			UserVO user = userDAO.getUser(loginId);
			HttpHeaders header = new HttpHeaders();
			header.setContentType(MediaType.IMAGE_PNG);
			ResponseEntity<byte[]> ret = new ResponseEntity<>(user.getProfile(), header,
					HttpStatus.OK);
			return ret;
		} catch (Exception e) {

		}
		return null;

	}

	// 로그인
	@RequestMapping("/login.do")
	public String login(UserVO vo, HttpSession session) {
		if (vo.getId() == null || vo.getId().equals("")) {
			throw new IllegalArgumentException("아이디와 비밀번호를 입력하세요.");
		}
		int check = userDAO.login(vo);
		if (check == 1) {
			session.setAttribute("loginId", vo.getId());
			return "index.jsp";
		} else
			return "login.jsp";
	}
	//로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		return "index.jsp";
	}
}
