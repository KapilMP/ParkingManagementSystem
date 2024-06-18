<%@page import="com.entity.Category"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.CategoryDAOimpl"%>
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
	<%@ include file="navbar.jsp"%>

	<div class="container">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Parking Category</h4>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						CategoryDAOimpl dao = new CategoryDAOimpl(DBconnect.getConnection());
						Category c = dao.getCategoryById(id);
						
						%>
						
						
						
						<form action="../editCategory" method="post">
						<input type="hidden" name="id" value="<%=c.getId()%>">


							<div class="mb-3 from-group">
								<label for="exampleInputEmail1">Category Name*</label> <input
									name="cname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedy="emailHelp" value="<%=c.getCategory_name()%>">
							</div>

							<div class="mb-3 form-group">
								<label for="inputState"> Category Status*</label> <select
									id="inputState" name="status" class="form-control">
									<%
									if ("Active".equals(c.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
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
