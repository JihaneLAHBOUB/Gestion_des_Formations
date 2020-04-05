<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="ISO-8859-1">

  <jsp:include page="head.jsp" />
  <title>Student Enrollments</title>
  
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
                    
                    <div class="container-fluid page__heading-container">
                        <div class="page__heading d-flex flex-column flex-md-row align-items-center justify-content-center justify-content-lg-between text-center text-lg-left">
                           <form action="/enroll/sendMail?id=${idCourse }" method="post">
	                            <h2 class="m-lg-0"><b>Student Enrollments</b></h2>                       
<%-- 	                            <a href="/enroll/sendMail?id=${idCourse }" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#modal-success">Send Mail <i class="material-icons">mail_outline</i></a> --%>
                        		<button type="submit" class="btn btn-success" data-toggle="modal" data-target="#modal-success" style="float: right;margin-right: -700px;">Send Mail</button>
                        	</form>
                        </div>
                    </div>

                    <div class="container-fluid page__container">

                        <div class="d-flex justify-content-around pb-4">
                            <div class="row">
                            
								<c:forEach items="${listUsers }" var="user">
	                                <div class="col-md-6 col-lg-4">
	                                    <div class="card card__course card__course__animate">                                       
	                                            <img src="../images/course_lms.png" style="width:100%;" alt="Card image cap">                                           
	                                        
	                                        <div class="p-3 text-center border-bottom">                                           
	                                            <div class="d-flex justify-content-around">
	
	
	                                                <div class="mb-2 text-muted d-flex align-items-center align-self-center">
	                                                    
	                                                    <small class="mr-3 d-flex align-items-center">
	                                                        <i class="material-icons">contact_mail</i>
	                                                        <span class="ml-2" style="color:black"> ${user.email} </span>
	                                                    </small>
	                                                   
	                                                </div>
	                                            </div>
	
	                                        </div>
	                                        <div class="p-3 text-center">
	
	                                            <strong class="h5 m-0 text-primary">${user.username}</strong>
	
	                                        </div>
	                                    </div>
	                                </div>
	                                 
	  							</c:forEach>

                                
                            </div>
                        </div>


                    </div>
                </div>
                
                	<jsp:include page="menu.jsp" />
				
		</div>
     </div>   
</div>
				<jsp:include page="script.jsp" />
				
				<!-- App Settings (safe to remove) -->
    <script src="../js/app-settings.js"></script>

	    <!-- Success Alert Modal -->
	    <div id="modal-success" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	        <div class="modal-dialog modal-dialog-centered modal-sm">
	            <div class="modal-content bg-success">
	                <div class="modal-body text-center p-4">
	                    <i class="material-icons icon-40pt text-white mb-2">check</i>
	                    <h4 class="text-white">Well Done!</h4>
	                    <p class="text-white mt-3" style="font-weight: bold;"> ${msg } </p>
	                    <button type="button" class="btn btn-light my-2" data-dismiss="modal">Close</button>
	                </div> <!-- // END .modal-body -->
	            </div> <!-- // END .modal-content -->
	        </div> <!-- // END .modal-dialog -->
	    </div> <!-- // END .modal -->
</body>
</html>