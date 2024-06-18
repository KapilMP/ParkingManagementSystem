package com.entity;

public class Rate {
	
	private int rateid;
	private String rate_name;
	private String category;
	private String type;
	private String amount;
	private String status;
	
	public Rate() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Rate(String rate_name, String category, String type, String amount, String status) {
		super();
		this.rate_name = rate_name;
		this.category = category;
		this.type = type;
		this.amount = amount;
		this.status = status;
	}

	public int getRateid() {
		return rateid;
	}

	public void setRateid(int rateid) {
		this.rateid = rateid;
	}

	public String getRate_name() {
		return rate_name;
	}

	public void setRate_name(String rate_name) {
		this.rate_name = rate_name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Rate [rateid=" + rateid + ", rate_name=" + rate_name + ", category=" + category + ", type=" + type
				+ ", amount=" + amount + ", status=" + status + "]";
	}
	
	

}