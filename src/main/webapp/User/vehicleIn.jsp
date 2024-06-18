<%@page import="com.entity.Slots"%>
<%@page import="com.DAO.SlotDAOimpl"%>
<%@page import="com.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.CategoryDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Parking Form</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f7f7f7;
}

.form-section {
	display: block;
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}

.form-header {
	margin-bottom: 20px;
	color: #00695c;
}

.form-footer {
	margin-top: 20px;
	color: #00695c;
}

.btn-primary {
	background-color: #00695c;
	border-color: #00695c;
}

.btn-primary:hover {
	background-color: #004d40;
	border-color: #004d40;
}

.highlight-text {
	color: #d9534f;
	font-weight: bold;
}

.slot-table {
	width: 100%;
	margin-bottom: 20px;
	border-collapse: collapse;
}

.slot-table th, .slot-table td {
	border: 1px solid #ddd;
	padding: 8px;
}

.slot-table th {
	background-color: #f2f2f2;
	text-align: center;
}

.slot-available {
	background-color: #d4edda;
	color: #155724;
}

.slot-occupied {
	background-color: #f8d7da;
	color: #721c24;
}
</style>
</head>
<body>
	<div class="container mt-5">
		<h1 class="form-header text-center">Parking Form</h1>
		<div class="form-section">
			<h2 class="text-center highlight-text">Hourly Parking</h2>
			<form action="../addParking" method="post">

				<c:if test="${not empty successMsg }">
					<h5 class="text-center text-info">${successMsg }</h5>
					<c:remove var="successMsg" scope="session" />
				</c:if>

				<c:if test="${not empty failedMsg }">
					<h5 class="text-center text-danger">${failedMsg }</h5>
					<c:remove var="failedMsg" scope="session" />
				</c:if>
				<div class="mb-3">
					<label for="vehicleRegHourly" class="form-label">Vehicle
						Registration</label> <input type="text" class="form-control"
						id="vehicleRegHourly" name="vehicleRegHourly" required>
				</div>
				<div class="mb-3">
					<label for="phone" class="form-label">Phone Number</label> <input
						type="text" class="form-control" id="phone" name="phone" required
						pattern="^(98|97|95)\d{8}$"
						title="Phone number must start with 98, 97, or 95 and followed by 8 other digits.">
				</div>

				<div class="mb-3 form-group">
					<label for="inputCategory">Category*</label> <select
						id="inputCategory" name="vehicleTypeHourly" class="form-control">
						<option selected>--select--</option>
						<%
						CategoryDAOimpl categoryDAO = new CategoryDAOimpl(DBconnect.getConnection());
						List<Category> categories = categoryDAO.getAllCategories();
						for (Category category : categories) {
						%>
						<option value="<%=category.getCategory_name()%>"><%=category.getCategory_name()%></option>
						<%
						}
						%>
					</select>
				</div>
				<div class="mb-3 form-group">
					<label for="inputSlot">Slot*</label> <select id="inputSlot"
						name="slotHourly" class="form-control">
						<option selected>--select--</option>
						<%
						SlotDAOimpl slotDAO = new SlotDAOimpl(DBconnect.getConnection());
						List<Slots> slots = slotDAO.getAllSlots();
						for (Slots s : slots) {
						%>
						<option value="<%=s.getSlot_name()%>"
							class="<%=s.getAvailability_status().equals("Occupied") ? "slot-occupied" : "slot-available"%>">
							<%=s.getSlot_name()%> -
							<%=s.getAvailability_status()%>
						</option>
						<%
						}
						%>
					</select>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
				<a href="../home.jsp" class="btn btn-warning">Back</a> 
			</form>
			<div class="form-footer text-center mt-3">
				<p>
					Please note: This form is for <span class="highlight-text">hourly
						parking</span> only.
				</p>
			</div>
		</div>
		<%-- <div class="form-section">
			<h2 class="text-center">Current Slot Status</h2>
			<table class="slot-table">
				<thead>
					<tr>
						<th>Slot Name</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Slots s : slots) {
					%>
					<tr
						class="<%=s.getAvailability_status().equals("Occupied") ? "slot-occupied" : "slot-available"%>">
						<td><%=s.getSlot_name()%></td>
						<td><%=s.getAvailability_status()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div> --%>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>
