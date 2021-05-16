package com.myspring.today.search;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.stereotype.Component;

@Component
public class NaverSearch {
	public static List<NaverVO> getNaverList(String searchKeyword) {
		List<NaverVO> NaverList=new ArrayList<NaverVO>();
		String url ="https://search.naver.com/search.naver?query=";
		String url2 = null;
		Document doc = null;
		try {
			String query = URLEncoder.encode(searchKeyword, "UTF-8"); // 한글 검색 인코딩
			url2=url+query+"&nso=&where=blog&sm=tab_opt";
			doc = Jsoup.connect(url2).get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		int i = 0;
		for(Element el :doc.select("div.total_wrap.api_ani_send")) {
			NaverVO vo=new NaverVO();
			vo.setUrl(el.select("a.api_txt_lines.total_tit").attr("href")); //전체 Url
			vo.setTitle(el.select("a.api_txt_lines.total_tit").text());//제목
			vo.setThumbnailUrl(el.select("a.thumb_single").select("img").attr("src"));//썸네일 url
			NaverList.add(vo);
			i++;
			if(i==10) break; //10개만 출력
			
		}
		return NaverList;
	}
}