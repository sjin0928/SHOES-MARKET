package com.mystudy.project.vo;

import java.sql.Date;

public class ReviewVO {
	private int reviewNum;
	private int cusNum;
	private int itemNum;
	private String title;
	private String reviewContents;
	private String imagePath;
	private Date regDate;
	private Date modDate;
	
	public ReviewVO() {}

	public ReviewVO(int reviewNum, int cusNum, int itemNum, String title, String reviewContents, String imagePath,
			Date regDate, Date modDate) {
		super();
		this.reviewNum = reviewNum;
		this.cusNum = cusNum;
		this.itemNum = itemNum;
		this.title = title;
		this.reviewContents = reviewContents;
		this.imagePath = imagePath;
		this.regDate = regDate;
		this.modDate = modDate;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public int getCusNum() {
		return cusNum;
	}

	public void setCusNum(int cusNum) {
		this.cusNum = cusNum;
	}

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getReviewContents() {
		return reviewContents;
	}

	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
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
		return "ReviewVO [reviewNum=" + reviewNum + ", cusNum=" + cusNum + ", itemNum=" + itemNum + ", title=" + title
				+ ", reviewContents=" + reviewContents + ", imagePath=" + imagePath + ", regDate=" + regDate
				+ ", modDate=" + modDate + "]";
	}

}
