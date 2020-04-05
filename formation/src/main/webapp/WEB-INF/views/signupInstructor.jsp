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
    <link href="../css/app.rtl.css" rel="stylesheet">

    <!-- Material Design Icons -->
    <link href="../css/vendor-material-icons.css" rel="stylesheet">
    <link  href="../css/vendor-material-icons.rtl.css" rel="stylesheet">

    <!-- Font Awesome FREE Icons -->
    <link  href="../css/vendor-fontawesome-free.css" rel="stylesheet">
    <link  href="../css/vendor-fontawesome-free.rtl.css" rel="stylesheet">


</head>
<body>
<!-- <h2>Sing up Form as Instructor: </h2> -->
<%--     <form action="instructor/register" method="post"> --%>
<!--        <input type="text" placeholder="User Name" name="username" required />  -->
<!--        <input type="password" placeholder="Enter your Password" name="password" required />         -->
<!--        <input type="email" placeholder="Enter your Email" name="email" required /> -->
<!--        <button type="submit">Register</button> -->
<%--     </form> --%>

<body class="layout-login-centered-boxed">

    <div class="layout-login-centered-boxed__form">
        <div class="d-flex flex-column justify-content-center align-items-center mt-2 mb-4 navbar-light">
            <a href="" class="text-center text-light-gray mb-4">

                <!-- LOGO -->

            </a>
        </div>
        <div class="card card-body">

            <form action="/signup/instructor/register" method="post" novalidate >
                <div class="form-group">
                    <label class="text-label" for="username">User Name:</label>
                    <div class="input-group input-group-merge">
                        <input id="username" type="text" name="username" required="required" class="form-control form-control-prepended" placeholder="Enter your User Name">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <span class="far fa-user"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="text-label" for="email">Email Address:</label>
                    <div class="input-group input-group-merge">
                        <input id="email" type="email" name="email" required="required" class="form-control form-control-prepended" placeholder="Enter your Email">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <span class="far fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="text-label" for="password">Password:</label>
                    <div class="input-group input-group-merge">
                        <input id="password" type="password" name="password" required="required" class="form-control form-control-prepended" placeholder="Enter your password">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <span class="material-icons">lock</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group text-center">
                    <button class="btn btn-success btn-lg btn-block mb-3" type="submit">Create Account</button>
                </div>
                <div class="text-center">
                    <span>Have an account?</span> <a class="text-underline" href="/login"> Login</a>
                </div>
            </form>
        </div>
    </div>
<!--     <img alt="" src="images/256_daniel-gaffey-1060698-unsplash.jpg">here -->
<!--     <img alt="" src="static/images/256_daniel-gaffey-1060698-unsplash.jpg">here -->
<!--     <img alt="" src="./images/256_daniel-gaffey-1060698-unsplash.jpg">here -->
<!--     <img alt="" src="../images/256_daniel-gaffey-1060698-unsplash.jpg">here -->
    <!-- jQuery -->
    <script src="../vendor/jquery.min.js"></script>

    <!-- Bootstrap -->
    <script src="../vendor/popper.min.js"></script>
    <script src="../vendor/bootstrap.min.js"></script>

</body>
</html>