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

@WebServlet("/processPayment")
public class ProcessPayment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Parking parking = (Parking) session.getAttribute("parking");

            if (parking == null) {
                session.setAttribute("failedMsg", "Parking details not found.");
                response.sendRedirect("User/payment.jsp");
                return;
            }

            String paymentMethod = request.getParameter("paymentMethod");

            ParkingDAOimpl dao = new ParkingDAOimpl(DBconnect.getConnection());
            parking.setPaid_status("paid"); // Set the paid status
            boolean success = dao.updatePaymentStatus(parking.getParkingid(), paymentMethod);

            if (success) {
                SlotDAOimpl slotDAO = new SlotDAOimpl(DBconnect.getConnection());
                slotDAO.updateSlotStatus(parking.getSlot_name(), "Available");

                session.setAttribute("successMsg", "Payment processed successfully. Slot is now available.");
                response.sendRedirect("User/payment.jsp");
            } else {
                session.setAttribute("failedMsg", "Payment processing failed.");
                response.sendRedirect("User/payment.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("failedMsg", "An error occurred while processing your request.");
            response.sendRedirect("User/payment.jsp");
        }
    }
}
