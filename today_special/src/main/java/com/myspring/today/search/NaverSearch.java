package com.myspring.today.search;

import java.net.URLEncoder;
import java.util.List;

import org.jsoup.nodes.Document;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class NaverSearch {
	static String url2;
	public static void getNaverList(String searchKeyword) {
		String url = "https://search.naver.com/search.naver?sm=tab_hty.top&where=view&query=";
		String url2 = null;
		Document doc = null;
		try {
			String query = URLEncoder.encode(searchKeyword, "UTF-8"); // 한글 검색 인코딩
			url2 = url + query + "&sm=tab_viw.all&nso=&mode=normal&main_q=&st_coll=&topic_r_cat=";
			doc = Jsoup.connect(url2).get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		int i = 0;
		Elements element = doc.select("li.bx._svp_item");
		for (Element el : element.select("a.api_txt_lines.total_tit")) { // 블로그 글 제목만 출력
			System.out.println(el.text());
			i++;
			if (i == 10)
				break; // 10개만 출력
		}

	}
}