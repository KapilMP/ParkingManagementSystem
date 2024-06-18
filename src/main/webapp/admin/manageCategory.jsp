<%@page import="com.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.CategoryDAOimpl"%>
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
				<th scope="col">Category Name</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>

			</tr>
		</thead>
		<tbody>
			<%
			CategoryDAOimpl dao = new CategoryDAOimpl(DBconnect.getConnection());
			List<Category> list = dao.getAllCategories2();
			for (Category s : list) {
			%>
			<tr>
				<td><%=s.getId()%></td>
				<td><%=s.getCategory_name()%></td>
				<td><%=s.getStatus()%></td>

				<td><a href="edit_category.jsp?id=<%=s.getId()%>" class="btn btn-small btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
				 <a href="../deleteCategory?id=<%=s.getId() %>" class="btn btn-small btn-danger"><i class="fa-solid fa-trash"></i> Delete</a></td>
			</tr>
			<%
			}
			%>



		</tbody>
	</table>

</body>
</html>
