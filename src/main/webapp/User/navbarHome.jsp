<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Parking Management System</title>
<!-- Link to custom CSS file -->
<link rel="stylesheet" href="style.css">

</head>
<body>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div class="container-fluid"
		style="height: 10px; background-color: #00695c"></div>

	<!-- For adding the website name on the top left side -->
	<div class="container-fluid p-4">
	<!--  <div class="row"> --> <!--  the below line code is added to shift admin and logout button to the right-->
		  <div class="row justify-content-between align-items-center">
			<div class="col-md-3">
				<a class="navbar-brand" href="index.jsp" style="margin-left: 30px;"> ParkMyGadi</a>
			</div>

			<!-- Search bar -->
		<!-- 	<div class="col-md-6">
				<form class="d-flex ml-auto" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>  -->

			<!-- For login and sign up buttons -->
			<div class="col-md-3 text-end" style="
    margin-right: 95px">
				<c:if test="${not empty userObj}">
					<c:if test="${userObj.name == 'Admin'}">
						<a href="admin/home.jsp" class="btn btn-success text-white"> <i
							class="fa-solid fa-user"></i> ${userObj.name}
						</a>
					</c:if>
					<c:if test="${userObj.name != 'Admin'}">
						<button type="button" class="btn btn-success text-white"
							data-bs-toggle="modal" data-bs-target="#profileModal">
							<i class="fa-solid fa-user"></i> ${userObj.name}
						</button>
					</c:if>
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
						<i class="fa-solid fa-right-to-bracket"></i> Log out
					</button>
				</c:if>
				<c:if test="${empty userObj }">
					<a href="login.jsp" class="btn btn-success"> <i
						class="fa-solid fa-right-to-bracket"></i> Login
					</a>
					<a href="register.jsp" class="btn btn-primary"><i
						class="fa-solid fa-user-plus"></i> Sign up</a>
				</c:if>
			</div>
		</div>
	</div>
	
	 <!-- Profile Modal -->
    <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="profileModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="profileModalLabel">Profile</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Username: ${userObj.name}</p>
                    <p>Email: ${userObj.email}</p>
                    <!-- Add more profile information as needed -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
	
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
						<a href="Logout" class="btn btn-primary">Log out</a>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- <div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp"> <i
							class="fa-solid fa-house"></i> Home
					</a></li>
					<li class="nav-item">
                        <a class="nav-link disabled" aria-disabled="true">Disabled</a>
                    </li>
				</ul>
				<form class="form-inline">
					input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
					<button class="btn btn-light" type="submit"><i class="fa-solid fa-list-check"></i> Manage</button>
					 <button class="btn btn-light" type="submit"> <i class="fa-solid fa-address-book"></i> Contact Us</button>
				</form>
			</div>
 -->	</nav>


</body>
</html>
