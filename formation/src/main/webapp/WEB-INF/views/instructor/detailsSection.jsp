<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="head.jsp" />
<title>Details Lesson</title>

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

                                    <div class="card-form__body card-body">


                                        <label style="color: black;">Title</label>
                                        <div class="card-body">
                                            <p>${ section.chapter }</p>
                                        </div>

                                        <label style="color: black; ">Description</label>
                                        <div class="card-body">
                                            <p>${ section.description }</p>
                                        </div>

                                        <label style="color: black; ">Duration</label>
                                        <div class="card-body">
                                            <p>${ section.duration }</p>
                                        </div>   

                                        <label style="color: black;">Price</label>
                                        <div class="card-body">
                                            <p>${ section.price }</p>

                                        </div>
                                        
                                    </div>
                                    <div class="card-body text-center">

                                        <button type="submit" class="btn btn-primary"><i class="fa fa-arrow-left"></i> Back to Section List</button>
                                    </div>
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