package com.mystudy.project.vo;

public class AdminVO {

	private String adminId;
	private String adminPassword;
	private int adminNum;
	
	
	public AdminVO() {}

	public AdminVO(String adminId, String adminPassword) {
		super();
		this.adminId = adminId;
		this.adminPassword = adminPassword;
	}
	public AdminVO(String adminId, String adminPassword, int adminNum) {
		super();
		this.adminId = adminId;
		this.adminPassword = adminPassword;
		this.adminNum = adminNum;
		
	}
	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	public int getAdminNum() {
		return adminNum;
	}

	public void setAdminNum(int adminNum) {
		this.adminNum = adminNum;
	}

	@Override
	public String toString() {
		return "AdminVO [adminId=" + adminId + ", adminPassword=" + adminPassword + ", adminNum=" + adminNum + "]";
	}

}
