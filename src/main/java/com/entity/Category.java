package com.entity;

public class Category {
	
	private int categoryid;
	private String category_name;
	private String status;
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Category(String category_name, String status) {
		super();
		this.category_name = category_name;
		this.status = status;
	}
	public int getId() {
		return categoryid;
	}
	public void setId(int id) {
		this.categoryid = id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Category [id=" + categoryid + ", category_name=" + category_name + ", status=" + status + "]";
	}
	
	

}
