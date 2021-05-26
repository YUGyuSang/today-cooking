package com.myspring.today.recipe;

import java.sql.Date;

public class RecipeVO {
	private int recipeId;
	private String recipeTitle; //제목
	private String recipeContent; //간단 설명
	private String recipeSituation; //상황
	private String recipeIngredient; //재료
	private String recipeThumbnail; //썸네일
	private int bookmarkCount;
	private Date recipeDate;
	private String userId;
	
	//검색을 위한 변수
	private String searchKeyword;
	
	public int getRecipeId() {
		return recipeId;
	}
	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}
	public String getRecipeTitle() {
		return recipeTitle;
	}
	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}
	public String getRecipeContent() {
		return recipeContent;
	}
	public void setRecipeContent(String recipeContent) {
		this.recipeContent = recipeContent;
	}
	public String getRecipeSituation() {
		return recipeSituation;
	}
	public void setRecipeSituation(String recipeSituation) {
		this.recipeSituation = recipeSituation;
	}
	public String getRecipeIngredient() {
		return recipeIngredient;
	}
	public void setRecipeIngredient(String recipeIngredient) {
		this.recipeIngredient = recipeIngredient;
	}

	public String getRecipeThumbnail() {
		return recipeThumbnail;
	}
	public void setRecipeThumbnail(String recipeThumbnail) {
		this.recipeThumbnail = recipeThumbnail;
	}
	public int getBookmarkCount() {
		return bookmarkCount;
	}
	public void setBookmarkCount(int bookmarkCount) {
		this.bookmarkCount = bookmarkCount;
	}
	public Date getRecipeDate() {
		return recipeDate;
	}
	public void setRecipeDate(Date recipeDate) {
		this.recipeDate = recipeDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	@Override
	public String toString() {
		return "RecipeVO [recipeId=" + recipeId + ", recipeTitle=" + recipeTitle
				+ ", recipeContent=" + recipeContent + ", recipeSituation=" + recipeSituation
				+ ", recipeIngredient=" + recipeIngredient + ", userId=" + userId + "]";
	}
	
}
