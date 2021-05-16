package com.myspring.today.search;

public class NaverVO {
	private String title;
	private String thumbnailUrl;
	private String url;
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThumbnailUrl() {
		return thumbnailUrl;
	}

	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "YoutubeVO [title=" + title + ", thumbnailUrl="
				+ thumbnailUrl + ", url=" + url + "]";
	}

}
