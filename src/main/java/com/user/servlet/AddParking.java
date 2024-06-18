package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Timestamp;
import java.time.Instant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ParkingDAO;
import com.DAO.ParkingDAOimpl;
import com.DAO.SlotDAOimpl;
import com.DB.DBconnect;
import com.entity.Parking;
import com.entity.Slots;

@WebServlet("/addParking")
public class AddParking extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Connection connection = DBconnect.getConnection();
        
        try {
            String vehicle_number = req.getParameter("vehicleRegHourly");
            String vehicle_type = req.getParameter("vehicleTypeHourly");
            String slot_name = req.getParameter("slotHourly");
            String phone = req.getParameter("phone");
            String paid_status = "unpaid"; // Default status

            // Validate vehicle number format
            if (!vehicle_number.matches("^BA\\s\\d{4}$")) {
                session.setAttribute("failedMsg", "Invalid vehicle number format. Please enter a valid Kathmandu vehicle number.");
                resp.sendRedirect("User/vehicleIn.jsp");
                return;
            }

            // Validate phone number format
            if (!phone.matches("^(98|97|95)\\d{8}$")) {
                session.setAttribute("failedMsg", "Invalid phone number format. Please enter a valid phone number.");
                resp.sendRedirect("User/vehicleIn.jsp");
                return;
            }

            // Check if any required field is empty
            if (vehicle_number.isEmpty() || vehicle_type.isEmpty() || slot_name.isEmpty() || phone.isEmpty()) {
                session.setAttribute("failedMsg", "Please fill up every field with valid data.");
                resp.sendRedirect("User/vehicleIn.jsp");
                return;
            }

            // Check if the selected slot is already occupied
            SlotDAOimpl slotDao = new SlotDAOimpl(connection);
            Slots slot = slotDao.getSlotByName(slot_name);
            if (slot == null || "Occupied".equals(slot.getAvailability_status())) {
                session.setAttribute("failedMsg", "The selected slot is already occupied.");
                resp.sendRedirect("User/vehicleIn.jsp");
                return;
            }

            // Check if vehicle number already exists with unpaid status
            ParkingDAO parkingDao = new ParkingDAOimpl(connection);
            Parking existingParking = parkingDao.getParkingByVehicleNumberAndStatus(vehicle_number, "unpaid");
            if (existingParking != null) {
                session.setAttribute("failedMsg", "Vehicle number already exists in the parking database.");
                resp.sendRedirect("User/vehicleIn.jsp");
                return;
            }

            // Update the slot status to "Occupied"
            slot.setAvailability_status("Occupied");
            boolean updateStatus = slotDao.updateSlots(slot);

            if (!updateStatus) {
                session.setAttribute("failedMsg", "Something went wrong on the server.");
                resp.sendRedirect("User/vehicleIn.jsp");
                return;
            }

            // Add new parking details
            Timestamp created_at = Timestamp.from(Instant.now());
            Parking parking = new Parking(vehicle_number, vehicle_type, slot_name, created_at, null, null, paid_status, phone);
            boolean addParkingStatus = parkingDao.addParking(parking);

            if (addParkingStatus) {
                session.setAttribute("successMsg", "Parking details added successfully.");
            } else {
                session.setAttribute("failedMsg", "Something went wrong. Please try again.");
            }
            resp.sendRedirect("User/vehicleIn.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("failedMsg", "An error occurred while processing your request.");
            resp.sendRedirect("User/vehicleIn.jsp");
        }
    }
}
