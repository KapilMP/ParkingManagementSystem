<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Parking Management System: Login Page</title>
<link rel="stylesheet" href="all_component/indexStyle.css">
<%@ include file="all_component/all_links.jsp"%>
<!-- Include Font Awesome for eye icon -->
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
.input-group-text {
    cursor: pointer;
}
</style>
</head>
<body style="background-color: #f0f1f2">
    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h1 class="text-center fw-bold mb-5">Login</h1>

                        <c:if test="${not empty failedMsg}">
                            <p class="text-center text-danger">${failedMsg}</p>
                            <c:remove var="failedMsg" scope="session" />
                        </c:if>
                        <c:if test="${not empty successMsg}">
                            <p class="text-center text-success">${successMsg}</p>
                            <c:remove var="successMsg" scope="session" />
                        </c:if>

                        <form class="mx-4" action="login" method="post">
                            <div class="mb-4">
                                <label for="exampleInputEmail1"
                                    class="form-label visually-hidden">Email address</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i
                                        class="fas fa-envelope fa-lg"></i></span> 
                                    <input type="email" class="form-control" id="exampleInputEmail1"
                                        aria-describedby="emailHelp" required="required" name="email"
                                        placeholder="Email Address" 
                                        value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>">
                                </div>
                            </div>

                            <div class="mb-4">
                                <label for="exampleInputPassword1"
                                    class="form-label visually-hidden">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i
                                        class="fas fa-key fa-lg"></i></span> 
                                    <input type="password" class="form-control" id="exampleInputPassword1"
                                        required="required" name="password" placeholder="Password" 
                                        value="<%= request.getAttribute("password") != null ? request.getAttribute("password") : "" %>">
                                    <span class="input-group-text" id="togglePassword"><i
                                        class="fas fa-eye"></i></span>
                                </div>
                            </div>

                            <%-- <div class="mb-4 form-check">
                                <input type="checkbox" class="form-check-input"
                                    id="exampleCheck1" name="rememberMe" 
                                    <%= request.getAttribute("email") != null ? "checked" : "" %>> 
                                <label class="form-check-label" for="exampleCheck1">Remember me</label>
                            </div> --%>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-success btn-lg">Submit</button>
                            </div>
                        </form>
                        <div class="text-center mt-3">
                            <a href="register.jsp">Create Account</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript to toggle password visibility -->
    <script>
        const togglePassword = document.querySelector('#togglePassword');
        const password = document.querySelector('#exampleInputPassword1');

        togglePassword.addEventListener('click', function(e) {
            // toggle the type attribute
            const type = password.getAttribute('type') === 'password' ? 'text'
                    : 'password';
            password.setAttribute('type', type);

            // toggle the eye slash icon
            this.querySelector('i').classList.toggle('fa-eye');
            this.querySelector('i').classList.toggle('fa-eye-slash');
        });
    </script>
</body>
</html>
