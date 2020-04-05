<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>

  <jsp:include page="head.jsp" />
  <title>Add Course</title>
<!-- DateRangePicker -->
    <link type="text/css" href="../vendor/daterangepicker.css" rel="stylesheet">
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

					<div class="container-fluid page__container">
						<div class="row">
							<!-- Start Basic Course Informations -->
							<div class="col-md-8">
								<div class="card">
									<form action="/course/saveCourse" method="post">
										<div class="card-form__body card-body">

											<div class="form-group">
												<label for="name">Title</label> 
												<input type="text" name="name" class="form-control" id="name" required="required">
											</div>

	                                        <div class="form-group">
												<label for="description">Description</label>
												<textarea rows="3" name="description" class="form-control" id="description" required="required"></textarea>
											</div>
											
											<div class="form-group">
												<label for="objectifs">Objectifs</label>
												<textarea rows="3" name="objectifs" class="form-control" id="objectifs" required="required"></textarea>
											</div>
											
											<div class="form-group">
												<label for="requirements">Requirements</label>
												<textarea rows="3" name="requirements" class="form-control" id="requirements" required="required"></textarea>
											</div>

											<div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="location">Location</label>
                                                        <input type="text" name="location" class="form-control" id="location" required="required" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="date">Date</label>
                                                        <input type="text" name="date" class="form-control" id="date" data-toggle="daterangepicker"
                                                            data-daterangepicker-drops="up" data-daterangepicker-locale-format="DD/MM/YYYY" data-daterangepicker-single-date-picker="true" />
                                                    </div>
                                                </div>
                                            </div>

											<div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="placesNumber">Places Number</label>
                                                        <input type="text" name="placesNumber" class="form-control" id="placesNumber" required="required" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="price">Global Price</label>
                                                        <input type="text" name="price" class="form-control" id="price" placeholder="MAD" required="required"/>
                                                    </div>
                                                </div>
                                            </div>

										</div>
										<div class="card-body text-center">
											<button type="submit" class="btn btn-success">Save</button>
										</div>
									</form>

								</div>
							</div>
							<div class="col-md-4">								
								<!-- Start Lessons -->
							</div>
						</div>
					</div>
				</div>

				<jsp:include page="menu.jsp" />
				
		</div>
     </div>   
</div>

				<jsp:include page="script.jsp" />
				<!-- DateRangePicker -->
                <script src="../vendor/moment.min.js"></script>
                <script src="../vendor/daterangepicker.js"></script>
                <script src="../js/daterangepicker.js"></script>
</body>

</html>