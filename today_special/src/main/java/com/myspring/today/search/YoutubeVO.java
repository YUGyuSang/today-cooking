package com.myspring.today.search;

public class YoutubeVO {
	private String videoId;
	private String title;
	private String thumbnailUrl;
	private String url;

	public String getVideoId() {
		return videoId;
	}

	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}

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
		return "YoutubeVO [videoId=" + videoId + ", title=" + title + ", thumbnailUrl="
				+ thumbnailUrl + ", url=" + url + "]";
	}
}
