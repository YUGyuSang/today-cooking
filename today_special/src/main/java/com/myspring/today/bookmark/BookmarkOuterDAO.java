package com.myspring.today.bookmark;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.today.order.OrderVO;

@Repository
public class BookmarkOuterDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 외부 북마크 등록
	public void insertBookmarkOuter(BookmarkOuterVO vo) {
		mybatis.insert("BookmarkOuterDAO.insertBookmarkOuter", vo);
	}
}
