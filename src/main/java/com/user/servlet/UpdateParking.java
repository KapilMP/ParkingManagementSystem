package com.user.servlet;

import java.io.IOException;
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
import com.DB.DBconnect;
import com.entity.Parking;

@WebServlet("/updateParking")
public class UpdateParking extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        try {
            String vehicle_number = req.getParameter("vehicleRegExit");
            String phone = req.getParameter("phone");

            // Validate vehicle number format
            if (!vehicle_number.matches("^BA\\s\\d{4}$")) {
                session.setAttribute("failedMsg", "Invalid vehicle number format. Please enter a valid Kathmandu vehicle number.");
                resp.sendRedirect("User/vehicleOut.jsp");
                return;
            }

            // Validate phone number format
            if (!phone.matches("^(98|97|95)\\d{8}$")) {
                session.setAttribute("failedMsg", "Invalid phone number format. Please enter a valid phone number.");
                resp.sendRedirect("User/vehicleOut.jsp");
                return;
            }

            Timestamp updated_at = Timestamp.from(Instant.now());

            ParkingDAO dao = new ParkingDAOimpl(DBconnect.getConnection());
            Parking parking = dao.getParkingByVehicleNumber(vehicle_number);

            if (parking != null) {
                // Check if phone number matches
                if (!parking.getPhone().equals(phone)) {
                    session.setAttribute("failedMsg", "The phone number does not match the one associated with the vehicle number.");
                    resp.sendRedirect("User/vehicleOut.jsp");
                    return;
                }

                long durationInMillis = updated_at.getTime() - parking.getCreated_at().getTime();
                long durationInHours = (durationInMillis / (1000 * 60 * 60)) + 1; // rounding up to the next hour

                // Adjust the hourly rate based on vehicle type
                int hourlyRate = 0;
                if (parking.getVehicle_type().equalsIgnoreCase("car")) {
                    hourlyRate = 25;
                } else if (parking.getVehicle_type().equalsIgnoreCase("bike")) {
                    hourlyRate = 20;
                } else {
                    // Default rate if vehicle type is not recognized
                    hourlyRate = 20;
                }

                String earned_amount = String.valueOf(durationInHours * hourlyRate);

                parking.setUpdated_at(updated_at);
                parking.setEarned_amount(earned_amount);
                parking.setPaid_status("unpaid");

                boolean updateParkingStatus = dao.updateParking(parking);

                if (updateParkingStatus) {
                    session.setAttribute("parking", parking);
                    resp.sendRedirect("User/payment.jsp");
                } else {
                    session.setAttribute("failedMsg", "Failed to update parking details.");
                    resp.sendRedirect("User/vehicleOut.jsp");
                }
            } else {
                session.setAttribute("failedMsg", "Parking details not found for the provided vehicle number.");
                resp.sendRedirect("User/vehicleOut.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("failedMsg", "An error occurred while processing your request.");
            resp.sendRedirect("User/vehicleOut.jsp");
        }
    }
}
