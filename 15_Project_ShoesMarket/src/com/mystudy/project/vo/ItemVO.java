package com.mystudy.project.vo;

import java.sql.Date;

public class ItemVO {
	private int itemNum;
	private String name;
	private int price;
	private int stock;
	private String imagePath;
	private String itemDetail;
	private Date regDate;
	private Date modDate;
	private String brand;
	private String itemStatus;
	private int quantity; 

	public ItemVO() {}
	
	//상품 수정 시 필요
	public ItemVO(int itemNum, String name, int price, int stock, String imagePath, String itemDetail, String brand) {
		super();
		this.itemNum = itemNum;
		this.name = name;
		this.price = price;
		this.stock = stock;
		this.imagePath = imagePath;
		this.itemDetail = itemDetail;
		this.brand = brand;
	}
	
	// 상품 등록 시 필요
	public ItemVO(String name, int price, int stock, String imagePath, String itemDetail, String brand) {
		super();
		this.name = name;
		this.price = price;
		this.stock = stock;
		this.imagePath = imagePath;
		this.itemDetail = itemDetail;
		this.brand = brand;
	}

	public ItemVO(int itemNum, String name, int price, int stock, String imagePath,
			String itemDetail, Date regDate, Date modDate, String brand, String itemStatus, int quantity) {
		super();
		this.itemNum = itemNum;
		this.name = name;
		this.price = price;
		this.stock = stock;
		this.imagePath = imagePath;
		this.itemDetail = itemDetail;
		this.regDate = regDate;
		this.modDate = modDate;
		this.brand = brand;
		this.itemStatus = itemStatus;
		this.quantity = quantity;
		
	}

	public String getItemStatus() {
		return itemStatus;
	}

	public void setItemStatus(String itemStatus) {
		this.itemStatus = itemStatus;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getItemDetail() {
		return itemDetail;
	}

	public void setItemDetail(String itemDetail) {
		this.itemDetail = itemDetail;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getModDate() {
		return modDate;
	}

	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}

	@Override
	public String toString() {
		return "ItemVO [itemNum=" + itemNum + ", name=" + name + ", price=" + price + ", stock=" + stock
				+ ", imagePath=" + imagePath + ", itemDetail=" + itemDetail + ", regDate=" + regDate + ", modDate="
				+ modDate + ", brand=" + brand + ", itemStatus=" + itemStatus + "]";
	}

	

	

}
