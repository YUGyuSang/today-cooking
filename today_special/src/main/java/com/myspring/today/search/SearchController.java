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
	
	
	@RequestMapping(value="/getYoutubeList.do")
	public String getYoutubeList(HttpServletRequest request) throws UnsupportedEncodingException {
		YoutubeSearch youtube = new YoutubeSearch();
		String searchKeyword = request.getParameter("searchKeyword");
		System.out.println(searchKeyword);
		/*
		 * List<YoutubeVO> YoutubeList = youtube.getYoutubeList(searchKeyword);
		 * request.setAttribute("YoutubeList",YoutubeList);
		 */
		return "getRecipeList.jsp";
	}
}
