package com.myspring.today.search;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JsonTest {
	public static void main(String[] args) throws ParseException { // 예외처리
		String jsonString ="{"
			    +   "\"posts\": ["
			    +       "{"
			    + "\"id\": {"
			    +   "\"kind\": \"youtube#video\","
			    +    "\"videoId\": \"RVfSeUZ8XkY\"},"
			    +           "\"title\": \"how to get stroage size\","
			    +           "\"url\": \"https://codechacha.com/ko/get-free-and-total-size-of-volumes-in-android/\","
			    +           "\"draft\": false"
			    +       "},"
			    +       "{"
			    + "\"id\": {"
			    +   "\"kind\": \"youtube#video\","
			    +    "\"videoId\": \"RVfSeUZ8XkY\"},"
			    +           "\"title\": \"Android Q, Scoped Storage\","
			    +           "\"url\": \"https://codechacha.com/ko/android-q-scoped-storage/\","
			    +           "\"draft\": false"
			    +       "},"
			    +       "{"
			    + "\"id\": {"
			    +   "\"kind\": \"youtube#video\","
			    +    "\"videoId\": \"RVfSeUZ8XkY\"},"
			    +           "\"title\": \"How to parse JSON in android\","
			    +           "\"url\": \"https://codechacha.com/ko/how-to-parse-json-in-android/\","
			    +           "\"draft\": true"
			    +       "}"
			    +   "]"
			    +"}";
		 try {
			 List<YoutubeVO> YoutubeList = new ArrayList<YoutubeVO>();
			 
             JSONParser jsonParser = new JSONParser();
             JSONObject jsonObj = (JSONObject) jsonParser.parse(jsonString);
             JSONArray itemArray = (JSONArray) jsonObj.get("items");
             System.out.println("=====Members=====");
             for(int i=0 ; i<itemArray.size() ; i++){
        	 	 YoutubeVO vo=new YoutubeVO();
                 JSONObject item = (JSONObject) itemArray.get(i);
                 JSONObject id = (JSONObject) item.get("id");
                 vo.setVideoId((String)id.get("videoId"));
                 JSONObject snippet = (JSONObject) item.get("snippet");
                 vo.setTitle((String)snippet.get("title"));
                 JSONObject thumbnails = (JSONObject) snippet.get("thumbnails");
                 JSONObject thDefault = (JSONObject) thumbnails.get("default");
                 vo.setThumbnailUrl((String)thDefault.get("url"));
                 YoutubeList.add(vo);
              		}
             } catch (ParseException e) {
                     e.printStackTrace();

             }
     }
}
