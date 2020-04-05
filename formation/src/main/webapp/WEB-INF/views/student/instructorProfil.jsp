<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Profile</title>

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
                    <!-- navbar -->
                </div>
            </div>
        </div>
<!-- Header Layout Content -->
        <div class="mdk-header-layout__content">

            <div class="mdk-drawer-layout js-mdk-drawer-layout" data-push data-responsive-width="992px">
                <div class="mdk-drawer-layout__content page">

                    <div class="bg-soft-secondary text-white d-flex justify-content-center align-items-center p-4 mb-4" style="height:300px">
                        <div class="d-flex flex-column flex-md-row align-items-center justify-content-center text-center text-lg-left">
                            <div class="mr-lg-4 mb-4 mb-lg-0">
                                <img src="../images/avatar.png" class="rounded-circle" width="185" alt="avatar">
                                <p class="mb-lg-4 "style="color: black;" ><i class="material-icons" style="color:crimson;">email</i><b> ${instructor.email }</b></p>
                            </div>
							<div style="color: black;">
                                <h1 class="mb-lg-4">${instructor.username }</h1>
                                <p class="mb-lg-12 text-muted"><b>Total Number of Enrollments</b></p>
                                <h2 class="mb-lg-4"><b>23</b></h2>
                            </div>
                        </div>

                    </div>
					<div class="container-fluid page__container">
                        <h4 class="mb-4">${instructor.username }'s Courses</h4>
                        <div class="row">					
                             <c:forEach items="${listCourses }" var="course">
									
								<div class="col-md-3">                          
                                <div class="card card__course">
                                    <div class="card-header card-header-large card-header-dark bg-primary d-flex justify-content-center">
                                        <a class="card-header__title  justify-content-center align-self-center d-flex flex-column" href="#">
                                            <span><img src="../images/course.png" class="mb-1" style="width:34px;" alt="logo"></span>
                                            <span class="course__title">${course.name }</span>
                                            <span class="course__subtitle">${course.description }</span>
                                        </a>
                                    </div>
                                    <div class="p-3">
                                        <div class="mb-2">
                                            <span class="mr-2">
                                                <a href="#" class="rating-link active"><i class="material-icons icon-16pt">star</i></a>
                                                <a href="#" class="rating-link active"><i class="material-icons icon-16pt">star</i></a>
                                                <a href="#" class="rating-link active"><i class="material-icons icon-16pt">star</i></a>
                                                <a href="#" class="rating-link active"><i class="material-icons icon-16pt">star</i></a>
                                                <a href="#" class="rating-link active"><i class="material-icons icon-16pt">star_half</i></a>
                                            </span>
                                            <strong>4.7</strong><br />
                                            <small class="text-muted">(nbr ratings)</small>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <strong class="h4 m-0">${course.price } MAD</strong>
                                            <a href="/cart/addProduct?id=${course.id}" class="btn btn-success ml-auto"><i class="material-icons">add_shopping_cart</i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                          </c:forEach>
                     </div>
                  </div>
               </div>
                     
                
                <!-- Start Side Bar Section -->
                <div class="mdk-drawer  js-mdk-drawer" id="default-drawer" data-align="start">
                    <div class="mdk-drawer__content">
                        <div class="sidebar sidebar-light sidebar-left bg-white" data-perfect-scrollbar>

                            <!-- Picture Block -->
                            <div class="sidebar-block p-0 m-0">
                                <div class="d-flex align-items-center sidebar-p-a border-bottom bg-light">
                                    <a href="#" class="flex d-flex align-items-center text-body text-underline-0">
                                        <span class="avatar avatar-sm mr-2">
                                            <span class="avatar-title rounded-circle bg-soft-secondary text-muted">AD</span>
                                        </span>
                                        <span class="flex d-flex flex-column">
                                            <strong>
                                            <security:authorize access="isAuthenticated()">
											    <security:authentication property="principal.username" /> 
											</security:authorize>
                                            </strong>
                                            <small class="text-muted text-uppercase">Student</small>
                                        </span>
                                    </a>
                                </div>
                            </div>
                            <div class="sidebar-block p-0">

                                <div class="sidebar-heading">Student</div>
                                <!-- Side Bar Menu -->
                                <ul class="sidebar-menu mt-0">


                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="/student">
                                            <span class="sidebar-menu-icon sidebar-menu-icon--left">
                                                <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 40 40" width="22" height="22">
                                                    <g transform="matrix(1.6666666666666667,0,0,1.6666666666666667,0,0)">
                                                        <path d="M7.652,14.05v-0.6C7.65,12.373,6.777,11.501,5.7,11.5H4.5c-0.414,0-0.75,0.336-0.75,0.75v6C3.75,18.664,4.086,19,4.5,19 h1.2c1.077-0.001,1.949-0.873,1.951-1.95v-0.6C7.65,16.117,7.564,15.79,7.4,15.5c-0.089-0.155-0.089-0.345,0-0.5 C7.564,14.71,7.651,14.383,7.652,14.05z M6.152,17.05c-0.017,0.249-0.231,0.437-0.48,0.42c-0.225-0.015-0.405-0.195-0.42-0.42v-0.6 c0.017-0.249,0.231-0.437,0.48-0.42c0.225,0.015,0.405,0.195,0.42,0.42V17.05z M6.152,14.05c-0.017,0.249-0.231,0.437-0.48,0.42 c-0.225-0.015-0.405-0.195-0.42-0.42v-0.6c0.017-0.249,0.231-0.437,0.48-0.42c0.225,0.015,0.405,0.195,0.42,0.42V14.05z M7.652,4.95C7.618,3.873,6.716,3.028,5.64,3.062C4.611,3.095,3.785,3.921,3.752,4.95v4.8c0,0.414,0.336,0.75,0.75,0.75 s0.75-0.336,0.75-0.75v-1.2c-0.017-0.249,0.171-0.463,0.42-0.48c0.249-0.017,0.463,0.171,0.48,0.42c0.001,0.02,0.001,0.04,0,0.06 v1.2c0,0.414,0.336,0.75,0.75,0.75s0.75-0.336,0.75-0.75V4.95z M6.152,6.15c-0.017,0.249-0.231,0.437-0.48,0.42 c-0.225-0.015-0.405-0.195-0.42-0.42v-1.2c0.017-0.249,0.231-0.437,0.48-0.42c0.225,0.015,0.405,0.195,0.42,0.42V6.15z M11.2,4H9.7 C9.286,4,8.95,4.336,8.95,4.75S9.286,5.5,9.7,5.5h1.5c0.414,0,0.75-0.336,0.75-0.75S11.614,4,11.2,4z M11.951,12.75 c0-0.414-0.336-0.75-0.75-0.75c0,0-0.001,0-0.001,0H9.7c-0.414,0-0.75,0.336-0.75,0.75S9.286,13.5,9.7,13.5h1.5 c0.414,0.001,0.75-0.335,0.751-0.749C11.951,12.751,11.951,12.75,11.951,12.75z M8.5,20h-6C2.224,20,2,19.776,2,19.5v-17 C2,2.224,2.224,2,2.5,2h8.672c0.265,0,0.52,0.105,0.707,0.293l2.828,2.828C14.895,5.308,15,5.563,15,5.828V12c0,0.552,0.448,1,1,1 c0.552,0,1-0.448,1-1V5.414c0.001-0.531-0.21-1.04-0.586-1.414L13,0.586C12.624,0.212,12.116,0.001,11.586,0H2C0.895,0,0,0.895,0,2 v18c0,1.105,0.895,2,2,2h6.5c0.552,0,1-0.448,1-1S9.052,20,8.5,20z M23.685,16.61l-6-2.382c-0.119-0.047-0.251-0.047-0.37,0 l-6,2.382c-0.194,0.077-0.319,0.266-0.315,0.475v3.13c0,0.276,0.224,0.5,0.5,0.5s0.5-0.224,0.5-0.5v-2.08 c0-0.138,0.111-0.249,0.248-0.25c0.029,0,0.057,0.005,0.085,0.015l5,1.765c0.108,0.037,0.224,0.037,0.332,0l6-2.118 c0.261-0.091,0.398-0.376,0.307-0.637C23.924,16.773,23.819,16.663,23.685,16.61L23.685,16.61z M20.763,19.829l-2.93,1.034 c-0.215,0.076-0.451,0.076-0.666,0l-2.93-1.034c-0.26-0.092-0.546,0.045-0.638,0.306c-0.019,0.053-0.028,0.11-0.028,0.166v2.145 c0,0.212,0.134,0.401,0.334,0.471l2.574,0.909c0.661,0.232,1.382,0.232,2.043,0l2.573-0.909c0.2-0.07,0.334-0.259,0.334-0.471V20.3 c0-0.276-0.223-0.5-0.5-0.5c-0.057,0-0.113,0.01-0.166,0.028L20.763,19.829z" stroke="none" fill="currentColor" stroke-width="0" stroke-linecap="round" stroke-linejoin="round"></path>
                                                    </g>
                                                </svg>
                                            </span>
                                            <span class="sidebar-menu-text">Dashboard</span>
                                        </a>
                                    </li>


                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="/enroll/enrolledCourses">
                                            <span class="sidebar-menu-icon sidebar-menu-icon--left">
                                                <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 40 40" width="22" height="22">
                                                    <g transform="matrix(1.6666666666666667,0,0,1.6666666666666667,0,0)">
                                                        <path d="M2.5,16C2.224,16,2,15.776,2,15.5v-11C2,4.224,2.224,4,2.5,4h14.625c0.276,0,0.5,0.224,0.5,0.5V8c0,0.552,0.448,1,1,1 s1-0.448,1-1V4c0-1.105-0.895-2-2-2H2C0.895,2,0,2.895,0,4v12c0,1.105,0.895,2,2,2h5.375c0.138,0,0.25,0.112,0.25,0.25v1.5 c0,0.138-0.112,0.25-0.25,0.25H5c-0.552,0-1,0.448-1,1s0.448,1,1,1h7.625c0.552,0,1-0.448,1-1s-0.448-1-1-1h-2.75 c-0.138,0-0.25-0.112-0.25-0.25v-1.524c0-0.119,0.084-0.221,0.2-0.245c0.541-0.11,0.891-0.638,0.781-1.179 c-0.095-0.466-0.505-0.801-0.981-0.801L2.5,16z M3.47,9.971c-0.303,0.282-0.32,0.757-0.037,1.06c0.282,0.303,0.757,0.32,1.06,0.037 c0.013-0.012,0.025-0.025,0.037-0.037l2-2c0.293-0.292,0.293-0.767,0.001-1.059c0,0-0.001-0.001-0.001-0.001l-2-2 c-0.282-0.303-0.757-0.32-1.06-0.037s-0.32,0.757-0.037,1.06C3.445,7.006,3.457,7.019,3.47,7.031l1.293,1.293 c0.097,0.098,0.097,0.256,0,0.354L3.47,9.971z M7,11.751h2.125c0.414,0,0.75-0.336,0.75-0.75s-0.336-0.75-0.75-0.75H7 c-0.414,0-0.75,0.336-0.75,0.75S6.586,11.751,7,11.751z M18.25,16.5c0,0.276-0.224,0.5-0.5,0.5s-0.5-0.224-0.5-0.5v-5.226 c0-0.174-0.091-0.335-0.239-0.426c-1.282-0.702-2.716-1.08-4.177-1.1c-0.662-0.029-1.223,0.484-1.252,1.146 c-0.001,0.018-0.001,0.036-0.001,0.054v7.279c0,0.646,0.511,1.176,1.156,1.2c1.647-0.011,3.246,0.552,4.523,1.593 c0.14,0.14,0.33,0.219,0.528,0.218c0.198,0.001,0.388-0.076,0.529-0.215c1.277-1.044,2.878-1.61,4.527-1.6 c0.641-0.023,1.15-0.547,1.156-1.188v-7.279c-0.001-0.327-0.134-0.64-0.369-0.867c-0.236-0.231-0.557-0.353-0.886-0.337 c-1.496,0.016-2.963,0.411-4.265,1.148c-0.143,0.092-0.23,0.251-0.23,0.421V16.5z" stroke="none" fill="currentColor" stroke-width="0" stroke-linecap="round" stroke-linejoin="round"></path>
                                                    </g>
                                                </svg>
                                            </span>
                                            <span class="sidebar-menu-text">My Courses</span>
                                        </a>
                                    </li>


                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="/course/takeCourse">
                                            <span class="sidebar-menu-icon sidebar-menu-icon--left">
                                                <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 40 40" width="22" height="22">
                                                    <g transform="matrix(1.6666666666666667,0,0,1.6666666666666667,0,0)">
                                                        <path d="M6.354,8.984C5.64,8.853,4.854,8.75,3.909,8.659C3.497,8.619,3.195,8.252,3.235,7.84c0.04-0.412,0.407-0.714,0.819-0.674 C5.362,7.274,6.66,7.486,7.935,7.8c0.161,0.042,0.332,0.001,0.456-0.109c0.813-0.716,1.755-1.27,2.776-1.633 c0.2-0.071,0.333-0.26,0.333-0.472V2.517c0-0.171-0.088-0.33-0.232-0.422C9.235,0.8,5.417,0.11,1.789,0 C1.32-0.018,0.866,0.16,0.534,0.492C0.193,0.823,0.001,1.278,0,1.753v12.833c0,0.952,0.761,1.729,1.713,1.748 c1.156,0.031,2.309,0.124,3.454,0.279c0.273,0.039,0.526-0.152,0.565-0.425C5.741,16.125,5.738,16.062,5.723,16 C5.575,15.367,5.5,14.72,5.5,14.07c0-0.349,0.021-0.698,0.064-1.045c0.034-0.273-0.159-0.522-0.432-0.557 c-0.379-0.049-0.784-0.094-1.223-0.137c-0.412-0.04-0.714-0.407-0.674-0.819c0.04-0.412,0.407-0.714,0.819-0.674 c0.58,0.056,1.109,0.118,1.6,0.188c0.224,0.031,0.441-0.092,0.529-0.3c0.147-0.344,0.317-0.678,0.508-1 C6.833,9.489,6.755,9.182,6.518,9.04C6.467,9.01,6.411,8.989,6.352,8.978L6.354,8.984z M4.054,3.493 c1.763,0.129,3.504,0.471,5.185,1.02c0.393,0.132,0.604,0.557,0.472,0.95s-0.557,0.604-0.95,0.472 C7.189,5.422,5.559,5.103,3.909,4.986c-0.412-0.04-0.714-0.407-0.674-0.819S3.642,3.453,4.054,3.493z M23.466,0.492 C23.132,0.164,22.679-0.013,22.211,0c-3.628,0.11-7.446,0.8-9.479,2.1C12.588,2.192,12.5,2.351,12.5,2.522v2.603 c-0.002,0.276,0.221,0.501,0.497,0.503c0.019,0,0.039-0.001,0.058-0.003C13.369,5.59,13.684,5.571,14,5.57 c0.165,0,0.329,0,0.492,0.014c0.073,0.004,0.145-0.024,0.195-0.078c0.051-0.053,0.076-0.127,0.067-0.2 c-0.039-0.351,0.173-0.682,0.508-0.794c1.677-0.593,3.416-0.992,5.184-1.19c0.412-0.04,0.779,0.262,0.819,0.674 s-0.262,0.779-0.674,0.819c-1.269,0.135-2.523,0.391-3.743,0.766c-0.132,0.04-0.207,0.179-0.168,0.311 c0.023,0.076,0.081,0.137,0.156,0.164c0.707,0.252,1.378,0.596,1.994,1.024c0.107,0.074,0.239,0.103,0.367,0.082 C19.599,7.094,20.015,7.04,20.446,7c0.411-0.036,0.775,0.264,0.819,0.674c0.046,0.336-0.159,0.655-0.483,0.754 c-0.129,0.049-0.194,0.194-0.145,0.323c0.009,0.024,0.022,0.046,0.038,0.066c1.598,2.025,2.188,4.667,1.605,7.18 c-0.03,0.135,0.054,0.268,0.189,0.299c0.034,0.008,0.07,0.008,0.104,0.001c0.83-0.144,1.434-0.868,1.427-1.711V1.753 C23.999,1.278,23.807,0.823,23.466,0.492z M16,10.751h-4c-0.69,0.001-1.248,0.559-1.25,1.249v0.445 c-0.011,0.414,0.315,0.759,0.729,0.771s0.759-0.315,0.771-0.729c0.007-0.132,0.117-0.236,0.249-0.236H13 c0.138,0,0.25,0.112,0.25,0.25V16c0.001,0.138-0.11,0.249-0.248,0.25c-0.001,0-0.001,0-0.002,0c-0.414,0-0.75,0.336-0.75,0.75 s0.336,0.75,0.75,0.75h2c0.414,0,0.75-0.336,0.75-0.75s-0.336-0.75-0.75-0.75c-0.138,0.001-0.249-0.11-0.25-0.248 c0-0.001,0-0.001,0-0.002v-3.5c0-0.138,0.112-0.25,0.25-0.25h0.5c0.132,0,0.241,0.103,0.249,0.234 c0.011,0.414,0.355,0.741,0.769,0.731c0.414-0.011,0.741-0.355,0.731-0.769V12C17.247,11.311,16.689,10.753,16,10.751z M19.9,18.489c-0.168-0.168-0.195-0.431-0.064-0.629c2.132-3.225,1.245-7.568-1.98-9.699s-7.568-1.245-9.699,1.98 s-1.245,7.568,1.98,9.699c2.341,1.547,5.379,1.547,7.719,0c0.198-0.131,0.461-0.105,0.629,0.063l3.806,3.806 c0.391,0.39,1.024,0.39,1.415,0c0.39-0.391,0.39-1.024-0.001-1.415l0,0L19.9,18.489z M14,19c-2.761,0-5-2.239-5-5s2.239-5,5-5 s5,2.239,5,5C18.997,16.76,16.76,18.997,14,19z" stroke="none" fill="currentColor" stroke-width="0" stroke-linecap="round" stroke-linejoin="round"></path>
                                                    </g>
                                                </svg>
                                            </span>
                                            <span class="sidebar-menu-text">Take Course</span>
                                        </a>
                                    </li>
									
									<li class="sidebar-menu-item active">
                                        <a class="sidebar-menu-button" href="instructor-payout.html">
                                            <span class="sidebar-menu-icon sidebar-menu-icon--left">
                                                <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 40 40" width="22" height="22">
                                                    <g transform="matrix(1.6666666666666667,0,0,1.6666666666666667,0,0)">
                                                        <path d="M20.375,15.792V4.958c0.008-0.59-0.463-1.075-1.053-1.083c0,0,0,0,0,0H1.428c-0.59,0.008-1.061,0.493-1.053,1.083 c0,0,0,0,0,0v10.834c-0.008,0.59,0.463,1.075,1.053,1.083c0,0,0,0,0,0h17.894C19.912,16.867,20.383,16.382,20.375,15.792 C20.375,15.792,20.375,15.792,20.375,15.792z M10.375,13.375c-1.657,0-3-1.343-3-3s1.343-3,3-3s3,1.343,3,3 S12.032,13.375,10.375,13.375z M22.875,6.625c-0.414,0-0.75,0.336-0.75,0.75v11c0,0.138-0.112,0.25-0.25,0.25h-18 c-0.414,0-0.75,0.336-0.75,0.75s0.336,0.75,0.75,0.75h18c0.966-0.001,1.749-0.784,1.75-1.75v-11 C23.625,6.961,23.289,6.625,22.875,6.625z" stroke="none" fill="currentColor" stroke-width="0" stroke-linecap="round" stroke-linejoin="round"></path>
                                                    </g>
                                                </svg>
                                            </span>
                                            <span class="sidebar-menu-text">Cart</span>
                                        </a>
                                    </li>
                                    
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="/editStudent">
                                            <span class="sidebar-menu-icon sidebar-menu-icon--left">
                                                <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 40 40" width="22" height="22">
                                                    <g transform="matrix(1.6666666666666667,0,0,1.6666666666666667,0,0)">
                                                        <path d="M16.1,13.071c0.085-0.085,0.097-0.218,0.03-0.317c-0.649-0.959-2.342-1.584-4.633-2.426l-0.628-0.23 c-0.076-0.088-0.124-0.196-0.138-0.311c-0.093-0.431-0.073-0.879,0.058-1.3c1.076-1.166,1.609-2.733,1.466-4.314 C12.257,1.756,10.677,0,8.5,0S4.745,1.756,4.745,4.174C4.603,5.747,5.131,7.308,6.2,8.471C6.343,8.895,6.368,9.35,6.272,9.787 c-0.015,0.114-0.061,0.221-0.134,0.309l-0.631,0.232c-2.448,0.9-4.215,1.55-4.754,2.626C0.269,14.074,0.013,15.28,0,16.5 C0,16.776,0.224,17,0.5,17h11.569c0.066,0,0.13-0.026,0.177-0.073L16.1,13.071z M15.086,22.74c0.044-0.172-0.006-0.354-0.131-0.479 l-2.215-2.215c-0.195-0.195-0.512-0.195-0.707,0c-0.06,0.06-0.104,0.134-0.127,0.216l-0.886,3.1 c-0.076,0.265,0.077,0.542,0.343,0.619C11.407,23.993,11.454,24,11.5,24c0.046,0,0.093-0.006,0.137-0.02l3.1-0.885 C14.908,23.047,15.041,22.912,15.086,22.74z M21.772,16.936c0.195-0.195,0.195-0.512,0-0.707l-3-3 c-0.195-0.195-0.512-0.195-0.707,0l-5.011,5.01c-0.195,0.195-0.195,0.512,0,0.707l3,3c0.195,0.195,0.512,0.195,0.707,0 L21.772,16.936z M19.48,11.813c-0.196,0.195-0.196,0.512-0.001,0.707c0,0,0.001,0.001,0.001,0.001l3,3 c0.105,0.088,0.24,0.132,0.377,0.124c0.142-0.009,0.276-0.069,0.377-0.17c1.022-1.024,1.022-2.683,0-3.707 C22.185,10.744,20.504,10.764,19.48,11.813z" stroke="none" fill="currentColor" stroke-width="0" stroke-linecap="round" stroke-linejoin="round"></path>
                                                    </g>
                                                </svg>
                                            </span>
                                            <span class="sidebar-menu-text">Edit Account</span>
                                        </a>
                                    </li>

                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="${pageContext.request.contextPath }/logout" >
                                            <span class="sidebar-menu-icon sidebar-menu-icon--left">
                                                <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 40 40" width="22" height="22">
                                                    <g transform="matrix(1.6666666666666667,0,0,1.6666666666666667,0,0)">
                                                        <path d="M23,0.5H10c-0.552,0-1,0.448-1,1V4c0,0.552,0.448,1,1,1s1-0.448,1-1V3c0-0.276,0.224-0.5,0.5-0.5h10 C21.776,2.5,22,2.724,22,3v18c0,0.276-0.224,0.5-0.5,0.5h-10c-0.276,0-0.5-0.224-0.5-0.5v-1c0-0.552-0.448-1-1-1s-1,0.448-1,1v2.5 c0,0.552,0.448,1,1,1h13c0.552,0,1-0.448,1-1v-21C24,0.948,23.552,0.5,23,0.5z M11.652,14h0.641l0.853,0.854 C13.24,14.948,13.367,15,13.5,15c0.133,0,0.26-0.053,0.354-0.146L14.707,14h0.586l0.853,0.854c0.195,0.196,0.512,0.196,0.707,0.001 c0,0,0.001-0.001,0.001-0.001L17.707,14H19c0.133,0,0.26-0.052,0.354-0.146l1.5-1.5c0.195-0.195,0.195-0.512,0-0.707l-1.5-1.5 C19.26,10.053,19.133,10,19,10h-7.348c-1.105-3.124-4.533-4.761-7.657-3.657S-0.766,10.876,0.338,14s4.533,4.761,7.657,3.657 C9.704,17.053,11.048,15.709,11.652,14z M5.5,12c0,0.828-0.672,1.5-1.5,1.5S2.5,12.828,2.5,12s0.672-1.5,1.5-1.5S5.5,11.172,5.5,12 z" stroke="none" fill="currentColor" stroke-width="0" stroke-linecap="round" stroke-linejoin="round"></path>
                                                    </g>
                                                </svg>
                                            </span>
                                            <span class="sidebar-menu-text">Logout</span>
                                        </a>
                                    </li>

                                </ul>

                            </div>

                            </div>

                        </div>
                    </div>
                <!-- Finish Side Bar Section -->
            </div>
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