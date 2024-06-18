<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Vehicle Exit</title>
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
</style>
</head>
<body>
	<div class="container mt-5">
		<h1 class="form-header text-center">Vehicle Exit</h1>
		<div class="form-section">
			<c:if test="${not empty failedMsg }">
				<h5 class="text-center text-danger">${failedMsg }</h5>
				<c:remove var="failedMsg" scope="session" />

			</c:if>
			<form action="../updateParking" method="post">
				<div class="mb-3">
					<label for="vehicleRegExit" class="form-label">Vehicle
						Registration</label> <input type="text" class="form-control"
						id="vehicleRegExit" name="vehicleRegExit" required>
				</div>
				<div class="mb-3">
					<label for="phone" class="form-label">Phone Number</label> <input
						type="text" class="form-control" id="phone" name="phone" required
						pattern="^(98|97|95)\d{8}$"
						title="Phone number must start with 98, 97, or 95 and followed by 8 other digits.">
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
				<a href="../home.jsp" class="btn btn-warning">Back</a> 
			</form>
			<div class="form-footer text-center mt-3">
				<p>Please note: Ensure the vehicle registration is <span class="highlight-text"> correct </span>
					before submission.</p>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>
