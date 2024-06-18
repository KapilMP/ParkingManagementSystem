package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ParkingDAOimpl;
import com.DAO.SlotDAOimpl;
import com.DB.DBconnect;
import com.entity.Parking;
import com.entity.Slots;

@WebServlet("/deleteParking")
public class DeleteParking extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        try {
            int id = Integer.parseInt(req.getParameter("id"));

            ParkingDAOimpl dao = new ParkingDAOimpl(DBconnect.getConnection());
            Parking parking = dao.getParkingById(id); // Assume this method exists in ParkingDAOimpl
            boolean f = dao.deleteParking(id);

            if (f && parking != null) {
                SlotDAOimpl slotDao = new SlotDAOimpl(DBconnect.getConnection());
                Slots slot = slotDao.getSlotByName(parking.getSlot_name());
                if (slot != null) {
                    slot.setAvailability_status("Available");
                    slotDao.updateSlots(slot);
                }

                session.setAttribute("successMsg", "Parking record deleted and slot updated successfully.");
            } else {
                session.setAttribute("failedMsg", "Failed to delete parking record or update slot.");
            }
            resp.sendRedirect("admin/parkingManage.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("failedMsg", "An error occurred while processing your request.");
            resp.sendRedirect("admin/parkingManage.jsp");
        }
    }
}
