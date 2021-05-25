package com.myspring.today.bookmark;

public class BookmarkOuterVO {
	private int outerId;
	private String outerUrl;
	private String outerTitle;
	private String outerThumbnail;
	private String userId;
	public int getOuterId() {
		return outerId;
	}
	public void setOuterId(int outerId) {
		this.outerId = outerId;
	}
	public String getOuterUrl() {
		return outerUrl;
	}
	public void setOuterUrl(String outerUrl) {
		this.outerUrl = outerUrl;
	}
	public String getOuterTitle() {
		return outerTitle;
	}
	public void setOuterTitle(String outerTitle) {
		this.outerTitle = outerTitle;
	}
	public String getOuterThumbnail() {
		return outerThumbnail;
	}
	public void setOuterThumbnail(String outerThumbnail) {
		this.outerThumbnail = outerThumbnail;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "BookmarkOuterVO [outerId=" + outerId + ", outerUrl=" + outerUrl + ", outerTitle="
				+ outerTitle + ", outerThumbnail=" + outerThumbnail + ", userId=" + userId + "]";
	}
	
}
