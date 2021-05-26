package com.myspring.today.ingredient;

public class IngredientVO {
	private int ingredientId;
	private String ingredientName; 
	private String ingredientAmount; 
	private int recipeId;
	
	public int getIngredientId() {
		return ingredientId;
	}
	public void setIngredientId(int ingredientId) {
		this.ingredientId = ingredientId;
	}
	public String getIngredientName() {
		return ingredientName;
	}
	public void setIngredientName(String ingredientName) {
		this.ingredientName = ingredientName;
	}
	public String getIngredientAmount() {
		return ingredientAmount;
	}
	public void setIngredientAmount(String ingredientAmount) {
		this.ingredientAmount = ingredientAmount;
	}
	public int getRecipeId() {
		return recipeId;
	}
	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}

	@Override
	public String toString() {
		return "IngredientVO [ingredientId=" + ingredientId + ", ingredientName=" + ingredientName
				+ ", ingredientAmount=" + ingredientAmount + ", recipeId=" + recipeId + "]";
	}
	
}
