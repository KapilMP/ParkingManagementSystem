package com.entity;

public class User {
	
	private int userid;
	private String name;
	private String email;
	private String phone ;
	private String password;
	private String loginName;
	private String role;
	private String loginStatus;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(int userid, String name, String email, String phone, String password, String loginName, String role,
			String loginStatus) {
		super();
		this.userid = userid;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.loginName = loginName;
		this.role = role;
		this.loginStatus = loginStatus;
	}

	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getLoginStatus() {
		return loginStatus;
	}
	public void setLoginStatus(String loginStatus) {
		this.loginStatus = loginStatus;
	}
	@Override
	public String toString() {
		return "User [userid=" + userid + ", name=" + name + ", email=" + email + ", phone=" + phone + ", password="
				+ password + ", loginName=" + loginName + ", role=" + role + ", loginStatus=" + loginStatus + "]";
	}

	
	

}
