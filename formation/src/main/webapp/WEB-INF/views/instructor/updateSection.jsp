<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>

<jsp:include page="head.jsp" />
<title>Update section</title>

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
                                <form action="/course/editSection?id=${Section.id}" method="post">
                                    <div class="card">
                                        <div class="card-form__body card-body">

                                            <div class="form-group">
                                                <label for="fname">Course Title</label>
                                                <h4>${course.name}</h4>
                                            </div>

                                            <div class="form-group">
                                                <label for="chapter">Title</label>
                                                <input type="text" name="chapter" value="${Section.chapter }" class="form-control" id="chapter" required="required" />
                                            </div>

                                            <div class="form-group">
                                                <label for="description">Description</label>
                                                <input name="description" value="${Section.description }" class="form-control" id="description" style="height:90px; width:640px;"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="duration">Duration</label>
                                                <input type="text" name="duration" value="${Section.duration }" class="form-control" id="duration " required="required" />
                                            </div>
                                            <div class="form-group">
                                                <label for="price">Price</label>
                                                <input type="text" name="Price" value="${Section.price }" class="form-control" id="price" required="required" />
                                            </div>
                                        </div>
                                        <div class="card-body text-center">

                                            <button type="submit" class="btn btn-success">Save Changes</button>
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