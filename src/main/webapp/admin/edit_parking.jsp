<%@page import="com.entity.Category"%>
<%@page import="com.DAO.CategoryDAOimpl"%>
<%@page import="com.entity.Parking"%>
<%@page import="com.DAO.ParkingDAOimpl"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Slots"%>
<%@page import="com.DAO.SlotDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Edit Parking</title>
<%@ include file="all_links.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@ include file="navbar.jsp"%>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Parking</h4>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						ParkingDAOimpl dao = new ParkingDAOimpl(DBconnect.getConnection());
						Parking p = dao.getParkingById(id);
						%>
						<%
						int id2 = Integer.parseInt(request.getParameter("id"));
						CategoryDAOimpl dao2 = new CategoryDAOimpl(DBconnect.getConnection());
						Category c = dao2.getCategoryById(id);
						
						%>
						<form action="../editParking" method="post">
							<input type="hidden" name="id" value="<%= p.getParkingid() %>">
							
							<div class="mb-3 from-group">
								<label for="vehicleRegHourly">Vehicle Number*</label> 
								<input name="vehicleRegHourly" type="text" class="form-control" id="vehicleRegHourly" value="<%= p.getVehicle_number() %>">
							</div>
							
							
								<div class="mb-3 form-group">
								<label for="vehicleTypeHourly"> Vehicle Type*</label> <select
									id="vehicleTypeHourly" name="vehicleTypeHourly" class="form-control">
									<%
									if ("Bike".equals(p.getVehicle_type())) {
									%>
									<option value="Bike">Bike</option>
									<option value="Car">Car</option>
									<%
									} else {
									%>
									<option value="Car">Car</option>
									<option value="Bike">Bike</option>
									<%
									}
									%>
								</select>
							</div>

							<div class="mb-3 form-group">
								<label for="slotHourly">Slot*</label> 
								<select id="slotHourly" name="slotHourly" class="form-control">
									<%
									SlotDAOimpl slotDAO = new SlotDAOimpl(DBconnect.getConnection());
									List<Slots> slots = slotDAO.getAllSlots();
									for (Slots slot : slots) {
									%>
									<option value="<%= slot.getSlot_name() %>" <%= slot.getSlot_name().equals(p.getSlot_name()) ? "selected" : "" %>><%= slot.getSlot_name() %></option>
									<%
									}
									%>
								</select>
							</div>

							<div class="mb-3 from-group">
								<label for="phone">Phone*</label> 
								<input name="phone" type="text" class="form-control" id="phone" value="<%= p.getPhone() %>">
							</div>
							
							<div class="mb-3 from-group">
								<label for="earnedAmount">Earned Amount</label> 
								<input name="earnedAmount" type="text" class="form-control" id="earnedAmount" value="<%= p.getEarned_amount() %>">
							</div>
							
							<div class="mb-3 from-group">
								<label for="paidStatus">Paid Status</label> 
								<select id="paidStatus" name="paidStatus" class="form-control">
									<option value="unpaid" <%= "unpaid".equals(p.getPaid_status()) ? "selected" : "" %>>Unpaid</option>
									<option value="cash" <%= "cash".equals(p.getPaid_status()) ? "selected" : "" %>>Cash</option>
									<option value="ebank" <%= "ebank".equals(p.getPaid_status()) ? "selected" : "" %>>E-banking</option>
									<option value="card" <%= "card".equals(p.getPaid_status()) ? "selected" : "" %>>Card</option>
								</select>
							</div> 

							<div>
								<button type="submit" class="btn btn-primary">Update</button>
								<a href="parkingManage.jsp" class="btn btn-warning">Manage</a>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
