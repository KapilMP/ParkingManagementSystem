package com.DAO;

import java.util.List;

import com.entity.Category;
import com.entity.Parking;

public interface ParkingDAO {

    public boolean addParking(Parking p);

    public Parking getParkingByVehicleNumber(String vehicle_number);
    public Parking getParkingById(int id);
    public boolean updateParking(Parking p);
    public List<Parking> getAllParking();
    public List<Parking> getAllParking(int offset, int limit);
    public int getTotalParkingCount();
    
    public List<Parking> getParkingBySearchQuery(String searchQuery, int offset, int limit);
    public int getTotalParkingCountBySearchQuery(String searchQuery);
    
    public Parking getParkingByVehicleNumberAndStatus(String vehicle_number, String status);
    public boolean deleteParking(int id);
    public boolean updatePaymentStatus(int parkingId, String paymentMethod);
}
