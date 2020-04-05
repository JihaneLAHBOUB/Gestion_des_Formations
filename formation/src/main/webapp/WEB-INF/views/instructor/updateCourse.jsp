<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html dir="ltr">
<head>

<jsp:include page="head.jsp" />
<title>Edit Course</title>

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
							<form action="/course/editCourse?id=${course.id }" method="post">
								<div class="card">
									
										<div class="card-form__body card-body">

											<div class="form-group">
												<label for="name">Title</label>
												<input type="text" name="name" value="${course.name }" class="form-control" id="name" required="required" />
											</div>
											
                                            <div class="form-group">
												<label for="description">Description</label>
<%-- 												<textarea rows="3" name="description" value="${course.description }" class="form-control" id="description" required="required"></textarea> --%>
												<input type="text" name="description" value="${course.description }" class="form-control" id="description" required="required" style="height:90px; width:640px;"/>
											</div>
											
											
											<div class="form-group">
												<label for="objectifs">Objectifs</label>
												<input name="objectifs" value="${course.objectifs }" class="form-control" id="objectifs" required="required" 
												       style="height:90px; width: 640px;" />
											</div>
											
											<div class="form-group">
												<label for="requirements">Requirements</label>
												<input name="requirements" value="${course.requirements }" class="form-control" id="requirements" required="required" style="height:90px; width:640px;"/>
											</div>
										<div class="row">
                                            <div class="col">
												<div class="form-group">
													<label for="location">Location</label>
													<input type="text" name="location" value="${course.location }" class="form-control" id="location" required="required" />
												</div>
											 </div>
											<%-- <div class="form-group">
												<label for="date">Date</label> 
												<input type="text" name="date" value="${course.date }" class="form-control" id="date" required="required" />
											</div> --%>
											<div class="col">
                                                 <div class="form-group">
                                                     <label for="date">Date</label>
                                                     <input type="text" name="date" value="${course.date }" class="form-control" id="date" data-toggle="daterangepicker"
                                                         data-daterangepicker-drops="up" data-daterangepicker-locale-format="DD/MM/YYYY" data-daterangepicker-single-date-picker="true" />
                                                 </div>
                                             </div>
                                          </div>    
                                          
                                      <div class="row">
                                            <div class="col">
												<div class="form-group">
													<label for="placesNumber">Places Number</label>
													<input type="text" name="placesNumber" value="${course.placesNumber }" class="form-control" id="placesNumber" required="required" />
												</div>
											</div>
											<div class="col">
												<div class="form-group">
													<label for="price">Global Price</label> <input type="text" name="price" value="${course.price }" class="form-control"
														id="price" required="required"  placeholder="MAD"/>
												</div>
											</div>
											</div>
											
<!-- 												<div class="form-group"> -->
<%-- 													<label for="available">Available</label> <input type="text" name="available" value="${course.available }" --%>
<!-- 														class="form-control" id="available" required="required" /> -->
<!-- 												</div> -->
											
											<div class="form-group">
                                                <label for="available">Available</label>
                                                <select name="available" id="available" class="custom-select w-auto">
	                                                    <option  value="true" ${course.available == true ? 'selected'  : '' } >Yes </option>
	                                                    <option  value="false" ${course.available == false ? 'selected'  : '' } >No </option>                                 
                                                </select>
                                                    
                                            </div>
                                            
										</div>
										</div>
										<div class="card-body text-center">
											<button type="submit" class="btn btn-success">Save Changes</button>
										</div>
									</form>

								</div>
								
								<div class="col-md-4">
								<!-- Start Lessons -->
								<div class="card">
									<div
										class="card-header card-header-large bg-light d-flex align-items-center">
										<div class="flex">
											<h4 class="card-header__title">Lessons</h4>
											<div class="card-subtitle text-muted">Manage Lessons</div>
										</div>
										<div class="ml-auto">
											<a href="/course/ajouterSection?id=${course.id}" class="btn btn-primary">Add Lesson<i class="material-icons">add</i>
											</a>
										</div>
									</div>

									<!-- Course Lessons -->
									<c:forEach items="${listSections }" var="section">
										<ul class="list-group list-group-fit">
											<li class="list-group-item">
												<div class="media">
												
												<div class="media-left">
                                                        <a href="deleteSection?id=${section.id}"  onclick="return confirm('Are you sure you want to delete this Section?')" style="color: red;">
                                                            <i class="material-icons">delete_forever</i>
                                                        </a>                                                  
                                                    </div>
                                                    
													<div class="media-left">									
														<a href="/course/updateSection?id=${section.id}" style="color: black;">
														    <i class="material-icons">edit</i>
														</a>
													</div>
													
													<div class="media-body">
														<h4><a href="#">${section.chapter}</a></h4>
														<p><a href="#">${section.description} </a></p>
													</div>
													
													<div class="media-right">
														<p><small class="text-muted">${section.duration} min</small></p>
														<p><small class="text-muted">${section.price} MAD</small></p>
													</div>
												</div>
											</li>
										</ul>
									</c:forEach>
								</div>
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