<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Show Pet</title>
<style>
	h1{
    	color: greenyellow;
    	background-color: blue;
    	padding-left: 275px;
    	}
	body{
    	background-color: azure;
    	}
    h3 {
    	color: blue;
    	}
    .btn{
    	padding-left:10px;
    	margin-right:125px;
    	margin-left:125px;
    	}
    	
	</style>
</head>
<body>
	<div>
		<h1><c:out value="${pet.name}"/></h1>
		<p>Owner: <c:out value="${user.firstName}"></c:out></p>
		<p>Type: <c:out value="${pet.type}"/></p>
		<p>Breed: <c:out value="${pet.breed}"/></p>
		<p>Color: <c:out value="${pet.color}"/></p>
		<p>Age: <c:out value="${pet.age}"/></p>
	</div>

</body>
</html>