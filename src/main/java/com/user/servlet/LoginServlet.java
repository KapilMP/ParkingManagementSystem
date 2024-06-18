package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;


import com.DAO.UserDAOimpl;
import com.DB.DBconnect;



@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UserDAOimpl dao = new UserDAOimpl(DBconnect.getConnection());
            HttpSession session = req.getSession();

            String email = req.getParameter("email");
            String password = req.getParameter("password");

            // Check if the user is admin
            if ("admin@gmail.com".equals(email) && "admin123".equals(password)) {
                // Set userObj attribute for admin
                User user = new User();
                user.setName("Admin");
                user.setRole("admin"); // Set the role attribute for admin
                session.setAttribute("userObj", user);
                resp.sendRedirect("admin/home.jsp");
            } else {
                // For regular users
                User user = dao.login(email, password);
                if (user != null) {
                    session.setAttribute("userObj", user); // Set userObj attribute in the session
                    session.setAttribute("role", "regular"); // Set the role attribute for regular user
                    resp.sendRedirect("home.jsp"); // Redirect to home.jsp
                } else {
                    session.setAttribute("failedMsg", "Check your email or password");
                    resp.sendRedirect("login.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}