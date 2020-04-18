<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <link type="text/css" href="vendor/perfect-scrollbar.css" rel="stylesheet">

    <!-- App CSS -->
    <link type="text/css" href="css/app.css" rel="stylesheet">
    <link type="text/css" href="css/app.rtl.css" rel="stylesheet">

    <!-- Material Design Icons -->
    <link type="text/css" href="css/vendor-material-icons.css" rel="stylesheet">
    <link type="text/css" href="css/vendor-material-icons.rtl.css" rel="stylesheet">

    <!-- Font Awesome FREE Icons -->
    <link type="text/css" href="css/vendor-fontawesome-free.css" rel="stylesheet">
    <link type="text/css" href="css/vendor-fontawesome-free.rtl.css" rel="stylesheet">

    <!-- ion Range Slider -->
    <link type="text/css" href="css/vendor-ion-rangeslider.css" rel="stylesheet">
    <link type="text/css" href="css/vendor-ion-rangeslider.rtl.css" rel="stylesheet">
    
    <style>
        .success {
            color: green;
            margin-left: 40px;
        }
    </style>
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
                    <!-- Edit Account -->
                    <div class="container-fluid page__heading-container">
                        <div class="page__heading d-flex align-items-center justify-content-between">

                            <h1 class="m-0">Edit Account</h1>
                        </div>
                    </div>
                    <span class="success"> ${process } </span><br>
                    <form action="editAccountInstructor" method="post">
					<div class="container-fluid page__container">
                        <div class="card card-form">
                            <div class="row no-gutters">
                                <div class="col-lg-4 card-body">
                                    <p><strong class="headings-color">Basic Information</strong></p>
                                    <p class="text-muted mb-0">Edit your account details and settings.</p>
                                </div>
										
										<div class="col-lg-8 card-form__body card-body">
	                                    	<div class="row">
	                                       	 <div class="col">
	                                            	<div class="form-group">
														<label for="username">User Name :</label>
														<input type="text" name="username" class="form-control" id="username" value="${User.username }" required="required" />
													</div>
	                                        </div>
	                                        </div>
		                                    <div class="form-group">
		                                        <label for="description">Bio / Description</label>
		                                        <input id="description" type="text" name="description" class="form-control" value="${User.description }" required="required" placeholder="Bio / description ..." style="height:90px; width:640px;"/>
		                                    </div>
	                                	</div>
                            </div>
                        </div>
                        <!-- Update password -->
                        <div class="card card-form">
                            <div class="row no-gutters">
                                <div class="col-lg-4 card-body">
                                    <p><strong class="headings-color">Update Your Password</strong></p>
                                    <p class="text-muted mb-0">Change your password.</p>
                                </div>
	                            <div class="col-lg-8 card-form__body card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="password">Old Password</label>        
	                                    		<input type="password" name="password" class="form-control" id="password" required="required" placeholder="Current Password"/>
	                                    	</div>
                                            <div class="form-group">
                                                <label for="newPassword">New Password</label>
                                      			<input type="password" name="newPassword" class="form-control" id="newPassword" required="required" />
                                      			<small class="invalid-feedback">The new password must not be empty.</small>
                                      		</div>
                                      		<div class="form-group">
                                                <label for="email">Email</label>
                                                <input id="email" type="email" name="email"  class="form-control" id="email" value="${User.email }"  required="required">
                                            </div>
                                      		</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-right mb-5">
						<input type="submit" value="Save" class="btn btn-success" />
						</div>
                    </div>
					</form>

                </div>

<!-- sidebar  -->

 <div class="mdk-drawer  js-mdk-drawer" id="default-drawer" data-align="start">
                    <div class="mdk-drawer__content">
                        <div class="sidebar sidebar-light sidebar-left bg-white" data-perfect-scrollbar>

                            <!-- Picture Block -->
                            <div class="sidebar-block p-0 m-0">
                                <div class="d-flex align-items-center sidebar-p-a border-bottom bg-light">
                                    <a href="#" class="flex d-flex align-items-center text-body text-underline-0">
                                        <span class="avatar avatar-sm mr-2">
                                            <span class="avatar-title rounded-circle bg-soft-secondary text-muted"><img src="../images/avatar.png" class="rounded-circle" width="50" alt="avatar"></span>
                                        </span>
                                        <span class="flex d-flex flex-column">
                                            <strong>
                                            <security:authorize access="isAuthenticated()">
											    <security:authentication property="principal.username" /> 
											</security:authorize>
                                            </strong>
                                            <small class="text-muted text-uppercase">Instructor</small>
                                        </span>
                                    </a>
                                </div>
                            </div>
                            <div class="sidebar-block p-0">


                                <div class="sidebar-heading">Instructor</div>

                                <!-- Side Bar Menu -->
                                <ul class="sidebar-menu mt-0">
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="/instructor">
                                            <span class="sidebar-menu-icon sidebar-menu-icon--left">
                                                <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 40 40" width="22" height="22">
                                                    <g transform="matrix(1.6666666666666667,0,0,1.6666666666666667,0,0)">
                                                        <path d="M5,16.751c-0.552,0-1,0.448-1,1s0.448,1,1,1h16c0.552,0,1-0.448,1-1s-0.448-1-1-1H5z M24,14.251c0-0.552-0.448-1-1-1H4.5 c-2.485,0.001-4.499,2.017-4.498,4.502c0.001,2.484,2.014,4.497,4.498,4.498H23c0.552,0,1-0.448,1-1s-0.448-1-1-1H4.5 c-1.381,0-2.5-1.119-2.5-2.5s1.119-2.5,2.5-2.5H23C23.552,15.251,24,14.803,24,14.251z M1,7.751h0.209 c0.224,0,0.42,0.149,0.481,0.364c0.754,2.656,3.519,4.199,6.175,3.445c2.15-0.61,3.634-2.574,3.635-4.809 c0-0.276,0.224-0.5,0.5-0.5s0.5,0.224,0.5,0.5c0.001,2.761,2.24,4.999,5.001,4.999c2.235-0.001,4.198-1.485,4.809-3.635 c0.061-0.215,0.257-0.364,0.481-0.364H23c0.552,0,1-0.448,1-1s-0.448-1-1-1h-0.209c-0.223,0-0.42-0.148-0.481-0.363 c-0.741-2.648-3.489-4.194-6.137-3.453c-1.214,0.34-2.253,1.127-2.909,2.203c-0.119,0.193-0.353,0.282-0.57,0.217 c-0.452-0.139-0.936-0.139-1.388,0c-0.217,0.065-0.451-0.024-0.57-0.217C9.305,1.79,6.241,1.047,3.893,2.479 C2.817,3.135,2.03,4.174,1.69,5.388C1.629,5.603,1.432,5.751,1.209,5.751H1c-0.552,0-1,0.448-1,1S0.448,7.751,1,7.751z M17.5,3.751 c1.657,0,3,1.343,3,3s-1.343,3-3,3s-3-1.343-3-3S15.843,3.751,17.5,3.751z M6.5,3.751c1.657,0,3,1.343,3,3s-1.343,3-3,3 s-3-1.343-3-3S4.843,3.751,6.5,3.751z" stroke="none" fill="currentColor" stroke-width="0" stroke-linecap="round" stroke-linejoin="round"></path>
                                                    </g>
                                                </svg>
                                            </span>
                                            <span class="sidebar-menu-text">Dashboard</span>
                                        </a>
                                    </li>

                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="/course/displayCourses">
                                            <span class="sidebar-menu-icon sidebar-menu-icon--left">
                                                <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 40 40" width="22" height="22">
                                                    <g transform="matrix(1.6666666666666667,0,0,1.6666666666666667,0,0)">
                                                        <path d="M24,1.5C24,0.672,23.328,0,22.5,0h-21C0.672,0,0,0.672,0,1.5v21C0,23.328,0.672,24,1.5,24h21c0.828,0,1.5-0.672,1.5-1.5 V1.5z M10,21.5c0,0.276-0.224,0.5-0.5,0.5h-3C6.224,22,6,21.776,6,21.5v-6C6,15.224,6.224,15,6.5,15h3c0.276,0,0.5,0.224,0.5,0.5 V21.5z M15.5,21.5c0,0.276-0.224,0.5-0.5,0.5h-2c-0.276,0-0.5-0.224-0.5-0.5v-5c0-0.276,0.224-0.5,0.5-0.5h2 c0.276,0,0.5,0.224,0.5,0.5V21.5z M20.5,21.5c0,0.276-0.224,0.5-0.5,0.5h-2c-0.276,0-0.5-0.224-0.5-0.5v-6 c0-0.276,0.224-0.5,0.5-0.5h2c0.276,0,0.5,0.224,0.5,0.5V21.5z M23,11.75c0,0.414-0.336,0.75-0.75,0.75H1.75 C1.336,12.5,1,12.164,1,11.75S1.336,11,1.75,11H3c0.276,0,0.5-0.224,0.5-0.5V3.487C3.487,3.232,3.683,3.014,3.938,3h2.624 C6.817,3.014,7.013,3.232,7,3.487V10.5C7,10.776,7.224,11,7.5,11h1C8.776,11,9,10.776,9,10.5V6c0.012-0.288,0.254-0.511,0.542-0.5 h2.166c0.288-0.011,0.53,0.212,0.542,0.5v4.5c0,0.276,0.224,0.5,0.5,0.5h3.106c0.138,0,0.25-0.112,0.25-0.25 c0-0.029-0.005-0.059-0.015-0.086l-2.565-7c-0.079-0.229,0.043-0.479,0.272-0.558c0.007-0.003,0.015-0.005,0.023-0.007l1.8-0.577 c0.242-0.082,0.505,0.039,0.6,0.276l2.886,7.871c0.072,0.197,0.259,0.328,0.469,0.328h2.674c0.414,0,0.75,0.336,0.75,0.75 c0,0.001,0,0.003,0,0.004V11.75z" stroke="none" fill="currentColor" stroke-width="0" stroke-linecap="round" stroke-linejoin="round"></path>
                                                    </g>
                                                </svg>
                                            </span>
                                            <span class="sidebar-menu-text">My Courses</span>
                                        </a>
                                    </li>

                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="/editInstructor">
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
                                        <a class="sidebar-menu-button" href="${pageContext.request.contextPath }/logout">
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
</div>
</div>
</div>
    <!-- jQuery -->
    <script src="vendor/jquery.min.js"></script>

    <!-- Bootstrap -->
    <script src="vendor/popper.min.js"></script>
    <script src="vendor/bootstrap.min.js"></script>

    <!-- Perfect Scrollbar -->
    <script src="vendor/perfect-scrollbar.min.js"></script>

    <!-- DOM Factory -->
    <script src="vendor/dom-factory.js"></script>

    <!-- MDK -->
    <script src="vendor/material-design-kit.js"></script>

    <!-- Range Slider -->
    <script src="vendor/ion.rangeSlider.min.js"></script>
    <script src="js/ion-rangeslider.js"></script>

    <!-- App -->
    <script src="js/toggle-check-all.js"></script>
    <script src="js/check-selected-row.js"></script>
    <script src="js/dropdown.js"></script>
    <script src="js/sidebar-mini.js"></script>
    <script src="js/app.js"></script>

    <!-- App Settings (safe to remove) -->
    <script src="js/app-settings.js"></script>




</body>
<!--     <img alt="" src="images/256_daniel-gaffey-1060698-unsplash.jpg">here -->
<!--     <img alt="" src="static/images/256_daniel-gaffey-1060698-unsplash.jpg">here -->
<!--     <img alt="" src="./images/256_daniel-gaffey-1060698-unsplash.jpg">here -->
<!--     <img alt="" src="../images/256_daniel-gaffey-1060698-unsplash.jpg">here -->


</html>