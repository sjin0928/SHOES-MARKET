package com.mystudy.project.vo;

import java.sql.Date;

public class CustomerVO {
	private int cusNum;
	private String cusEmail;
	private String cusPassword;
	private String cusName;
	private String cusNickName;
	private String cusPhoneNum;
	private Date cusRegDate;
	private Date cusModDate;

	public CustomerVO() {
		super();
	}

	public CustomerVO(int cusNum, String cusEmail, String cusPassword, String cusName, String cusNickName,
			String cusPhoneNum, Date cusRegDate, Date cusModDate) {
		super();
		this.cusNum = cusNum;
		this.cusEmail = cusEmail;
		this.cusPassword = cusPassword;
		this.cusName = cusName;
		this.cusNickName = cusNickName;
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

	public String getCusEmail() {
		return cusEmail;
	}

	public void setCusEmail(String cusEmail) {
		this.cusEmail = cusEmail;
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
		return "CustomerVO [cusNum=" + cusNum + ", cusEmail=" + cusEmail + ", cusPassword=" + cusPassword + ", cusName="
				+ cusName + ", cusNickName=" + cusNickName + ", cusPhoneNum=" + cusPhoneNum + ", cusRegDate="
				+ cusRegDate + ", cusModDate=" + cusModDate + "]";
	}

}
