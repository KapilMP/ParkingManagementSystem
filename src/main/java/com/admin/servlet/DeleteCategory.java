package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CategoryDAOimpl;
import com.DB.DBconnect;

@WebServlet("/deleteCategory")
public class DeleteCategory extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));

			CategoryDAOimpl dao = new CategoryDAOimpl(DBconnect.getConnection());
			boolean f = dao.deleteCategory(id);
			HttpSession session = req.getSession();

			if (f) {

				session.setAttribute("successMsg", "Category Delete Successfully..");
				resp.sendRedirect("admin/manageCategory.jsp");
			} else {
				session.setAttribute("failedMsg", "Something went on server. Please Try again later!..");
				resp.sendRedirect("admin/manageCategory.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
