package com.myspring.today.bookmark;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookmarkOuterDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 외부 북마크 등록
	public void insertBookmarkOuter(BookmarkOuterVO vo) {
		mybatis.insert("BookmarkOuterDAO.insertBookmarkOuter", vo);
	}
	
	// 외부 북마크 등록 전 중복된 북마크인지 확인
	public int checkBookmarkOuter(BookmarkOuterVO vo) {
		return mybatis.selectOne("BookmarkOuterDAO.checkBookmarkOuter", vo);
	}
	// 외부 북마크 등록
	public List<BookmarkOuterVO> getBookmarkOuter(String userId) {
		return mybatis.selectList("BookmarkOuterDAO.getBookmarkOuter", userId);
	}
	
	// 외부 북마크 삭제
	public void deleteBookmarkOuter(BookmarkOuterVO vo) {
		mybatis.delete("BookmarkOuterDAO.deleteBookmarkOuter", vo);	
	}

	
}
