package com.myspring.view.search;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.today.recipe.Pagination;
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

	// 키워드 레시피 검색
	@RequestMapping(value = "/getSearchResult.do")
	public ModelAndView getSearchResult(RecipeVO vo, ModelAndView mv) throws UnsupportedEncodingException {
		String keyword = vo.getKeyword();
		List<RecipeVO> recipeList = recipeDAO.getKeywordRecipe(vo);
		List<YoutubeVO> YoutubeList = youtube.getYoutubeList(keyword);
		List<NaverVO> NaverList = naver.getNaverList(keyword);
		mv.addObject("keyword", keyword);
		mv.addObject("recipeList", recipeList);
		mv.addObject("YoutubeList", YoutubeList);
		mv.addObject("NaverList", NaverList);
		mv.setViewName("getRecipeList.jsp");
		return mv;
	}

	// 상황별 레시피 검색
	@RequestMapping(value = "/getSituationRecipe.do")
	public ModelAndView getSituationRecipe(RecipeVO vo,@RequestParam("key") String situation,@RequestParam(defaultValue="1") int curPage, ModelAndView mv) {
		List<RecipeVO> recipeList;
		Pagination pagination = null;
		if(situation.equals("전체")) {
			int listCnt=recipeDAO.getRecipeCount();
			pagination=new Pagination(listCnt,curPage);
			vo.setPageSize(pagination.getPageSize()); //db 쿼리의 limit
			vo.setStartIndex(pagination.getStartIndex()); //db 쿼리의 offset
			recipeList = recipeDAO.getRecipeList(vo);
		}else {
			int listCnt=recipeDAO.getSituationCount(situation);
			pagination=new Pagination(listCnt,curPage);
			vo.setPageSize(pagination.getPageSize()); //db 쿼리의 limit
			vo.setStartIndex(pagination.getStartIndex()); //db 쿼리의 offset
			vo.setRecipeSituation(situation);
			recipeList = recipeDAO.getSituationRecipe(vo);
		}
		mv.addObject("situation", situation);
		mv.addObject("recipeList", recipeList);
		mv.addObject("pagination", pagination);
		mv.setViewName("getSituationList.jsp");
		return mv;
	}

	// 재료별 레시피 검색
	@RequestMapping(value = "/getIngredientRecipe.do")
	public ModelAndView getIngredientRecipe(RecipeVO vo,@RequestParam("key") String ingredient,@RequestParam(defaultValue="1") int curPage, ModelAndView mv) {
		List<RecipeVO> recipeList;
		Pagination pagination=null;
		if(ingredient.equals("전체")) {
			int listCnt=recipeDAO.getRecipeCount();
			pagination=new Pagination(listCnt,curPage);
			vo.setPageSize(pagination.getPageSize()); //db 쿼리의 limit
			vo.setStartIndex(pagination.getStartIndex()); //db 쿼리의 offset
			recipeList = recipeDAO.getRecipeList(vo);
		}else {
			int listCnt=recipeDAO.getIngredientCount(ingredient);
			pagination=new Pagination(listCnt,curPage);
			vo.setPageSize(pagination.getPageSize()); //db 쿼리의 limit
			vo.setStartIndex(pagination.getStartIndex()); //db 쿼리의 offset
			vo.setRecipeIngredient(ingredient);
			recipeList = recipeDAO.getIngredientRecipe(vo);
		}
		mv.addObject("ingredient", ingredient);
		mv.addObject("recipeList", recipeList);
		mv.addObject("pagination", pagination);
		mv.setViewName("getIngredientList.jsp");
		return mv;
	}
}
