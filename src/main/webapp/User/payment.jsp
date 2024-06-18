<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.entity.Parking" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%
    HttpSession session2 = request.getSession();
    Parking parking = (Parking) session.getAttribute("parking");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        <h1 class="form-header text-center">Payment</h1>
        <div class="form-section">
            <p class="text-center highlight-text">Total Amount Due: NRs. <%= parking.getEarned_amount() %></p>
             <c:if test="${not empty successMsg }">
							<h5 class="text-center text-info">${successMsg }</h5>
							<c:remove var="successMsg" scope="session" />

						</c:if>

						<c:if test="${not empty failedMsg }">
							<h5 class="text-center text-danger">${failedMsg }</h5>
							<c:remove var="failedMsg" scope="session" />

						</c:if>
            <form action="../processPayment" method="post">
                <div class="mb-3">
                    <label for="paymentMethod" class="form-label">Choose Payment Method</label>
                    <select class="form-select" id="paymentMethod" name="paymentMethod" required>
                        <option selected disabled value="">Choose...</option>
                        <option value="cash">Cash</option>
                        <option value="ebanking">E-Banking</option>
                        <option value="card">Card</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Submit Payment</button>
                <a href="../home.jsp" class="btn btn-warning">Back</a> 
            </form>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>
