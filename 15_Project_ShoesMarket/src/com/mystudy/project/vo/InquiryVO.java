package com.mystudy.project.vo;

import java.sql.Date;

public class InquiryVO {
	private int inquiryNum;
	private int cusNum;
	private String secretStatus;
	private String title;
	private String contents;
	private Date regDate;
	private Date modDate;
	private int itemNum;
	private String cusNickname;

	public InquiryVO() {
		super();
	}

	public InquiryVO(int inquiryNum, int cusNum, String secretStatus, String title, String contents, Date regDate,
			Date modDate, int itemNum, String cusNickname) {
		super();
		this.inquiryNum = inquiryNum;
		this.cusNum = cusNum;
		this.secretStatus = secretStatus;
		this.title = title;
		this.contents = contents;
		this.regDate = regDate;
		this.modDate = modDate;
		this.itemNum = itemNum;
		this.cusNickname = cusNickname;
	}

	public int getInquiryNum() {
		return inquiryNum;
	}

	public void setInquiryNum(int inquiryNum) {
		this.inquiryNum = inquiryNum;
	}

	public int getCusNum() {
		return cusNum;
	}

	public void setCusNum(int cusNum) {
		this.cusNum = cusNum;
	}

	public String getSecretStatus() {
		return secretStatus;
	}

	public void setSecretStatus(String secretStatus) {
		this.secretStatus = secretStatus;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
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

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}
	
	public String getCusNickname() {
		return cusNickname;
	}

	public void setCusNickname(String cusNickname) {
		this.cusNickname = cusNickname;
	}

	@Override
	public String toString() {
		return "InquiryVO [inquiryNum=" + inquiryNum + ", cusNum=" + cusNum + ", secretStatus=" + secretStatus
				+ ", title=" + title + ", contents=" + contents + ", regDate=" + regDate + ", modDate=" + modDate
				+ ", itemNum=" + itemNum + ", cusNickname=" + cusNickname + "]";
	}


}
