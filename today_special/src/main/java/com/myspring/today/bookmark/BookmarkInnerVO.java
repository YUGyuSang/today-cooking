package com.myspring.today.bookmark;

public class BookmarkInnerVO {
	private int bookmarkId;
	private int recipeId;
	private String userId;
	public int getBookmarkId() {
		return bookmarkId;
	}
	public void setBookmarkId(int bookmarkId) {
		this.bookmarkId = bookmarkId;
	}
	public int getRecipeId() {
		return recipeId;
	}
	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "BookmarkInnerVO [bookmarkId=" + bookmarkId + ", recipeId=" + recipeId + ", userId="
				+ userId + "]";
	}
	
}
