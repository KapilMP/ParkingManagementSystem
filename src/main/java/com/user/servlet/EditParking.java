package com.user.servlet;

import java.io.IOException;

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

@WebServlet("/editParking")
public class EditParking extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String vehicle_number = req.getParameter("vehicleRegHourly");
            String vehicle_type = req.getParameter("vehicleTypeHourly");
            String slot_name = req.getParameter("slotHourly");
            String phone = req.getParameter("phone");
            String earned_amount = req.getParameter("earnedAmount");
            String paid_status = req.getParameter("paidStatus");

            // Validate vehicle number format
            if (vehicle_number == null || !vehicle_number.matches("^BA\\s\\d{4}$")) {
                session.setAttribute("failedMsg", "Invalid vehicle number format. Please enter a valid Kathmandu vehicle number.");
                resp.sendRedirect("admin/parkingManage.jsp");
                return;
            }

            // Validate phone number format
            if (phone == null || !phone.matches("^(98|97|95)\\d{8}$")) {
                session.setAttribute("failedMsg", "Invalid phone number format. Please enter a valid phone number.");
                resp.sendRedirect("admin/parkingManage.jsp");
                return;
            }

            // Check if all required fields are filled
            if (vehicle_number.isEmpty() || vehicle_type == null || vehicle_type.isEmpty() || slot_name == null || slot_name.isEmpty() || phone.isEmpty()) {
                session.setAttribute("failedMsg", "Please fill up every field with valid data.");
                resp.sendRedirect("admin/parkingManage.jsp");
                return;
            }

            ParkingDAO dao = new ParkingDAOimpl(DBconnect.getConnection());
            Parking existingParking = dao.getParkingById(id);
            Parking existingParkingByName = dao.getParkingByVehicleNumber(vehicle_number);

            // Check if the slot is already occupied
            SlotDAOimpl slotDao = new SlotDAOimpl(DBconnect.getConnection());
            Slots slot = slotDao.getSlotByName(slot_name);
            if (slot == null || ("Occupied".equals(slot.getAvailability_status()) && !slot.getSlot_name().equals(existingParking.getSlot_name()))) {
                session.setAttribute("failedMsg", "The selected slot is already occupied.");
                resp.sendRedirect("admin/parkingManage.jsp");
                return;
            }

            if (existingParking != null && (existingParkingByName == null || existingParkingByName.getParkingid() == id)) {
                // Retain the original value of paid_status if it is not provided
                if (paid_status == null || paid_status.isEmpty()) {
                    paid_status = existingParking.getPaid_status();
                }

                // Update the slot status if it has changed
                if (!existingParking.getSlot_name().equals(slot_name)) {
                    Slots previousSlot = slotDao.getSlotByName(existingParking.getSlot_name());
                    previousSlot.setAvailability_status("Available");
                    slotDao.updateSlots(previousSlot);

                    slot.setAvailability_status("Occupied");
                    slotDao.updateSlots(slot);
                }

                // Proceed with the update
                existingParking.setVehicle_number(vehicle_number);
                existingParking.setVehicle_type(vehicle_type);
                existingParking.setSlot_name(slot_name);
                existingParking.setPhone(phone);
                existingParking.setEarned_amount(earned_amount);
                existingParking.setPaid_status(paid_status);

                boolean updateStatus = dao.updateParking(existingParking);

                if (updateStatus) {
                    session.setAttribute("successMsg", "Updated Successfully.");
                } else {
                    session.setAttribute("failedMsg", "Something went wrong on the server. Please try again later.");
                }
            } else {
                session.setAttribute("failedMsg", "Vehicle number must be unique.");
            }
            resp.sendRedirect("admin/parkingManage.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("failedMsg", "An error occurred while processing your request.");
            resp.sendRedirect("admin/parkingManage.jsp");
        }
    }
}
