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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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

	// 레시피 등록 하기 전 MaxRecipeId 찾기
	@RequestMapping("/getMaxRecipeId.do")
	public ModelAndView getMaxRecipeId(ModelAndView mv) {
		int recipeId = recipeDAO.getMaxRecipeId() + 1;
		mv.addObject("recipeId", recipeId);
		mv.setViewName("insertRecipe.jsp");
		return mv;
	}
	
	// 레시피 등록
	@RequestMapping("/insertRecipe.do")
	public String insertRecipe(RecipeVO revo,
			@RequestParam("ingredientName") String[] ingredientName,
			@RequestParam("ingredientAmount") String[] ingredientAmount,
			@RequestParam("orderContent") String[] orderContent,
			@RequestParam("recipeThumb") MultipartFile img) throws IOException {
		if (img != null && !img.isEmpty()) {
			revo.setRecipeThumbnail(img.getBytes());
		}
		recipeDAO.insertRecipe(revo);
		int i;
		int recipeId=revo.getRecipeId();
		for( i =0;i< ingredientName.length;i++) {
			IngredientVO invo=new IngredientVO();
			invo.setIngredientName(ingredientName[i]);
			invo.setIngredientAmount(ingredientAmount[i]);
			invo.setRecipeId(recipeId);
			ingredientDAO.insertIngredient(invo);
		}
		for( i =0;i< orderContent.length;i++) {
			OrderVO orvo=new OrderVO();
			orvo.setOrderNum(i+1);
			orvo.setOrderContent(orderContent[i]);
			orvo.setRecipeId(recipeId);
			orderDAO.insertOrder(orvo);
		}
		return "index.jsp";
	}
}
