<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>

<jsp:include page="head.jsp" />
<title>Details Course</title>

</head>
<body class="layout-default">

    <!-- Header Layout -->
    <div class="mdk-header-layout js-mdk-header-layout">

        <div id="header" class="mdk-header js-mdk-header m-0" data-fixed>
            <div class="mdk-header__content">
                <div class="navbar navbar-expand-sm navbar-main navbar-dark bg-primary pl-md-0 pr-0" id="navbar" data-primary>
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

                                    	<div class="card-header">
                                   	        <h4 class="card-header__title text-center" style="font-size: xx-large;">${ course.name }</h4>
                                        </div>
                                        
	                                        <a href="/course/updateCourse?id=${course.id}" style="color: red;">
	                                        	<i class="material-icons" style="margin-left: 640px;" >edit</i>
	                                        </a>
                                       
                                        
                                        <div class="tab-content">
                                        <div class="tab-pane active" id="overview">
                                            <div class="card-body" id="course_content">

                                                <!-- <h4>Title</h4>
                                                <ul>
                                                    <li>${ course.name }</li>
                                                </ul> -->

                                                <h4 style="font-size: larger;">Creation Date</h4>
                                                <ul>
                                                    <li>${ course.createdOn }</li>
                                                </ul>
                                         		<h4 style="font-size: larger;">Description</h4>
                                                <ul>
                                                    <li>${ course.description }</li>
                                                </ul>
												<h4 style="font-size: larger;">Objectifs</h4>
                                                <ul>
                                                    <li class="confirm">${ course.objectifs }</li>
                                                </ul>

                                                <h4 style="font-size: larger;">Requirements</h4>
                                                <ul>
                                                    <li class="chevron">${ course.requirements }</li>

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                     <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Location</th>
                                                <th>Date</th>
                                                <th>Place Number</th>
                                                <th>Global Price</th>
                                                <th>Available</th>

                                            </tr>
                                        </thead>
                                        <tbody class="list">
                                            <tr> 
                                            	<td>${ course.location }</td>
												<td>${course.date}</td>
												<td>${course.placesNumber}</td>
												<td>${course.price}</td>
                                                <td>${course.available}</td>

                                            </tr>
                                        </tbody>
                                    </table>
									
                                    <div class="card-body text-center">

                                        <a href="/course/displayCourses"><i class="fa fa-arrow-left"></i> Back to Course List</a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <!-- Start Lessons -->
                                <div class="card">
                                    <div class="card-header card-header-large bg-light d-flex align-items-center">
                                        <div class="flex">
                                            <h4 class="card-header__title">Lessons</h4>
                                            <div class="card-subtitle text-muted">Manage Lessons</div>                                            
                                        </div>
                                       <div class="ml-auto">
											<a href="/course/addSection?id=${ course.id }" class="btn btn-primary">Add Lesson<i class="material-icons">add</i>
											</a>
										</div>
                                    </div>

                                    <!-- Course Lessons -->
                                    <c:forEach items="${listSections }" var="section">
                                        <ul class="list-group list-group-fit">
                                            <li class="list-group-item">
                                                <div class="media">
                                                    <div class="media-left">                                                        
                                                         <i class="material-icons text-light-gray">list</i>                                                       
                                                    </div>

                                                    <div class="media-body">
 <!-- To See Details Section -->                        <h4><a href="#">${section.chapter}</a></h4>
 														<p><a href="#">${section.description} </a></p>
                                                    </div>
                                                    <div class="media-right">
                                                        <p><small class="text-muted">${section.duration} min</small></p>
                                                        <p><small class="text-muted">${section.price} MAD</small></p>
                                                    </div>
                                                    
                                                </div>
                                            </li>
<!--                                             <li class="list-group-item"> -->
<!--                                                 <div class="media"> -->
                                                    
<!--                                                     <div class="media-body"> -->
<%-- 								                        <a href="#">${section.description} </a> --%>
<!--                                                     </div> -->
<!--                                                     <div class="media-right"> -->
<%--                                                         <small class="text-muted">${section.price} MAD</small> --%>
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </li> -->
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
	
</body>
</html>