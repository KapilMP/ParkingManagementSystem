<%@page import="java.sql.Connection"%>
<%@page import="com.DAO.SlotDAO"%>
<%@page import="com.entity.Slots"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.SlotDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Manage Parking Slots</title>
<%@ include file="all_links.jsp"%>
</head>
<body style="background-color: #f0f1f2">
    <%@ include file="navbar.jsp"%>
    <!-- To make site secure, admin should login to access the page -->
    <c:if test="${empty userObj}">
        <c:redirect url="../login.jsp"></c:redirect>
    </c:if>
    <h3 class="text-center p-3">Hello Admin</h3>
    <!-- To display success or failed message  -->
    <c:if test="${not empty successMsg }">
        <h5 class="text-center text-info">${successMsg }</h5>
        <c:remove var="successMsg" scope="session" />
    </c:if>
    <c:if test="${not empty failedMsg }">
        <h5 class="text-center text-danger">${failedMsg }</h5>
        <c:remove var="failedMsg" scope="session" />
    </c:if>
    <form action="manageSlot.jsp" method="get" class="mb-3">
     <div class="row">
        <div class="col-md-4">
            <input type="text" name="search" class="form-control" placeholder="Search by Slot Name" value="${param.search}">
        </div>
        <div class="col-md-2">
            <button type="submit" class="btn btn-primary">Search</button>
        </div>
            <div class="col-md-2">
                <select name="resultsPerPage" class="form-control">
                    <option value="5" ${param.resultsPerPage == '5' ? 'selected' : ''}>5</option>
                    <option value="10" ${param.resultsPerPage == '10' ? 'selected' : ''}>10</option>
                    <option value="20" ${param.resultsPerPage == '20' ? 'selected' : ''}>20</option>
                    <option value="50" ${param.resultsPerPage == '50' ? 'selected' : ''}>50</option>
                    <option value="100" ${param.resultsPerPage == '100' ? 'selected' : ''}>100</option>
                </select>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary">Show Results</button>
            </div>
        </div>
    </form>

    <table class="table table-striped-columns">
        <thead class="table-primary">
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Slot Name</th>
                <th scope="col">Status</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
        int resultsPerPage = 10;
        int currentPage = 1;
        if (request.getParameter("resultsPerPage") != null) {
            resultsPerPage = Integer.parseInt(request.getParameter("resultsPerPage"));
        }
        if (request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }
        int offset = (currentPage - 1) * resultsPerPage;

        Connection conn = null;
        int totalPages = 0; // Initialize totalPages here

        try {
            conn = DBconnect.getConnection();
            SlotDAO dao = new SlotDAOimpl(conn);
            String search = request.getParameter("search");
            List<Slots> slotList;
            if (search != null && !search.isEmpty()) {
                slotList = dao.getAllSlots(offset, resultsPerPage, search);
            } else {
                slotList = dao.getAllSlots(offset, resultsPerPage);
            }
            int totalRecords = dao.getSlotCount();
            totalPages = (int) Math.ceil((double) totalRecords / resultsPerPage);

            for (Slots slot : slotList) {
                int id = slot.getId();
                String slotName = slot.getSlot_name();
                String status = slot.getAvailability_status();
    %>
            <tr>
                <td><%= id %></td>
                <td><%= slotName %></td>
                <td><%= status %></td>
                <td>
                    <a href="edit_slot.jsp?id=<%= id %>" class="btn btn-small btn-primary">
                        <i class="fa-solid fa-pen-to-square"></i> Edit
                    </a>
                    <a href="../deleteSlot?id=<%= id %>" class="btn btn-small btn-danger">
                        <i class="fa-solid fa-trash"></i> Delete
                    </a>
                </td>
            </tr>
            <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }
            }
            %>
        </tbody>
    </table>

    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <% if (currentPage > 1) { %>
                <li class="page-item">
                    <a class="page-link" href="manageSlot.jsp?page=<%= currentPage - 1 %>&resultsPerPage=<%= resultsPerPage %>" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            <% } %>
            <% for (int i = 1; i <= totalPages; i++) { %>
                <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
                    <a class="page-link" href="manageSlot.jsp?page=<%= i %>&resultsPerPage=<%= resultsPerPage %>"><%= i %></a>
                </li>
            <% } %>
            <% if (currentPage < totalPages) { %>
                <li class="page-item">
                    <a class="page-link" href="manageSlot.jsp?page=<%= currentPage + 1 %>&resultsPerPage=<%= resultsPerPage %>" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            <% } %>
        </ul>
    </nav>
</body>
</html>
