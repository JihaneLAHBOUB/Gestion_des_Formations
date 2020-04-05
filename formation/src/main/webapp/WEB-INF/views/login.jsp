<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>

    <!-- Prevent the demo from appearing in search engines -->
    <meta name="robots" content="noindex">

    <!-- Perfect Scrollbar -->
    <link href="../vendor/perfect-scrollbar.css" rel="stylesheet">

    <!-- App CSS -->
    <link href="../css/app.css" rel="stylesheet">

    <!-- Material Design Icons -->
    <link href="../css/vendor-material-icons.css" rel="stylesheet">

    <!-- Font Awesome FREE Icons -->
    <link href="../css/vendor-fontawesome-free.css" rel="stylesheet">

    <style>
        .failed {
            color: red;
        }

        .success {
            color: green;
        }
    </style>
</head>

<body class="layout-login-centered-boxed">

    <div class="layout-login-centered-boxed__form">
        <div class="d-flex flex-column justify-content-center align-items-center mt-2 mb-4 navbar-light">
            <a href="index.html" class="text-center text-light-gray mb-4">

                <!-- LOGO -->

            </a>
        </div>

        <div class="card card-body">
            <a href="oauth2/authorization/facebook" class="btn btn-light btn-block">
                <span class="mr-2">
                    <i class="fab fa-facebook"></i>
                </span>
                Sign in with Facebook
            </a>
            <a href="oauth2/authorization/google" class="btn btn-light btn-block">
                <span class="mr-2">
                    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" width="18px" height="18px" viewBox="0 0 48 48"
                        class="abcRioButtonSvg">
                        <g>
                            <path fill="#EA4335"
                                d="M24 9.5c3.54 0 6.71 1.22 9.21 3.6l6.85-6.85C35.9 2.38 30.47 0 24 0 14.62 0 6.51 5.38 2.56 13.22l7.98 6.19C12.43 13.72 17.74 9.5 24 9.5z">
                            </path>
                            <path fill="#4285F4"
                                d="M46.98 24.55c0-1.57-.15-3.09-.38-4.55H24v9.02h12.94c-.58 2.96-2.26 5.48-4.78 7.18l7.73 6c4.51-4.18 7.09-10.36 7.09-17.65z">
                            </path>
                            <path fill="#FBBC05"
                                d="M10.53 28.59c-.48-1.45-.76-2.99-.76-4.59s.27-3.14.76-4.59l-7.98-6.19C.92 16.46 0 20.12 0 24c0 3.88.92 7.54 2.56 10.78l7.97-6.19z">
                            </path>
                            <path fill="#34A853"
                                d="M24 48c6.48 0 11.93-2.13 15.89-5.81l-7.73-6c-2.15 1.45-4.92 2.3-8.16 2.3-6.26 0-11.57-4.22-13.47-9.91l-7.98 6.19C6.51 42.62 14.62 48 24 48z">
                            </path>
                            <path fill="none" d="M0 0h48v48H0z"></path>
                        </g>
                    </svg>
                </span>
                Sign in with Google
            </a>

            <div class="page-separator">
                <div class="page-separator__text">or</div>
            </div>

            <form:form action="${pageContext.request.contextPath }/login" method="post">

                <c:if test="${param.error != null}">
                    <i class="failed">Sorry! You entered invalid user name/password.</i>
                </c:if>
                <c:if test="${param.logout != null}">
                    <i class="success">Welcome Again! You have been logged out.</i>
                </c:if>

                <div class="form-group">
                    <label class="text-label" for="username">Username:</label>
                    <div class="input-group input-group-merge">
                        <input id="username" type="text" name="username" class="form-control form-control-prepended"
                            placeholder="Enter your username" required="required">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <span class="far fa-user"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="text-label" for="password">Password:</label>
                    <div class="input-group input-group-merge">
                        <input id="password" type="password" name="password" class="form-control form-control-prepended"
                            placeholder="Enter your password" required="required">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <span class="fa fa-key"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group mb-1">
                    <button class="btn btn-block btn-success" type="submit">Login</button>
                </div>

                <div class="form-group text-center mb-0"><br>
                    Don't have an account? <br><br>
                    <a class="text-underline" href="/signup/instructor">Become an instructor</a>
                    <a class="text-underline" href="/signup/student" style="margin-left: 100px;">Sign up</a>
                </div>

            </form:form>
        </div>
    </div>

    <!-- jQuery -->
    <script src="../vendor/jquery.min.js"></script>

    <!-- Bootstrap -->
    <script src="../vendor/popper.min.js"></script>
    <script src="../vendor/bootstrap.min.js"></script>

</body>

</html>



<!-- <%-- <form:form action="${pageContext.request.contextPath }/login" method="post"> --%>
		
<%-- 		<c:if test="${param.error != null}"> --%> -->

<!-- 			<i class="failed">Sorry! You entered invalid user name/password.</i> -->
<!-- 			
<%-- 		</c:if> --%>
<%-- 		<c:if test="${param.logout != null}"> --%> -->

<!-- 			<i class="success">Welcome Again! You have been logged out.</i> -->
<!-- 			
<%-- 		</c:if> --%> -->
<!-- 	<pre> -->
<!-- 		User name: <input type="text" name="username"><br> -->
<!-- 		Password: <input type="password" name="password"><br> -->
<!--  		<input type="checkbox" name="remember-me">Remember me? -->
<!-- 		<input type="submit" value="login"> -->
<!-- 	</pre> -->

<!-- <%-- </form:form> --%> -->

<!-- <h3>Login with:</h3> -->
<!-- 	thymleaf -->
<!-- <%-- 	<p><a th:href="${facebook}">Facebook</a></p> --%>
<%-- 	<p><a th:href="${google}">Google</a></p> --%> -->


<!-- 	<p><a href="oauth2/authorization/facebook">Facebook</a></p> -->
<!-- 	<p><a href="oauth2/authorization/google">Google</a></p> -->

<!--     <img alt="" src="images/256_daniel-gaffey-1060698-unsplash.jpg">here -->
<!--     <img alt="" src="static/images/256_daniel-gaffey-1060698-unsplash.jpg">here -->
<!--     <img alt="" src="./images/256_daniel-gaffey-1060698-unsplash.jpg">here -->
<!--     <img alt="" src="../images/256_daniel-gaffey-1060698-unsplash.jpg">here -->