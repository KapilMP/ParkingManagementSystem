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
import com.entity.Category;
@WebServlet("/add_category")
public class AddCategory extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
	    try {
	        String category_name = req.getParameter("cname");
	        String status = req.getParameter("status");
	        
	        // Check if either category name or status is empty
	        if(category_name == null || category_name.isEmpty() || status == null || status.isEmpty()) {
	            HttpSession session = req.getSession();
	            session.setAttribute("failedMsg", "Please fill up both Category Name and Status");
	            resp.sendRedirect("admin/add_category.jsp");
	            return; // Exit from the method to avoid further processing
	        }
	        // Check if status is valid (either "Active" or "Inactive")
	        if(!status.equals("Active") && !status.equals("Inactive")) {
	            HttpSession session = req.getSession();
	            session.setAttribute("failedMsg", "Invalid Category Status");
	            resp.sendRedirect("admin/add_category.jsp");
	            return; // Exit from the method to avoid further processing
	        }
	     // Check if the category with the same name already exists
	        CategoryDAOimpl dao = new CategoryDAOimpl(DBconnect.getConnection());
	        if (dao.getCategoryByName(category_name) != null) {
	            HttpSession session = req.getSession();
	            session.setAttribute("failedMsg", "Category with the same name already exists");
	            resp.sendRedirect("admin/add_category.jsp");
	            return; // Exit from the method to avoid further processing
	        }
	        
	        // Proceed with adding category if both fields are provided
	        Category c = new Category(category_name, status);
	        
	        CategoryDAOimpl dao1 = new CategoryDAOimpl(DBconnect.getConnection());
	        boolean f = dao1.addCategory(c);
	        
	        HttpSession session = req.getSession();
	        if(f) {
	            session.setAttribute("successMsg", "Category Added");
	            resp.sendRedirect("admin/add_category.jsp");
	            
	        }
	        else {
	            session.setAttribute("failedMsg", "Something went wrong on server");
	            resp.sendRedirect("admin/add_category.jsp");
	            
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}
