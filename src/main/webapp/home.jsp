<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
<%@ include file="all_component/all_links.jsp"%>
<style type="text/css">
* {
	font-family: sans-serif;
}

.card-body p {
	margin-top: 5px;
}

.container h3 {
	margin-top: 20px;
	margin-bottom: 28px;
}

.crd-ho {
	color: #000;
	height: 100%; /* Ensure both cards have the same height */
	/*  border: 2px solid #00695c; */
}

body {
	background-color: #f0f1f2;
}

.crd-ho:hover {
	background-color: #9ED1D1;
	
}

.disabled-link {
	pointer-events: none;
	cursor: not-allowed;
}

/* Set image width and height */
.img-thumbnail {
	width: 90%;
	height: 300px;
	object-fit: cover;
	
}

.text-welcome {
	color: #00695c;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}

/* .text-subtitle {
	font-family: Arial, sans-serif;
	color: #444;
	 margin-bottom: 10px;
} */
.text-greeting {
	color: #333;
	text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
}

.greeting-highlight {
	font-weight: bold;
	color: #00695c;
}

a {
	text-decoration: none;
	color: #00695c;
}
</style>
</head>
<body>
	<%@ include file="User/navbarHome.jsp"%>
	<div class="container p-4">
		 <h2 class="text-center  text-welcome">
			<span style="color: black"> Welcome to </span> <span
				class="greeting-highlight"> <a href="index.jsp">ParkMyGadi</a></span>
		</h2> 

		<h5 class="text-center text-greeting">
			<span style="color: black"> Hello </span> <span
				class="greeting-highlight">${empty userObj.name ? "our valued customer" : userObj.name }</span>
		</h5>
		<!-- Start  -->
		<div class="container p-4">
			<div class="row">
				<div class="col-md-6">
					<a href="User/vehicleIn.jsp" class="card-link">
						<div class="card crd-ho">
							<div class="card-body text-center">
								<h4>Entry</h4>
								<img alt="Image of a bike" src="Vehicle/front.jpeg"
									class="img-thumbnail">
							
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-6">
					<a href="User/vehicleOut.jsp" class="card-link">
						<div class="card crd-ho">

							<div class="card-body text-center">
								<h4>Exit</h4>

								<img alt="Image of a bike" src="Vehicle/back.jpeg"
									class="img-thumbnail">

							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
		<!-- End   -->

	</div>



</body>
</html>