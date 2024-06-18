<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Home Page</title>
<%@ include file="all_links.jsp"%>
<style type="text/css">
*{
font-family: sans-serif;
}
 body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            flex: 1;
        } 
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body style="background-color: #f0f1f2">
	<%@ include file="navbar.jsp"%>
	<!-- To make site secure, admin should login to accesy -->
	<c:if test="${empty userObj}">
		<c:redirect url="../login.jsp"></c:redirect>

	</c:if>

	<div class="container">
		<div class="row p-5" style="margin-top: 40px;">
			<!-- Parking Slots section -->
			<div class="col-md-3">
				<a href="add_pSlots.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-plus fa-3x text-danger"></i><br> <br>
							<h4>Add Parking Slots</h4>
						



						</div>
					</div>
				</a>
			</div>
			<!-- end of Parking Slots section -->


			<!-- category section -->
			<div class="col-md-3">
				<a href="add_category.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-layer-group fa-3x text-info"></i> <br>
							<br>
							<h4>Category</h4>
							
						</div>
					</div>
				</a>
			</div>
			<!-- end of category section -->
			
			<!-- Parking section -->
			<div class="col-md-3">
				<a href="../home.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-square-parking fa-3x text-primary "></i><br>
							<br>
							<h4>Add/Exit Parking</h4>
						

						</div>
					</div>
				</a>
			</div>
			<!-- end of Parking section -->

			<!-- Parking manage section -->
			<div class="col-md-3">
				<a href="parkingManage.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-list-check fa-3x text-warning"></i><br>
							<br>
							<h4>Manage Parking</h4>
						

						</div>
					</div>
				</a>
			</div>
			<!-- End of Parking manage section -->



			<!-- First row ends here -->

			<div style="margin-top: 20px;"></div>
			<!-- Second row for the last two columns -->

			<br> <br>
			<!--  To center two column-->
		<!--  <div class="row justify-content-center">
				<div class="col-md-3">
						<a href="report.jsp">
						<div class="card">
							<div class="card-body text-center">
								<i class="fa-solid fa-chart-pie fa-3x text-warning"></i> <br>
								<br>
								<h4>Log Out</h4>
							
							</div>
						</div>
					</a>
				</div>  -->

				<!-- Logout Modal -->
				<div class="modal fade" id="exampleModalCenter" tabindex="-1"
					aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalCenterTitle"></h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="text-center">
									<h5>Do you want to logout?</h5>
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>
									<a href="../Logout" class="btn btn-primary">Log out</a>
								</div>
							</div>
							<div class="modal-footer"></div>
						</div>
					</div>
				</div>


			</div>
		</div>
<!-- 	</div> -->

	<div>
		<%@ include file="footer.jsp"%>
	</div>

</body>
</html>
