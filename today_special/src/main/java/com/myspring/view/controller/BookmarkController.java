package com.myspring.view.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myspring.today.bookmark.BookmarkOuterDAO;
import com.myspring.today.bookmark.BookmarkOuterVO;

@Controller
public class BookmarkController {
	@Autowired	
	BookmarkOuterDAO outerDAO;
	
	// 북마크 등록
	@RequestMapping(value="/insertBookmarkOuter.do")
	public void getRankingList(BookmarkOuterVO otvo,
			HttpSession session,HttpServletResponse response) throws IOException {
		String loginId = (String) session.getAttribute("loginId");
		otvo.setUserId(loginId);
		outerDAO.insertBookmarkOuter(otvo);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('북마크 완료'); history.go(-1);</script>");
		out.flush();
	}
}
