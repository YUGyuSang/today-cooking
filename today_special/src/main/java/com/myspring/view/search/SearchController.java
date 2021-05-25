package com.myspring.view.search;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.today.recipe.RecipeDAO;
import com.myspring.today.recipe.RecipeVO;

@Controller
public class SearchController {
	@Autowired
	YoutubeSearch youtube;
	@Autowired
	NaverSearch naver;
	@Autowired
	RecipeDAO recipeDAO;
	
	@RequestMapping(value = "/getSearchResult.do")
	public ModelAndView getSearchResult(@RequestParam("searchKeyword") String searchKeyword,ModelAndView mv) throws UnsupportedEncodingException {
		List<RecipeVO> recipeList=recipeDAO.getKeywordRecipe(searchKeyword);
		List<YoutubeVO> YoutubeList = youtube.getYoutubeList(searchKeyword);
		List<NaverVO> NaverList = naver.getNaverList(searchKeyword);
		mv.addObject("searchKeyword",searchKeyword);
		mv.addObject("YoutubeList", YoutubeList);
		mv.addObject("NaverList", NaverList);
		mv.setViewName("getRecipeList.jsp");
		return mv;
	}

}
