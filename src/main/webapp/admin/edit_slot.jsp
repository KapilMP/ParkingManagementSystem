<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.SlotDAOimpl"%>
<%@page import="com.entity.Slots"%>
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
	<%@ include file="navbar.jsp"%>

	<div class="container">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Parking Slots</h4>
					
						

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						SlotDAOimpl dao = new SlotDAOimpl(DBconnect.getConnection());
						Slots s = dao.getSlotById(id);
						
						%>


						<form action="../editSlots" method="post">
                            <input type="hidden" name="id" value="<%=s.getId()%>">

							<div class="mb-3 from-group">
								<label for="exampleInputEmail1">Slot Name*</label> <input
									name="sname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedy="emailHelp"
									value="<%=s.getSlot_name() %>">
							</div>

							<div class="mb-3 form-group">
								<label for="inputState"> Slot Status*</label> <select
									id="inputState" name="status" class="form-control">
									<%
									if ("Available".equals(s.getAvailability_status())) {
									%>
									<option value="Available">Available</option>
									<option value="Occupied">Occupied</option>
									<%
									} else {
									%>
									<option value="Occupied">Occupied</option>
									<option value="Available">Available</option>
									<%
									}
									%>


								</select>
							</div>
							<div>
								<button type="submit" class="btn btn-primary">Update</button>

							</div>

						</form>
						

					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
