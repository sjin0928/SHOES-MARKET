package com.mystudy.project.vo;

import java.sql.Date;

public class BuyVO {
	private int buyNum;
	private int cusNum;
	private String payStatus;
	private Date buyDate;
	private String zipCode;
	private String address;
	private String detailAddress;
	private String phone;
	private String deliveryRequest;
	private String payment;
	private String cancelStatus;
	private int totalPrice;
	
	public BuyVO() {}
	
	
	// 주문 insert할 때 필요 : cusNum, zipCode, address, detailAddress, PHONE, PAYMENT, TOTAL_PRICE, deliveryRequest
	public BuyVO(int cusNum, String zipCode, String address, String detailAddress, String phone, String deliveryRequest,
			String payment, int totalPrice) {
		super();
		this.cusNum = cusNum;
		this.zipCode = zipCode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.phone = phone;
		this.deliveryRequest = deliveryRequest;
		this.payment = payment;
		this.totalPrice = totalPrice;
	}



	public BuyVO(int buyNum, int cusNum, String payStatus, Date buyDate, String zipCode, String address,
			String detailAddress, String phone, String deliveryRequest, String payment, String cancelStatus,
			int totalPrice) {
		super();
		this.buyNum = buyNum;
		this.cusNum = cusNum;
		this.payStatus = payStatus;
		this.buyDate = buyDate;
		this.zipCode = zipCode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.phone = phone;
		this.deliveryRequest = deliveryRequest;
		this.payment = payment;
		this.cancelStatus = cancelStatus;
		this.totalPrice = totalPrice;
	}

	




	public int getBuyNum() {
		return buyNum;
	}

	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}

	public int getCusNum() {
		return cusNum;
	}

	public void setCusNum(int cusNum) {
		this.cusNum = cusNum;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDeliveryRequest() {
		return deliveryRequest;
	}

	public void setDeliveryRequest(String deliveryRequest) {
		this.deliveryRequest = deliveryRequest;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getCancelStatus() {
		return cancelStatus;
	}

	public void setCancelStatus(String cancelStatus) {
		this.cancelStatus = cancelStatus;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "BuyVO [buyNum=" + buyNum + ", cusNum=" + cusNum + ", payStatus=" + payStatus + ", buyDate=" + buyDate
				+ ", zipCode=" + zipCode + ", address=" + address + ", detailAddress=" + detailAddress + ", phone="
				+ phone + ", deliveryRequest=" + deliveryRequest + ", payment=" + payment + ", cancelStatus="
				+ cancelStatus + ", totalPrice=" + totalPrice + "]";
	}

}
