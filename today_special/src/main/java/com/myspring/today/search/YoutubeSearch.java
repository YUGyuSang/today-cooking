package com.myspring.today.search;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import org.springframework.stereotype.Component;

import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestInitializer;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.ResourceId;
import com.google.api.services.youtube.model.SearchListResponse;
import com.google.api.services.youtube.model.SearchResult;
import com.google.api.services.youtube.model.Thumbnail;

@Component
public class YoutubeSearch {
	private static String PROPERTIES_FILENAME = "youtube.properties";
	private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
	private static final JsonFactory JSON_FACTORY = new JacksonFactory();
	private static final long NUMBER_OF_VIDEOS_RETURNED = 2;
	private static YouTube youtube;
	
	static List<YoutubeVO> YoutubeList = new ArrayList<YoutubeVO>();
	
	public static List<YoutubeVO> getYoutubeList(String recipe_name) {
		List<YoutubeVO> tmp = new ArrayList<YoutubeVO>();
		Properties properties = new Properties();
		try {
			InputStream in = YoutubeSearch.class.getResourceAsStream(PROPERTIES_FILENAME);
			properties.load(in);

		} catch (IOException e) {
			System.err.println("There was an error reading " + PROPERTIES_FILENAME + ": "
					+ e.getCause() + " : " + e.getMessage());
			System.exit(1);
		}
		try {
			youtube = new YouTube.Builder(HTTP_TRANSPORT, JSON_FACTORY,
					new HttpRequestInitializer() {
						public void initialize(HttpRequest request) throws IOException {
						}
					}).setApplicationName("youtube-cmdline-search-sample").build();

			YouTube.Search.List search = youtube.search().list("id,snippet");
			String apiKey = properties.getProperty("youtube.apikey");
			search.setKey(apiKey);
			search.setQ(recipe_name);
			search.setType("video");
			search.setFields(
					"items(id/kind,id/videoId,snippet/title,snippet/thumbnails/default/url)");
			search.setMaxResults(NUMBER_OF_VIDEOS_RETURNED);
			SearchListResponse searchResponse = search.execute();

			List<SearchResult> searchResultList = searchResponse.getItems();

			if (searchResultList != null) {
				tmp=prettyPrint(searchResultList.iterator(), recipe_name);
			}
		} catch (GoogleJsonResponseException e) {
			System.err.println("There was a service error: " + e.getDetails().getCode() + " : "
					+ e.getDetails().getMessage());
		} catch (IOException e) {
			System.err.println("There was an IO error: " + e.getCause() + " : " + e.getMessage());
		} catch (Throwable t) {
			t.printStackTrace();
		}
		return tmp;
	}

	private static List<YoutubeVO> prettyPrint(Iterator<SearchResult> iteratorSearchResults, String query) {
		if (!iteratorSearchResults.hasNext()) {
			System.out.println(" There aren't any results for your query.");
		}

		while (iteratorSearchResults.hasNext()) {
			YoutubeVO vo =new YoutubeVO();
			SearchResult singleVideo = iteratorSearchResults.next();
			ResourceId rId = singleVideo.getId();
			// Double checks the kind is video.
			if (rId.getKind().equals("youtube#video")) {
				Thumbnail thumbnail = singleVideo.getSnippet().getThumbnails().get("default");
				vo.setVideoId(rId.getVideoId());
				System.out.println(" Video Id" + rId.getVideoId());
				vo.setTitle(singleVideo.getSnippet().getTitle());
				vo.setThumbnailUrl(thumbnail.getUrl());
				vo.setUrl("https://www.youtube.com/watch?v="+rId.getVideoId());
				System.out.println(vo.getUrl());
			}
			YoutubeList.add(vo);
		}
		return YoutubeList;
	}
}
