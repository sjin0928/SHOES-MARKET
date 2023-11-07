package com.mystudy.project.vo;

import java.sql.Date;

public class InquiryCommentVO {
	private int iqCommentNum;
	private int inquiryNum;
	private String contents;
	private Date regDate;
	private Date modDate;
	
	public InquiryCommentVO() {}

	public InquiryCommentVO(int iqCommentNum, int inquiryNum, String contents, Date regDate, Date modDate, int cusNum) {
		super();
		this.iqCommentNum = iqCommentNum;
		this.inquiryNum = inquiryNum;
		this.contents = contents;
		this.regDate = regDate;
		this.modDate = modDate;
	}

	public int getIqCommentNum() {
		return iqCommentNum;
	}

	public void setIqCommentNum(int iqCommentNum) {
		this.iqCommentNum = iqCommentNum;
	}

	public int getInquiryNum() {
		return inquiryNum;
	}

	public void setInquiryNum(int inquiryNum) {
		this.inquiryNum = inquiryNum;
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

	@Override
	public String toString() {
		return "InquiryCommentVO [iqCommentNum=" + iqCommentNum + ", inquiryNum=" + inquiryNum + ", contents="
				+ contents + ", regDate=" + regDate + ", modDate=" + modDate + "]";
	}

}
