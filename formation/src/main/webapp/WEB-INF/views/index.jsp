<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Training Management</title>

    <!-- Prevent the demo from appearing in search engines -->
    <meta name="robots" content="noindex">

    <!-- Perfect Scrollbar -->
    <link type="text/css" href="../vendor/perfect-scrollbar.css" rel="stylesheet">

    <!-- App CSS -->
    <link type="text/css" href="../css/app.css" rel="stylesheet">
    <link type="text/css" href="../css/app.rtl.css" rel="stylesheet">

    <!-- Material Design Icons -->
    <link type="text/css" href="../css/vendor-material-icons.css" rel="stylesheet">
    <link type="text/css" href="../css/vendor-material-icons.rtl.css" rel="stylesheet">

    <!-- Font Awesome FREE Icons -->
    <link type="text/css" href="../css/vendor-fontawesome-free.css" rel="stylesheet">
    <link type="text/css" href="../css/vendor-fontawesome-free.rtl.css" rel="stylesheet">

    <!-- ion Range Slider -->
    <link type="text/css" href="../css/vendor-ion-rangeslider.css" rel="stylesheet">
    <link type="text/css" href="../css/vendor-ion-rangeslider.rtl.css" rel="stylesheet">


</head>

<body class="layout-default">

    <!-- Header Layout -->
    <div class="mdk-header-layout js-mdk-header-layout">

        <!-- Header -->

        <div id="header" class="mdk-header js-mdk-header m-0" data-fixed>
            <div class="mdk-header__content">

                <div class="navbar navbar-expand-sm navbar-main navbar-dark bg-primary pl-md-0 pr-0" id="navbar" data-primary>
                    <div class="container-fluid pr-0 ">

                        <!-- Navbar toggler -->
                        <button class="navbar-toggler navbar-toggler-custom d-lg-none d-flex mr-navbar" type="button" data-toggle="sidebar">
                            <span class="material-icons">short_text</span>
                        </button>

                        <div class="d-flex sidebar-account flex-shrink-0 mr-auto mr-lg-0">
                            <a href="index.html" class="flex d-flex align-items-center text-underline-0">
                                <span class="mr-1  text-white">
                                    <!-- LOGO -->
                                    <svg xmlns="http://www.w3.org/2000/svg" version="1.1"
                                        xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 40 40" width="30"
                                        height="30">
                                        <g transform="matrix(1.6666666666666667,0,0,1.6666666666666667,0,0)">
                                            <path
                                                d="M12.177,7.4c-0.23,0-0.416,0.186-0.417,0.416v1.17c-0.011,0.23,0.166,0.426,0.396,0.437s0.426-0.166,0.437-0.396 c0.001-0.014,0.001-0.027,0-0.041V7.819c0.001-0.23-0.185-0.418-0.415-0.419C12.178,7.4,12.177,7.4,12.177,7.4z M7.51,18.486 c-0.23,0-0.416,0.186-0.416,0.416l0,0v0.585c-0.011,0.23,0.166,0.426,0.396,0.437s0.426-0.166,0.437-0.396 c0.001-0.014,0.001-0.027,0-0.041V18.9C7.925,18.671,7.739,18.487,7.51,18.486z M20.15,4.04c-0.232-0.047-0.4-0.252-0.4-0.489V2 c0-1.105-0.895-2-2-2H5.25c-1.637,0-2.972,1.311-3,2.948c0,0.017,0,18.052,0,18.052c0,1.657,1.343,3,3,3h14.5c1.105,0,2-0.895,2-2 V6C21.75,5.049,21.081,4.23,20.15,4.04z M4.25,3c0-0.552,0.448-1,1-1h12c0.276,0,0.5,0.224,0.5,0.5v1c0,0.276-0.224,0.5-0.5,0.5 h-12C4.698,4,4.25,3.552,4.25,3z M9.427,16.569c0,0.423-0.141,0.833-0.4,1.167c0.259,0.334,0.4,0.744,0.4,1.167v0.583 c-0.003,1.057-0.86,1.912-1.917,1.914H6.344c-0.414,0-0.75-0.336-0.75-0.75v-5.831c0-0.414,0.336-0.75,0.75-0.75H7.51 c1.058,0.002,1.915,0.859,1.917,1.917V16.569z M14.093,12.486c0,0.414-0.336,0.75-0.75,0.75s-0.75-0.336-0.75-0.75v-1.167 c-0.011-0.23-0.207-0.407-0.437-0.396c-0.214,0.011-0.386,0.182-0.396,0.396v1.167c0,0.414-0.336,0.75-0.75,0.75 s-0.75-0.336-0.75-0.75V7.819c0.024-1.058,0.902-1.897,1.96-1.873c1.024,0.023,1.849,0.848,1.873,1.873V12.486z M18.01,19.9 c0.414,0,0.75,0.336,0.75,0.75s-0.336,0.75-0.75,0.75c-1.702-0.002-3.081-1.382-3.083-3.084v-1.163 c0.002-1.702,1.381-3.082,3.083-3.084c0.414,0,0.75,0.336,0.75,0.75s-0.336,0.75-0.75,0.75c-0.874,0.001-1.582,0.71-1.583,1.584 v1.166C16.429,19.192,17.137,19.899,18.01,19.9z M7.51,15.569c-0.23,0-0.416,0.186-0.416,0.416l0,0v0.585 C7.083,16.8,7.26,16.996,7.49,17.007s0.426-0.166,0.437-0.396c0.001-0.014,0.001-0.027,0-0.041v-0.583 C7.927,15.757,7.74,15.57,7.51,15.569z"
                                                stroke="none" fill="#ffffff" stroke-width="0" stroke-linecap="round"
                                                stroke-linejoin="round"></path>
                                        </g>
                                    </svg>
                                </span>
                                <span class="flex d-flex flex-column text-white">
                                    <strong class="sidebar-brand">Training Management</strong>
                                </span>
                            </a>
                        </div>

                        <!-- Nav-Links -->
                        <ul class="ml-auto nav navbar-nav mr-2 d-none d-lg-flex">
                            <li class="nav-item"><a href="/signup/instructor" class="nav-link mx-1">Become an Instructor</a>
                            </li>
                        </ul>
                        <security:authorize access="hasRole('STUDENT')">
                        	<a href="/student" class="nav-link btn btn-outline-secondary mx-1">Student Space</a>
                        </security:authorize>
                        <security:authorize access="hasRole('INSTRUCTOR')">
                        	<a href="/instructor" class="nav-link btn btn-outline-secondary mx-1">Instructor Space</a>
                        </security:authorize>
                        <a href="/login" class="nav-link btn btn-outline-secondary mx-1">Login</a>
                        <a href="/signup/student" class="nav-link btn btn-danger mx-2">Sign up</a>
                    </div>

                </div>

            </div>
 
        </div>

        
            

        <img src="../images/finally.jpg" alt="New york" style="width:100%; height: 700px">
                


               
    </div>

    <div class="footer" style="position: absolute;
    bottom: 0;
    width: 100%;
    height: 70px;
    padding: 20px;
    background-color: #1377c9;
    color: white;
    font-weight: bold;
    text-align: center;">
        <div class="container">
            <span>All Rights Reserved &copy; 2020.
                <a style="color: black;" href="http://www.fst.ac.ma">Faculty of Sciences </a>@<em>T&eacute;touan</em></span>
        </div>
    </div>


    <!-- jQuery -->
    <script src="../vendor/jquery.min.js"></script>

    <!-- Bootstrap -->
    <script src="../vendor/popper.min.js"></script>
    <script src="../vendor/bootstrap.min.js"></script>

    <!-- Perfect Scrollbar -->
    <script src="../vendor/perfect-scrollbar.min.js"></script>

    <!-- DOM Factory -->
    <script src="../vendor/dom-factory.js"></script>

    <!-- MDK -->
    <script src="../vendor/material-design-kit.js"></script>

    <!-- Range Slider -->
    <script src="../vendor/ion.rangeSlider.min.js"></script>
    <script src="../js/ion-rangeslider.js"></script>

    <!-- App -->
    <script src="../js/toggle-check-all.js"></script>
    <script src="../js/check-selected-row.js"></script>
    <script src="../js/dropdown.js"></script>
    <script src="../js/sidebar-mini.js"></script>
    <script src="../js/app.js"></script>

    <!-- App Settings (safe to remove) -->
    <script src="../js/app-settings.js"></script>


</body>

</html>