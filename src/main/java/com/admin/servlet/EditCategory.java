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

@WebServlet("/editCategory")
public class EditCategory extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String category_name = req.getParameter("cname");
            String status = req.getParameter("status");
            
            // Check if the category name is different from the existing one in the database
            CategoryDAOimpl dao = new CategoryDAOimpl(DBconnect.getConnection());
            Category existingCategory = dao.getCategoryById(id);
            Category existingCategoryByName = dao.getCategoryByName(category_name);
            
            if (existingCategory != null && (existingCategoryByName == null || existingCategoryByName.getId() == id)) {
                // Category name has been changed and it doesn't conflict with existing names, proceed with the update
                Category c = new Category();
                c.setId(id);
                c.setCategory_name(category_name);
                c.setStatus(status);
                
                boolean f = dao.updateCategory(c);
                
                HttpSession session = req.getSession();
                
                if(f) {
                    session.setAttribute("successMsg", "Updated Successfully..");
                    resp.sendRedirect("admin/manageCategory.jsp");
                } else {
                    session.setAttribute("failedMsg", "Something went wrong on the server. Please try again later!..");
                    resp.sendRedirect("admin/manageCategory.jsp");
                }
            } else {
                // Category name either remains the same or conflicts with existing names, show error message
                HttpSession session = req.getSession();
                session.setAttribute("failedMsg", "Category name must be different and unique.");
                resp.sendRedirect("admin/manageCategory.jsp");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
