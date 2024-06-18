package com.user.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ParkingDAO;
import com.DAO.ParkingDAOimpl;
import com.DB.DBconnect;
import com.entity.Parking;

@WebServlet("/parkingManage")
public class ParkingManageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        int recordsPerPage = 5;
        
        if(request.getParameter("page") != null)
            page = Integer.parseInt(request.getParameter("page"));
        
        if(request.getParameter("recordsPerPage") != null)
            recordsPerPage = Integer.parseInt(request.getParameter("recordsPerPage"));

        ParkingDAO dao = new ParkingDAOimpl(DBconnect.getConnection());
        List<Parking> list = dao.getAllParking((page-1)*recordsPerPage, recordsPerPage);
        int noOfRecords = dao.getTotalParkingCount();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        request.setAttribute("parkingList", list);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("recordsPerPage", recordsPerPage);
        
        request.getRequestDispatcher("Admin/parkingManage.jsp").forward(request, response);
    }
}
