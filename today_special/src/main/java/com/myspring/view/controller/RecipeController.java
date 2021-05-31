package com.myspring.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.today.bookmark.BookmarkInnerDAO;
import com.myspring.today.bookmark.BookmarkInnerVO;
import com.myspring.today.ingredient.IngredientDAO;
import com.myspring.today.ingredient.IngredientVO;
import com.myspring.today.order.OrderDAO;
import com.myspring.today.order.OrderVO;
import com.myspring.today.recipe.RecipeDAO;
import com.myspring.today.recipe.RecipeVO;

@Controller
public class RecipeController {
	@Autowired
	private RecipeDAO recipeDAO;
	@Autowired
	private IngredientDAO ingredientDAO;
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private BookmarkInnerDAO innerDAO;

	// 레시피 등록 하기 전 MaxRecipeId 찾기
	@RequestMapping("/getMaxRecipeId.do")
	public ModelAndView getMaxRecipeId(ModelAndView mv) {
		int maxNum = 0;
		try {
			maxNum = recipeDAO.getMaxRecipeId();
		} catch (NullPointerException e) {
		}
		int recipeId = maxNum + 1;
		mv.addObject("recipeId", recipeId);
		mv.setViewName("insertRecipe.jsp");
		return mv;
	}

	// 레시피 등록
	@RequestMapping("/insertRecipe.do")
	public String insertRecipe(RecipeVO revo, @RequestParam("ingredientName") String[] ingredientName,
			@RequestParam("ingredientAmount") String[] ingredientAmount,
			@RequestParam("orderContent") String[] orderContent, @RequestParam("recipeThumb") MultipartFile thumb)
			throws IOException {
		if (!thumb.isEmpty()) {
			UUID uuid = UUID.randomUUID();
			String fileName = uuid + "_" + thumb.getOriginalFilename();
			thumb.transferTo(new File("C:/spring_img/" + fileName));
			revo.setRecipeThumbnail(fileName);
		}
		recipeDAO.insertRecipe(revo);
		int i;
		int recipeId = revo.getRecipeId();
		for (i = 0; i < ingredientName.length; i++) {
			IngredientVO invo = new IngredientVO();
			invo.setIngredientName(ingredientName[i]);
			invo.setIngredientAmount(ingredientAmount[i]);
			invo.setRecipeId(recipeId);
			ingredientDAO.insertIngredient(invo);
		}
		for (i = 0; i < orderContent.length; i++) {
			OrderVO orvo = new OrderVO();
			orvo.setOrderNum(i + 1);
			orvo.setOrderContent(orderContent[i]);
			orvo.setRecipeId(recipeId);
			orderDAO.insertOrder(orvo);
		}
		return "getRecipe.do";
	}

	// 레시피 글
	@RequestMapping("/getRecipe.do")
	public ModelAndView getRecipe(@RequestParam("recipeId") int recipeId, HttpSession session, ModelAndView mv) {
		BookmarkInnerVO invo = new BookmarkInnerVO();
		String loginId = (String) session.getAttribute("loginId");
		int check = 0;
		if (loginId != null) {
			invo.setRecipeId(recipeId);
			invo.setUserId(loginId);
			check = innerDAO.checkBookmarkInner(invo);
		}
		RecipeVO recipe = recipeDAO.getRecipe(recipeId);
		List<IngredientVO> ingredientList = ingredientDAO.getIngredientList(recipeId);
		List<OrderVO> orderList = orderDAO.getOrderList(recipeId);
		mv.addObject("check", check);
		mv.addObject("recipe", recipe);
		mv.addObject("ingredientList", ingredientList);
		mv.addObject("orderList", orderList);
		mv.setViewName("getRecipe.jsp");
		return mv;
	}

	// 랭킹
	@RequestMapping("/getRankingList.do")
	public ModelAndView getRankingList(ModelAndView mv) {
		List<RecipeVO> todayList = recipeDAO.getTodayBest();
		List<RecipeVO> weeklyList = recipeDAO.getWeeklyBest();
		mv.addObject("todayList", todayList);
		mv.addObject("weeklyList", weeklyList);
		mv.setViewName("ranking.jsp");
		return mv;
	}

	// 내가 쓴 글
	@RequestMapping("/getMyRecipeList.do")
	public ModelAndView getMyRecipeList(HttpSession session, ModelAndView mv) {
		String loginId = (String) session.getAttribute("loginId");
		List<RecipeVO> recipeList = recipeDAO.getMyRecipeList(loginId);
		mv.addObject("recipeList", recipeList);
		mv.setViewName("getMyRecipeList.jsp");
		return mv;
	}

	// 레시피 삭제
	@RequestMapping("/deleteRecipe.do")
	public String deleteRecipe(RecipeVO revo) {
		recipeDAO.deleteRecipe(revo);
		return "getMyRecipeList.do";
	}
}
