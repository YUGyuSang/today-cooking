package com.myspring.today.bookmark;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.today.order.OrderVO;

@Repository
public class BookmarkInnerDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 순서 등록
	public void insertOrder(OrderVO vo) {
		mybatis.insert("OrderDAO.insertOrder", vo);
	}
}
