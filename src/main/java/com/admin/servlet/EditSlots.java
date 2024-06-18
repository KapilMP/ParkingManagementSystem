package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.SlotDAOimpl;
import com.DB.DBconnect;
import com.entity.Slots;
@WebServlet("/editSlots")
public class EditSlots extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String slot_name = req.getParameter("sname");
            String availability_status = req.getParameter("status");
            
            // Check if the slot name is different from the existing one in the database
            SlotDAOimpl dao = new SlotDAOimpl(DBconnect.getConnection());
            Slots existingSlot = dao.getSlotById(id);
            Slots existingSlotByName = dao.getSlotByName(slot_name);
            
            if (existingSlot != null && (existingSlotByName == null || existingSlotByName.getId() == id)) {
                // Slot name has been changed and it doesn't conflict with existing names, proceed with the update
                Slots s = new Slots();
                s.setId(id);
                s.setSlot_name(slot_name);
                s.setAvailability_status(availability_status);
                
                boolean f = dao.updateSlots(s);
                
                HttpSession session = req.getSession();
                
                if(f) {
                    session.setAttribute("successMsg", "Updated Successfully..");
                    resp.sendRedirect("admin/manageSlot.jsp");
                } else {
                    session.setAttribute("failedMsg", "Something went on server. Please Try again later!..");
                    resp.sendRedirect("admin/manageSlot.jsp");
                }
            } else {
                // Slot name either remains the same or conflicts with existing names, show error message
                HttpSession session = req.getSession();
                session.setAttribute("failedMsg", "Slot name must be different and unique.");
                resp.sendRedirect("admin/manageSlot.jsp");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
