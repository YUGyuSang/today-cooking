package com.myspring.today.order;

import java.util.List;

public class OrderVO {
	private int orderId;
	private int orderNum; 
	private String orderContent; 
	private int recipeId;

	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getOrderContent() {
		return orderContent;
	}
	public void setOrderContent(String orderContent) {
		this.orderContent = orderContent;
	}
	public int getRecipeId() {
		return recipeId;
	}
	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}
	
	@Override
	public String toString() {
		return "OrderVO [orderId=" + orderId + ", orderNum=" + orderNum + ", orderContent="
				+ orderContent + ", recipeId=" + recipeId + "]";
	}
	
}
