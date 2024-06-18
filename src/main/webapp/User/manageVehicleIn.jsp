<%@page import="com.entity.Parking"%>
<%@page import="com.DAO.ParkingDAOimpl"%>
<%@page import="com.entity.Slots"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.SlotDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Add Parking Slots</title>
<%@ include file="all_links.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@ include file="../admin/navbar.jsp"%>
	<!-- To make site secure, admin should login to access the page -->
	<c:if test="${empty userObj}">
		<c:redirect url="../login.jsp"></c:redirect>

	</c:if>
	<h3 class="text-center p-3">Hello Admin</h3>
	<!-- To display success of failed message  -->
	<c:if test="${not empty successMsg }">
		<h5 class="text-center text-info">${successMsg }</h5>
		<c:remove var="successMsg" scope="session" />

	</c:if>

	<c:if test="${not empty failedMsg }">
		<h5 class="text-center text-danger">${failedMsg }</h5>
		<c:remove var="failedMsg" scope="session" />

	</c:if>


	<table class="table table-striped-columns">
		<thead class="table-primary">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Vehicle Number</th>
				<th scope="col">Vehicle Type</th>
				<th scope="col">Slot Name</th>
				<th scope="col">Entry Time</th>


			</tr>
		</thead>
		<tbody>
			<%
			ParkingDAOimpl dao = new ParkingDAOimpl(DBconnect.getConnection());
			List<Parking> list = dao.getAllParking();
			for (Parking p : list) {
			%>
			<tr>
				<td><%=p.getParkingid()%></td>
				<td><%=p.getVehicle_number()%></td>
				<td><%=p.getVehicle_type()%></td>
				<td><%=p.getSlot_name()%></td>			
				<td><%=p.getCreated_at()%></td>



			</tr>
			<%
			}
			%>



		</tbody>
	</table>

</body>
</html>
