package com.myspring.today.search;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class SearchController {
	@Autowired
	YoutubeSearch youtube;
	
	@RequestMapping(value="/getYoutubeList.do")
	public String getYoutubeList(HttpServletRequest request) {
		YoutubeSearch youtube = new YoutubeSearch();
		String search = request.getParameter("recipe_name");
		HttpSession session=request.getSession();
		List<YoutubeVO> YoutubeList = youtube.getYoutubeList(search);
		session.setAttribute("YoutubeList",YoutubeList);
		return "getRecipeList.jsp";
	}
}
