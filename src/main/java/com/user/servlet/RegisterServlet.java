package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//classes for handling servlets and HTTP requests and responses.
import com.DAO.UserDAOimpl;
import com.DB.DBconnect;
import com.entity.User;

import javax.servlet.http.HttpSession;

import javax.servlet.annotation.WebServlet;

//It maps the servlet to the URL pattern "/register" i.e servlet will handle requests coming to /register
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
			
			//TO GET USER INPUT FROM REGISTER FORM
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");
			String loginName = req.getParameter("loginName");
			String checkBox = req.getParameter("check");
			
			 UserDAOimpl dao = new UserDAOimpl(DBconnect.getConnection());

            HttpSession session = req.getSession();
            boolean error = false;
			
            if (name.length() < 4 || name.length() > 40 || name.matches(".*\\d.*")) {
                session.setAttribute("errorMsg", "Your name must be between 4 to 40 characters and should not contain numbers.");
                error = true;
            }
            // Validate email is not admin@gmail.com
            if (email.equalsIgnoreCase("admin@gmail.com")) {
                session.setAttribute("errorMsg", "This email is not allowed.");
                error = true;
            }
            // Validate existing email
            if (dao.checkExistingEmail(email)) {
                session.setAttribute("errorMsg", "Email already exists.");
                error = true;
            }

         // Validate login name length and absence of numbers
            if (loginName.length() < 4 || loginName.length() > 20 || loginName.matches(".*\\d.*")) {
                session.setAttribute("errorMsg", "Login name must be between 4 to 20 characters and should not contain numbers.");
                error = true;
            }

            // Validate password length
            if (password.length() < 8) {
                session.setAttribute("errorMsg", "Password must be at least 8 characters long.");
                error = true;
            }
            // Validate existing phone number
            if (dao.checkExistingPhone(phone)) {
                session.setAttribute("errorMsg", "Phone number already exists.");
                error = true;
            }

            // Validate name length
            if (name.length() < 4) {
                session.setAttribute("errorMsg", "Name must be at least 4 characters long.");
                error = true;
            }

            // Validate phone number format
            if (!phone.matches("(98|97|96|94)\\d{8}")) {
                session.setAttribute("errorMsg", "Invalid phone number format.");
                error = true;
            }

         // Validate existing loginName
            if (dao.checkExistingLoginName(loginName)) {
                session.setAttribute("errorMsg", "Login name already exists.");
                error = true;
            }


            if (error) {
                resp.sendRedirect("register.jsp");
                return;
            }
//These lines create a new User object and set its attributes using the values retrieved from the form parameters.
		
			
			
			
			
			if (checkBox != null) {
				 User user = new User();
	                user.setName(name);
	                user.setEmail(email);
	                user.setPhone(phone);
	                user.setPassword(password);
	                user.setLoginName(loginName);

	                boolean f = dao.userRegister(user);
				
				if(f) {
					//System.out.println("User Register Sucessfully");
					session.setAttribute ("successMsg", "User Register Sucessfully");
					resp.sendRedirect("register.jsp");
				}
				else {
					//System.out.println("Something went wrong on server");
					session.setAttribute ("errorMsg", "Something went wrong on server");
					resp.sendRedirect("register.jsp");
				}
				
			} else {
				//System.out.println("Please Check Agree Terms and Conditions");
				session.setAttribute ("errorMsg", "Please Check Terms and Conditions");
				resp.sendRedirect("register.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
