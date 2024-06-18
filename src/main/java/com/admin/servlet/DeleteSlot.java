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

@WebServlet("/delete")
public class DeleteSlot extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));

			SlotDAOimpl dao = new SlotDAOimpl(DBconnect.getConnection());
			boolean f = dao.deleteSlots(id);
			HttpSession session = req.getSession();

			if (f) {

				session.setAttribute("successMsg", "Slot Delete Successfully..");
				resp.sendRedirect("admin/manageSlot.jsp");
			} else {
				session.setAttribute("failedMsg", "Something went on server. Please Try again later!..");
				resp.sendRedirect("admin/manageSlot.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
