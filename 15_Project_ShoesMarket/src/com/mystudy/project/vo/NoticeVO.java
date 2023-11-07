package com.mystudy.project.vo;

import java.sql.Date;

public class NoticeVO {
	private int noticeNum;
	private int adminNum;
	private String noticeTitle;
	private String contents;
	private Date regDate;
	private Date modDate;
	public NoticeVO() {
		super();
	}
	public NoticeVO(int noticeNum, int adminNum, String noticeTitle, String contents) {
		super();
		this.noticeNum = noticeNum;
		this.adminNum = adminNum;
		this.noticeTitle = noticeTitle;
		this.contents = contents;
	}
	
	public NoticeVO(int noticeNum, String noticeTitle, String contents) {
		super();
		this.noticeNum = noticeNum;
		this.noticeTitle = noticeTitle;
		this.contents = contents;
	}
	public int getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}
	public int getAdminNum() {
		return adminNum;
	}
	public void setAdminNum(int adminNum) {
		this.adminNum = adminNum;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
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
		return "NoticeVO [noticeNum=" + noticeNum + ", adminNum=" + adminNum + ", noticeTitle=" + noticeTitle
				+ ", contents=" + contents + ", regDate=" + regDate + ", modDate=" + modDate
				+ "]";
	}


	
}
