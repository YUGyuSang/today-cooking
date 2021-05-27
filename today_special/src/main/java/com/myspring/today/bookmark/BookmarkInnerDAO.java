package com.myspring.today.bookmark;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.today.order.OrderVO;

@Repository
public class BookmarkInnerDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 내부 북마크 등록
	public void insertBookmarkInner(BookmarkInnerVO vo) {
		mybatis.insert("BookmarkInnerDAO.insertBookmarkInner", vo);
	}

	// 내부 북마크 등록 전 중복된 북마크인지 확인
	public int checkBookmarkInner(BookmarkInnerVO vo) {
		return mybatis.selectOne("BookmarkInnerDAO.checkBookmarkInner", vo);
	}

	// 내부 북마크 리턴
	public List<BookmarkInnerVO> getBookmarkInner(String userId) {
		return mybatis.selectList("BookmarkInnerDAO.getBookmarkInner", userId);
	}

	// 내부 북마크 삭제
	public void deleteBookmarkInner(BookmarkInnerVO vo) {
		mybatis.delete("BookmarkInnerDAO.deleteBookmarkInner", vo);
	}
}
