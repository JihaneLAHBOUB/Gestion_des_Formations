<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<a href="/formateur">Formateur</a>
<a href="/beneficiaire">Bénéficiaire</a>
<a href="/profile">Profile</a>

	<form:form action="${pageContext.request.contextPath }/logout" method="post">
		<button type="submit">Logout</button>
	</form:form>

<h2>Only authenticated people can see their profiles</h2>
<security:authorize access="isAuthenticated()">
    authenticated as <security:authentication property="principal.username" /> 
</security:authorize>
</body>
</html>