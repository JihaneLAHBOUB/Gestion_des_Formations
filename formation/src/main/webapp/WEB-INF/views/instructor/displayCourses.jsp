<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>

  <jsp:include page="head.jsp" />
  <title>All Courses</title>

</head>

<body class="layout-default">

	<!-- Header Layout -->
	<div class="mdk-header-layout js-mdk-header-layout">

		<div id="header" class="mdk-header js-mdk-header m-0" data-fixed>
			<div class="mdk-header__content">
				<div
					class="navbar navbar-expand-sm navbar-main navbar-dark bg-primary pl-md-0 pr-0" id="navbar" data-primary>				
				</div>
			</div>
		</div>

		<!-- Header Layout Content -->
		<div class="mdk-header-layout__content">
			<div class="mdk-drawer-layout js-mdk-drawer-layout" data-push data-responsive-width="992px">
				<div class="mdk-drawer-layout__content page">

					<div class="container-fluid page__heading-container">
						<div
							class="page__heading d-flex flex-column flex-md-row align-items-center justify-content-center justify-content-lg-between text-center text-lg-left">
							<h1 class="m-lg-0">Instructor Courses</h1>
							<a href="/course/addCourse" class="btn btn-success ml-lg-3">New Course <i class="material-icons">add</i>
							</a>
						</div>
					</div>

					<div class="container-fluid page__container">
					
						<form action="#" class="mb-2">
							<div class="d-lg-flex">
								<div class="search-form mb-3 mr-3-lg search-form--light">
									<input type="text" class="form-control" placeholder="Search courses" id="searchSample02">
									<button class="btn" type="button"><i class="material-icons">search</i></button>
								</div>
							</div>
						</form>
						
						<!-- Courses Section -->

						<div class="row">
							<c:forEach items="${listCourses }" var="course">
								<div class="col-md-6">
									<div class="card">
										<div class="card-body">
											<div class="d-flex flex-column flex-sm-row">
											
											
											<a href="#" class="avatar mb-3 w-xs-plus-down-100 mr-sm-3">
												<img alt="Card image cap" src="../images/course.png" class="avatar-course-img">
											</a>
											
												<div class="flex" style="min-width: 200px;">
													<div class="d-flex">
														<div>
															<h4 class="card-title mb-1">
															
     <!-- To See Details Course -->					   			<a href="/course/getCourse?id=${course.id}">${course.name }</a>
																
															</h4>
															<p class="text-muted">${course.description }.</p>
														</div>
														<div class="dropdown ml-auto">
															<a href="#" class="dropdown-toggle text-muted" data-caret="false" data-toggle="dropdown">
															<i class="material-icons">more_vert</i>
															</a>
															<div class="dropdown-menu dropdown-menu-right">
																<a class="dropdown-item" href="/course/updateCourse?id=${course.id}">Edit Course</a>
																
																<div class="dropdown-divider"></div>
																<a class="dropdown-item" href="/course/checkEnrollement?id=${course.id}">Enrollments</a>
																
																<div class="dropdown-divider"></div>
																<a href="deleteCourse?id=${course.id}" onclick="return confirm('Are you sure you want to delete this Course?')"
																	class="dropdown-item text-danger">Delete</a>
															</div>
														</div>
													</div>
													<div class="d-flex align-items-end">
														<div class="d-flex flex flex-column mr-3">
															<div class="d-flex align-items-center py-2">
																<span style="color: red"><b>${course.price } MAD</b></span>
																<small class="ml-auto">${course.date }</small>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				

				<jsp:include page="menu.jsp" />
				
		</div>
	</div>
</div>

				<jsp:include page="script.jsp" />
</body>

</html>