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

	// 상황별 레시피 검색시
	public List<RecipeVO> getSituationRecipe(String recipeSituation) {
		return mybatis.selectList("RecipeDAO.getSituationRecipe", recipeSituation);
	}

	// 재료별 레시피 검색시
	public List<RecipeVO> getIngredientRecipe(String recipeIngredient) {
		return mybatis.selectList("RecipeDAO.getIngredientRecipe", recipeIngredient);
	}

	// 일간 베스트
	public List<RecipeVO> getTodayBest() {
		return mybatis.selectList("RecipeDAO.getTodayBest");
	}

	// 주간 베스트
	public List<RecipeVO> getWeeklyBest() {
		return mybatis.selectList("RecipeDAO.getWeeklyBest");
	}

	// 북마크 수 증가
	public void upBookmarkCount(int recipeId) {
		mybatis.update("RecipeDAO.upBookmarkCount", recipeId);
	}

	// 북마크 수 감소
	public void downBookmarkCount(int recipeId) {
		mybatis.update("RecipeDAO.downBookmarkCount", recipeId);
	}

	// 내가 쓴 글
	public List<RecipeVO> getMyRecipeList(String userId) {
		return mybatis.selectList("RecipeDAO.getMyRecipeList",userId);
	}
	
	// 레시피 삭제
	public void deleteRecipe(RecipeVO revo) {
		mybatis.delete("RecipeDAO.deleteRecipe", revo);
	}

}
