package com.myspring.today.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 순서 등록
	public void insertOrder(OrderVO vo) {
		mybatis.insert("OrderDAO.insertOrder", vo);
	}
	
	// 순서 리턴
	public List<OrderVO> getOrderList(int recipeId) {
		return mybatis.selectList("OrderDAO.getOrderList", recipeId);
	}
}
