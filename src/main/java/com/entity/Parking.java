package com.entity;
import java.sql.Timestamp;
public class Parking {
	private int parkingid;
	private String vehicle_number;
	private String vehicle_type;
	private String Slot_name;
	private Timestamp created_at;
	private Timestamp updated_at;
	private String earned_amount;
	private String paid_status;
	public String phone;
	public Parking() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Parking(String vehicle_number, String vehicle_type, String slot_name, Timestamp created_at,
			Timestamp updated_at, String earned_amount, String paid_status, String phone) {
		super();
		this.vehicle_number = vehicle_number;
		this.vehicle_type = vehicle_type;
		Slot_name = slot_name;
		this.created_at = created_at;
		this.updated_at = updated_at;
		this.earned_amount = earned_amount;
		this.paid_status = paid_status;
		this.phone = phone;
	}

	public int getParkingid() {
		return parkingid;
	}
	public void setParkingid(int parkingid) {
		this.parkingid = parkingid;
	}
	public String getVehicle_number() {
		return vehicle_number;
	}
	public void setVehicle_number(String vehicle_number) {
		this.vehicle_number = vehicle_number;
	}
	public String getVehicle_type() {
		return vehicle_type;
	}
	public void setVehicle_type(String vehicle_type) {
		this.vehicle_type = vehicle_type;
	}
	public String getSlot_name() {
		return Slot_name;
	}
	public void setSlot_name(String slot_name) {
		Slot_name = slot_name;
	}
	public Timestamp getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}
	public Timestamp getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Timestamp updated_at) {
		this.updated_at = updated_at;
	}
	public String getEarned_amount() {
		return earned_amount;
	}
	public void setEarned_amount(String earned_amount) {
		this.earned_amount = earned_amount;
	}
	public String getPaid_status() {
		return paid_status;
	}
	public void setPaid_status(String paid_status) {
		this.paid_status = paid_status;
	}
	  public String getPhone() {
	        return phone;
	    }

	    public void setPhone(String phone) {
	        this.phone = phone;
	    }
	@Override
	public String toString() {
		return "Parking [parkingid=" + parkingid + ", vehicle_number=" + vehicle_number + ", vehicle_type="
				+ vehicle_type + ", Slot_name=" + Slot_name + ", created_at=" + created_at + ", updated_at="
				+ updated_at + ", earned_amount=" + earned_amount + ", paid_status=" + paid_status + ", phone =" + phone
                + "]";
	}
	

}
