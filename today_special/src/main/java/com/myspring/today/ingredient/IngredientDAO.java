package com.myspring.today.ingredient;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.today.recipe.RecipeVO;

@Repository
public class IngredientDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 재료 등록
	public void insertIngredient(IngredientVO vo) {
		mybatis.insert("IngredientDAO.insertIngredient", vo);
	}
	
	public int getRecipeId(RecipeVO vo) {
		return mybatis.selectOne("RecipeDAO.getRecipeId", vo);
	}
}
