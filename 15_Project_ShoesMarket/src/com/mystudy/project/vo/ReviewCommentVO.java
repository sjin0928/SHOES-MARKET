package com.mystudy.project.vo;

import java.sql.Date;

public class ReviewCommentVO {
	private String reviewCommentNum;
	private int reviewNum;
	private String reviewCommentContents;
	private Date regDate;
	private Date modDate;
	private int cusNum;

	
	public ReviewCommentVO() {}

	public ReviewCommentVO(String reviewCommentNum, int reviewNum, String reviewCommentContents, Date regDate,
			Date modDate, int cusNum) {
		super();
		this.reviewCommentNum = reviewCommentNum;
		this.reviewNum = reviewNum;
		this.reviewCommentContents = reviewCommentContents;
		this.regDate = regDate;
		this.modDate = modDate;
		this.cusNum = cusNum;
	}

	public String getReviewCommentNum() {
		return reviewCommentNum;
	}

	public void setReviewCommentNum(String reviewCommentNum) {
		this.reviewCommentNum = reviewCommentNum;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public String getReviewCommentContents() {
		return reviewCommentContents;
	}

	public void setReviewCommentContents(String reviewCommentContents) {
		this.reviewCommentContents = reviewCommentContents;
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

	public int getCusNum() {
		return cusNum;
	}

	public void setCusNum(int cusNum) {
		this.cusNum = cusNum;
	}

	@Override
	public String toString() {
		return "ReviewCommentVO [reviewCommentNum=" + reviewCommentNum + ", reviewNum=" + reviewNum
				+ ", reviewCommentContents=" + reviewCommentContents + ", regDate=" + regDate + ", modDate=" + modDate
				+ ", cusNum=" + cusNum + "]";
	}

}