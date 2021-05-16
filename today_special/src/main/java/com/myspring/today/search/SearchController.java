package com.myspring.today.search;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {
	@Autowired
	YoutubeSearch youtube;
	@Autowired
	NaverSearch naver;
	
	@RequestMapping(value = "/getSearchResult.do")
	public String getSearchResult(HttpServletRequest request) throws UnsupportedEncodingException {
		request.removeAttribute("YoutubeList");
		request.removeAttribute("NaverList");
		request.setCharacterEncoding("utf-8");
		String searchKeyword = request.getParameter("searchKeyword");
		List<YoutubeVO> YoutubeList = youtube.getYoutubeList(searchKeyword);
		List<NaverVO> NaverList = naver.getNaverList(searchKeyword);
		request.setAttribute("YoutubeList", YoutubeList);
		request.setAttribute("NaverList", NaverList);
		return "getRecipeList.jsp";
	}
}
