package com.mystudy.project.vo;

import java.sql.Date;

public class CartVO {
	private int cartNum;
	private int itemNum;
	private int cusNum;
	private int cartQuantity;
	private Date cartRegDate;

	public CartVO() {}
	

	public CartVO(int itemNum, int cusNum, int cartQuantity) {
		super();
		this.itemNum = itemNum;
		this.cusNum = cusNum;
		this.cartQuantity = cartQuantity;
	}

	public CartVO(int cartNum, int itemNum, int cusNum, int cartQuantity, Date cartRegDate) {
		super();
		this.cartNum = cartNum;
		this.itemNum = itemNum;
		this.cusNum = cusNum;
		this.cartQuantity = cartQuantity;
		this.cartRegDate = cartRegDate;
	}

	public int getCartNum() {
		return cartNum;
	}

	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}

	public int getCusNum() {
		return cusNum;
	}

	public void setCusNum(int cusNum) {
		this.cusNum = cusNum;
	}

	public int getCartQuantity() {
		return cartQuantity;
	}

	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}

	public Date getCartRegDate() {
		return cartRegDate;
	}

	public void setCartRegDate(Date cartRegDate) {
		this.cartRegDate = cartRegDate;
	}

	@Override
	public String toString() {
		return "CartVO [cartNum=" + cartNum + ", itemNum=" + itemNum + ", cusNum=" + cusNum + ", cartQuantity="
				+ cartQuantity + ", cartRegDate=" + cartRegDate + "]";
	}

}
