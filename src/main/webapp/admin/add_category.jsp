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
	<div class="container">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Parking Category</h4>
						<!-- To display success of failed message  -->
						<c:if test="${not empty successMsg }">
							<h5 class="text-center text-info">${successMsg }</h5>
							<c:remove var="successMsg" scope="session" />

						</c:if>

						<c:if test="${not empty failedMsg }">
							<h5 class="text-center text-danger">${failedMsg }</h5>
							<c:remove var="failedMsg" scope="session" />

						</c:if>
						
						<form action="../add_category" method="post">


							<div class="mb-3 from-group">
								<label for="exampleInputEmail1">Category Name*</label> <input
									name="cname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedy="emailHelp">
							</div>

							<div class="mb-3 form-group">
								<label for="inputState"> Category Status*</label> <select
									id="inputState" name="status" class="form-control">
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div>
								<button type="submit" class="btn btn-primary">Add</button>
								<a href="manageCategory.jsp" class="btn btn-warning">Manage</a>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
