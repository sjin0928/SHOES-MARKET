package com.mystudy.project.vo;

import java.sql.Date;

public class CustomerVO {
	private int cusNum; // 회원번호
	private String cusId; // 회원아이디
	private String cusPassword; // 회원비밀번호
	private String cusName; // 회원이름
	private String cusNickName; // 회원닉네임
	private String cusEmail; // 회원이메일
	private String cusPhoneNum; // 회원전화번호
	private Date cusRegDate; // 회원생성일
	private Date cusModDate; // 회원수정일

	public CustomerVO() {
	}

	public CustomerVO(String cusId, String cusPassword) {
		this.cusId = cusId;
		this.cusPassword = cusPassword;
	}

	public CustomerVO(String cusId, String cusPassword, String cusName, String cusNickName, String cusEmail,
			String cusPhoneNum, Date cusRegDate) {
		this.cusId = cusId;
		this.cusPassword = cusPassword;
		this.cusName = cusName;
		this.cusNickName = cusNickName;
		this.cusEmail = cusEmail;
		this.cusPhoneNum = cusPhoneNum;
		this.cusRegDate = new Date(System.currentTimeMillis());
	}

	public CustomerVO(String cusId, String cusPassword, String cusName, String cusNickName, String cusEmail,
			String cusPhoneNum, Date cusRegDate, Date cusModDate) {
		this.cusId = cusId;
		this.cusPassword = cusPassword;
		this.cusName = cusName;
		this.cusNickName = cusNickName;
		this.cusEmail = cusEmail;
		this.cusPhoneNum = cusPhoneNum;
		this.cusRegDate = cusRegDate;
		this.cusModDate = cusModDate;
	}

	public CustomerVO(int cusNum, String cusId, String cusPassword, String cusName, String cusNickName, String cusEmail,
			String cusPhoneNum) {
		this.cusNum = cusNum;
		this.cusId = cusId;
		this.cusPassword = cusPassword;
		this.cusName = cusName;
		this.cusNickName = cusNickName;
		this.cusEmail = cusEmail;
		this.cusPhoneNum = cusPhoneNum;
	}

	public CustomerVO(int cusNum, String cusId, String cusPassword, String cusName, String cusNickName, String cusEmail,
			String cusPhoneNum, Date cusRegDate, Date cusModDate) {
		super();
		this.cusNum = cusNum;
		this.cusId = cusId;
		this.cusPassword = cusPassword;
		this.cusName = cusName;
		this.cusNickName = cusNickName;
		this.cusEmail = cusEmail;
		this.cusPhoneNum = cusPhoneNum;
		this.cusRegDate = cusRegDate;
		this.cusModDate = cusModDate;
	}

	public int getCusNum() {
		return cusNum;
	}

	public void setCusNum(int cusNum) {
		this.cusNum = cusNum;
	}

	public String getCusId() {
		return cusId;
	}

	public void setCusId(String cusId) {
		this.cusId = cusId;
	}

	public String getCusPassword() {
		return cusPassword;
	}

	public void setCusPassword(String cusPassword) {
		this.cusPassword = cusPassword;
	}

	public String getCusName() {
		return cusName;
	}

	public void setCusName(String cusName) {
		this.cusName = cusName;
	}

	public String getCusNickName() {
		return cusNickName;
	}

	public void setCusNickName(String cusNickName) {
		this.cusNickName = cusNickName;
	}

	public String getCusEmail() {
		return cusEmail;
	}

	public void setCusEmail(String cusEmail) {
		this.cusEmail = cusEmail;
	}

	public String getCusPhoneNum() {
		return cusPhoneNum;
	}

	public void setCusPhoneNum(String cusPhoneNum) {
		this.cusPhoneNum = cusPhoneNum;
	}

	public Date getCusRegDate() {
		return cusRegDate;
	}

	public void setCusRegDate(Date cusRegDate) {
		this.cusRegDate = cusRegDate;
	}

	public Date getCusModDate() {
		return cusModDate;
	}

	public void setCusModDate(Date cusModDate) {
		this.cusModDate = cusModDate;
	}

	@Override
	public String toString() {
		return "CustomerVO [cusNum=" + cusNum + ", cusId=" + cusId + ", cusPassword=" + cusPassword + ", cusName="
				+ cusName + ", cusNickName=" + cusNickName + ", cusEmail=" + cusEmail + ", cusPhoneNum=" + cusPhoneNum
				+ ", cusRegDate=" + cusRegDate + ", cusModDate=" + cusModDate + "]";
	}

}
