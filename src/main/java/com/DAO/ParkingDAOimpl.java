package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Category;
import com.entity.Parking;

public class ParkingDAOimpl implements ParkingDAO {
    private Connection conn;

    public ParkingDAOimpl(Connection conn) {
        super();
        this.conn = conn;
    }

    @Override
    public boolean addParking(Parking p) {
        boolean f = false;

        try {
            String sql = "INSERT INTO parking(vehicle_number, vehicle_type, slot_name, phone, created_at, paid_status) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p.getVehicle_number());
            ps.setString(2, p.getVehicle_type());
            ps.setString(3, p.getSlot_name());
            ps.setString(4, p.getPhone());
            ps.setTimestamp(5, p.getCreated_at());
            ps.setString(6, p.getPaid_status());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public Parking getParkingByVehicleNumber(String vehicle_number) {
        Parking parking = null;

        try {
            String sql = "SELECT * FROM parking WHERE vehicle_number=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, vehicle_number);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                parking = new Parking();
                parking.setParkingid(rs.getInt("parkingid"));
                parking.setVehicle_number(rs.getString("vehicle_number"));
                parking.setVehicle_type(rs.getString("vehicle_type"));
                parking.setSlot_name(rs.getString("slot_name"));
                parking.setPhone(rs.getString("phone"));
                parking.setCreated_at(rs.getTimestamp("created_at"));
                parking.setUpdated_at(rs.getTimestamp("updated_at"));
                parking.setEarned_amount(rs.getString("earned_amount"));
                parking.setPaid_status(rs.getString("paid_status"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return parking;
    }
    @Override
    public boolean updateParking(Parking p) {
        boolean f = false;
        try {
            String query = "UPDATE parking SET vehicle_number=?, vehicle_type=?, slot_name=?, phone=?, earned_amount=?, paid_status=? WHERE parkingid=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, p.getVehicle_number());
            ps.setString(2, p.getVehicle_type());
            ps.setString(3, p.getSlot_name());
            ps.setString(4, p.getPhone());
            ps.setString(5, p.getEarned_amount());
            ps.setString(6, p.getPaid_status());
            ps.setInt(7, p.getParkingid());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }


    @Override
    public List<Parking> getAllParking() {
        List<Parking> parkingList = new ArrayList<>();

        try {
            String sql = "SELECT * FROM parking";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int parkingid = rs.getInt("parkingid");
                String vehicleNumber = rs.getString("vehicle_number");
                String vehicleType = rs.getString("vehicle_type");
                String slotName = rs.getString("slot_name");
                java.sql.Timestamp createdAt = rs.getTimestamp("created_at");
                java.sql.Timestamp updatedAt = rs.getTimestamp("updated_at");
                String earnedAmount = rs.getString("earned_amount");
                String paidStatus = rs.getString("paid_status");
                String phone = rs.getString("phone");

                Parking parking = new Parking(vehicleNumber, vehicleType, slotName,  createdAt, updatedAt, earnedAmount, paidStatus, phone);
                parking.setParkingid(parkingid);
                
                parkingList.add(parking);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return parkingList;
    }

    @Override
    public List<Parking> getAllParking(int offset, int limit) {
        List<Parking> parkingList = new ArrayList<>();

        try {
            String sql = "SELECT * FROM parking LIMIT ? OFFSET ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, limit);
            ps.setInt(2, offset);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int parkingid = rs.getInt("parkingid");
                String vehicleNumber = rs.getString("vehicle_number");
                String vehicleType = rs.getString("vehicle_type");
                String slotName = rs.getString("slot_name");
                java.sql.Timestamp createdAt = rs.getTimestamp("created_at");
                java.sql.Timestamp updatedAt = rs.getTimestamp("updated_at");
                String earnedAmount = rs.getString("earned_amount");
                String paidStatus = rs.getString("paid_status");
                String phone = rs.getString("phone");

                Parking parking = new Parking(vehicleNumber, vehicleType, slotName,  createdAt, updatedAt, earnedAmount, paidStatus, phone);
                parking.setParkingid(parkingid);

                parkingList.add(parking);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return parkingList;
    }

    @Override
    public int getTotalParkingCount() {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM parking";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    @Override
    public List<Parking> getParkingBySearchQuery(String searchQuery, int offset, int limit) {
        List<Parking> parkingList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM parking WHERE vehicle_number LIKE ? LIMIT ? OFFSET ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchQuery + "%");
            ps.setInt(2, limit);
            ps.setInt(3, offset);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int parkingid = rs.getInt("parkingid");
                String vehicleNumber = rs.getString("vehicle_number");
                String vehicleType = rs.getString("vehicle_type");
                String slotName = rs.getString("slot_name");
                java.sql.Timestamp createdAt = rs.getTimestamp("created_at");
                java.sql.Timestamp updatedAt = rs.getTimestamp("updated_at");
                String earnedAmount = rs.getString("earned_amount");
                String paidStatus = rs.getString("paid_status");
                String phone = rs.getString("phone");
                Parking parking = new Parking(vehicleNumber, vehicleType, slotName, createdAt, updatedAt, earnedAmount, paidStatus, phone);
                parking.setParkingid(parkingid);
                parkingList.add(parking);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return parkingList;
    }

    @Override
    public int getTotalParkingCountBySearchQuery(String searchQuery) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM parking WHERE vehicle_number LIKE ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchQuery + "%");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    

    @Override
    public Parking getParkingByVehicleNumberAndStatus(String vehicle_number, String status) {
        Parking parking = null;

        try {
            String sql = "SELECT * FROM parking WHERE vehicle_number=? AND paid_status=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, vehicle_number);
            ps.setString(2, status);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                parking = new Parking();
                parking.setParkingid(rs.getInt(1));
                parking.setVehicle_number(rs.getString(2));
                parking.setVehicle_type(rs.getString(3));
                parking.setSlot_name(rs.getString(4));
                parking.setPhone(rs.getString(5));
                parking.setCreated_at(rs.getTimestamp(6));
                parking.setUpdated_at(rs.getTimestamp(7));
                parking.setEarned_amount(rs.getString(8));
                parking.setPaid_status(rs.getString(9));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return parking;
    }

@Override
public Parking getParkingById(int id) {
    Parking parking = null;
    try {
        String sql = "SELECT * FROM parking WHERE parkingid=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            parking = new Parking();
            parking.setParkingid(rs.getInt("parkingid"));
            parking.setVehicle_number(rs.getString("vehicle_number"));
            parking.setVehicle_type(rs.getString("vehicle_type"));
            parking.setSlot_name(rs.getString("slot_name"));
            parking.setCreated_at(rs.getTimestamp("created_at"));
            parking.setUpdated_at(rs.getTimestamp("updated_at"));
            parking.setEarned_amount(rs.getString("earned_amount"));
            parking.setPaid_status(rs.getString("paid_status"));
            parking.setPhone(rs.getString("phone"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return parking;
}

@Override
public boolean deleteParking(int id) {
	boolean f = false;
	try {
		String sql = "DELETE FROM parking WHERE parkingid=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);

		int i = ps.executeUpdate();
		if (i == 1) {
			f = true;
		}

	} catch (Exception e) {
		e.printStackTrace();
	}
	return f;
}
@Override
public boolean updatePaymentStatus(int parkingId, String paymentMethod) {
    boolean f = false;
    try {
        String sql = "update parking set paid_status=? where parkingid=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, paymentMethod);
        ps.setInt(2, parkingId);

        int i = ps.executeUpdate();
        if (i == 1) {
            f = true;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return f;
}
}