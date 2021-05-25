package com.myspring.today.recipe;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	// 레시피 아이디로 레시피 리턴
	public RecipeVO getRecipe(int recipeId) {
		return mybatis.selectOne("RecipeDAO.getRecipe", recipeId);
	}

	// 키워드로 레시피 검색시
	public List<RecipeVO> getKeywordRecipe(RecipeVO vo) {
		return mybatis.selectList("RecipeDAO.getKeywordRecipe", vo);
	}

	// 키워드로 레시피 검색시
	public List<RecipeVO> getRecipeImageList(RecipeVO vo) {
		return mybatis.selectList("RecipeDAO.getRecipeImageList", vo);
	}
}
