package com.myspring.today.recipe;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.today.user.UserVO;

@Repository
public class RecipeDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int getMaxRecipeId() {
		return mybatis.selectOne("RecipeDAO.getMaxRecipeId");
	}
	// 레시피 등록
	public void insertRecipe(RecipeVO vo) {
		mybatis.insert("RecipeDAO.insertRecipe", vo);
	}
	public RecipeVO getRecipe(int recipeId) {
		return mybatis.selectOne("RecipeDAO.getRecipe",recipeId);
	}
	public RecipeVO getNewRecipe() {
		return mybatis.selectOne("RecipeDAO.getNewRecipe");
	}
}
