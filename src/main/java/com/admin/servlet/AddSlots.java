// Parking slots represent individual spaces within a parking area where vehicles can be parked.

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

@WebServlet("/add_pSlots")
//@MultipartConfig //for image
public class AddSlots extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// Get admin input
			String slot_name = req.getParameter("sname");
			String availability_status = req.getParameter("status");
			
			 // Check if any required field is empty or if the amount is not a number
            if (slot_name == null || slot_name.isEmpty() || availability_status == null || availability_status.isEmpty()
                   ) {
                HttpSession session = req.getSession();
                session.setAttribute("failedMsg", "Please fill up every field with valid data");
                resp.sendRedirect("admin/add_pSlots.jsp");
                return; // Exit from the method to avoid further processing
            }
            // Check if status is valid (either "Available" or "Occupied")
	        if(!availability_status.equals("Available") && !availability_status.equals("Occupied")) {
	            HttpSession session = req.getSession();
	            session.setAttribute("failedMsg", "Invalid Slot Status");
	            resp.sendRedirect("admin/add_pSlots.jsp");
	            return; // Exit from the method to avoid further processing
	        }

	     // Check if the slot with the same name already exists
	       SlotDAOimpl dao = new SlotDAOimpl(DBconnect.getConnection());
	        if (dao.getSlotByName(slot_name) != null) {
	            HttpSession session = req.getSession();
	            session.setAttribute("failedMsg", "Slot with the same name already exists");
	            resp.sendRedirect("admin/add_pSlots.jsp");
	            return; // Exit from the method to avoid further processing
	        }

			// Create Slots object
			Slots s = new Slots(slot_name, availability_status); // entity package object
			/* System.out.println(s); */

			// after data is set we store the value
			SlotDAOimpl dao1 = new SlotDAOimpl(DBconnect.getConnection());

			boolean f = dao1.addSlot(s);

			HttpSession session = req.getSession();

			if (f) {

				session.setAttribute("successMsg", "Slot Added Sucessfully");
				resp.sendRedirect("admin/add_pSlots.jsp");
			} else {
				session.setAttribute("failedMsg", "Something wrong in server");
				resp.sendRedirect("admin/add_pSlots.jsp");

			}
			
		} catch (Exception e) {
			// Log any exceptions
			e.printStackTrace();
		}
		
		


	}

}
