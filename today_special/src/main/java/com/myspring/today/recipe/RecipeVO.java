package com.myspring.today.recipe;

import java.sql.Date;
import java.util.Arrays;

public class RecipeVO {
	private int recipeId;
	private String recipeTitle; //제목
	private String recipeContent; //간단 설명
	private String recipeSituation; //상황
	private String recipeIngredient; //재료
	private byte[] recipeThumbnail; //썸네일
	private int bookmarkCount;
	private Date recipeDate;
	private String userId;
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
	public byte[] getRecipeThumbnail() {
		return recipeThumbnail;
	}
	public void setRecipeThumbnail(byte[] recipeThumbnail) {
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
	@Override
	public String toString() {
		return "RecipeVO [recipeId=" + recipeId + ", recipeTitle=" + recipeTitle
				+ ", recipeContent=" + recipeContent + ", recipeSituation=" + recipeSituation
				+ ", recipeIngredient=" + recipeIngredient + ", userId=" + userId + "]";
	}
	
}
