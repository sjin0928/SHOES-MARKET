package com.mystudy.project.vo;

import java.sql.Date;

public class OrderItemsVO {
	private int orderItemNum;
	private int itemNum;
	private int buyNum;
	private int quantity;
	private int price;
	private Date regDate;

	public OrderItemsVO() {}
	
	

	public OrderItemsVO(int itemNum, int buyNum, int quantity, int price) {
		super();
		this.itemNum = itemNum;
		this.buyNum = buyNum;
		this.quantity = quantity;
		this.price = price;
	}



	public OrderItemsVO(int orderItemNum, int itemNum, int buyNum, int quantity, int price, Date regDate) {
		super();
		this.orderItemNum = orderItemNum;
		this.itemNum = itemNum;
		this.buyNum = buyNum;
		this.quantity = quantity;
		this.price = price;
		this.regDate = regDate;
	}

	public int getOrderItemNum() {
		return orderItemNum;
	}

	public void setOrderItemNum(int orderItemNum) {
		this.orderItemNum = orderItemNum;
	}

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}

	public int getBuyNum() {
		return buyNum;
	}

	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "OrderItemsVO [orderItemNum=" + orderItemNum + ", itemNum=" + itemNum + ", buyNum=" + buyNum
				+ ", quantity=" + quantity + ", price=" + price + ", regDate=" + regDate + "]";
	}

}
