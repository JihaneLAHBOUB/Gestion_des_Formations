<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>

<jsp:include page="head.jsp" />
<title>Add Section</title>

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
							<div class="col-md-8">
								<!-- Start Basic Section Informations -->
								
								<form action="/course/saveSection?id=${idCourse}" method="post">
									<div class="card">
										<div class="card-form__body card-body">

											<div class="form-group">
												<label for="name">Course Title</label>
												<h4>${courseName}</h4>
											</div>

											<div class="form-group">
												<label for="chapter">Title</label>
												<input id="chapter" type="text" name="chapter" class="form-control" placeholder="Title goes here" required="required" />
											</div>

											<div class="form-group">
												<label for="description">Description</label>
												<textarea id="description" rows="3" name="description" class="form-control" placeholder="Please enter a description"></textarea>
											</div>
											<div class="form-group">
												<label for="duration">Duration</label>
												<input id="duration" type="number" name="duration" class="form-control" placeholder="Duration of lesson in minutes" required="required" />
											</div>
											<div class="form-group">
												<label for="price">Price</label>
												<input type="text" name="price" class="form-control" placeholder="Price of lesson in MAD" id="price" required="required" />
											</div>
										</div>
										<div class="card-body text-center">
											<button type="submit" class="btn btn-success">Save</button>
										</div>

									</div>
								</form>
								
							</div>						
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