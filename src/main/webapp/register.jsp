<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Parking Management System: Registration Page</title>
<link rel="stylesheet" href="all_component/indexStyle.css">
<%@ include file="all_component/all_links.jsp"%>
<script>
    function togglePassword() {
        var passwordField = document.getElementById('password');
        var toggleIcon = document.getElementById('togglePassword');
        if (passwordField.type === 'password') {
            passwordField.type = 'text';
            toggleIcon.classList.remove('fa-eye');
            toggleIcon.classList.add('fa-eye-slash');
        } else {
            passwordField.type = 'password';
            toggleIcon.classList.remove('fa-eye-slash');
            toggleIcon.classList.add('fa-eye');
        }
    }
</script>
</head>
<body style="background-color: #f0f1f2">
    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h1 class="text-center fw-bold mb-5">Sign up</h1>
                        <c:if test="${not empty successMsg}">
                            <p class="text-center text-info">${successMsg}</p>
                            <c:remove var="successMsg" scope="session" />
                        </c:if>

                        <c:if test="${not empty errorMsg}">
                            <p class="text-center text-danger">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>

                        <form class="mx-4" action="register" method="post">
                            <div class="mb-4">
                                <label for="name" class="form-label visually-hidden">Your Name</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-user fa-lg"></i></span>
                                    <input type="text" id="name" class="form-control" placeholder="Your Name" required="required" name="fname" value="${param.fname}">
                                </div>
                            </div>
                            <div class="mb-4">
                                <label for="email" class="form-label visually-hidden">Your Email</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-envelope fa-lg"></i></span>
                                    <input type="email" id="email" class="form-control" placeholder="Your Email" required="required" name="email" value="${param.email}">
                                </div>
                            </div>
                            <div class="mb-4">
                                <label for="phone" class="form-label visually-hidden">Phone Number</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-phone fa-lg"></i></span>
                                    <input type="tel" id="phone" class="form-control" placeholder="Phone Number" name="phone" required="required" value="${param.phone}">
                                </div>
                            </div>
                            <div class="mb-4">
                                <label for="password" class="form-label visually-hidden">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-key fa-lg"></i></span>
                                    <input type="password" id="password" class="form-control" placeholder="Password" name="password" required="required" value="${param.password}">
                                    <span class="input-group-text"><i class="fas fa-eye" id="togglePassword" onclick="togglePassword()"></i></span>
                                </div>
                            </div>
                            <div class="mb-4">
                                <label for="loginName" class="form-label visually-hidden">LoginName</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-id-badge fa-lg"></i></span>
                                    <input type="text" id="loginName" class="form-control" placeholder="Login Name" name="loginName" required="required" value="${param.loginName}">
                                </div>
                            </div>
                            <div class="form-check mb-4">
                                <input class="form-check-input" type="checkbox" value="" id="agree" name="check" ${param.check != null ? 'checked' : ''}>
                                <label class="form-check-label" for="agree"> I agree all statements in terms of service </label>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-success btn-lg">Register</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6 d-flex justify-content-center">
                <img src="IMG/car2.jpg" class="img-fluid" alt="Sample image">
            </div>
        </div>
    </div>
</body>
</html>
