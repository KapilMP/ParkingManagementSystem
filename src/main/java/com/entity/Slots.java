package com.entity;

public class Slots {
	
	
	private int slotid;
	private String slot_name;
	private String availability_status;
	public Slots() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Slots(String slot_name, String availability_status) {
		super();
		this.slot_name = slot_name;
		this.availability_status = availability_status;
	}
	public int getId() {
		return slotid;
	}
	public void setId(int id) {
		this.slotid = id;
	}
	public String getSlot_name() {
		return slot_name;
	}
	public void setSlot_name(String slot_name) {
		this.slot_name = slot_name;
	}
	public String getAvailability_status() {
		return availability_status;
	}
	public void setAvailability_status(String availability_status) {
		this.availability_status = availability_status;
	}
	@Override
	public String toString() {
		return "Slots [id=" + slotid + ", slot_name=" + slot_name + ", availability_status=" + availability_status + "]";
	}
	
	
	
	
	

}
