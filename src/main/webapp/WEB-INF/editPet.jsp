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
<title>Edit Pet</title>
<style>
	h1{
    	color: greenyellow;
    	background-color: blue;
    	padding-left: 245px;
    	}
	body{
    	background-color: azure;
    	}
    	.container {
    	background-color: greenyellow;
    	margin: 120px;
    	}
    	.form-control {
    	background-color: azure;
    	}
    	p {
    	padding-left: 150px;
    	}
    	.btn{
    	padding-left:10px;
    	margin-right:71px;
    	margin-left:90px;
    	}
</style>
</head>
<body>
	<div class="container">
		
			<h1>Edit <c:out value="${pet.name}"/></h1>
		
			<form:form class="form-control" action="/pets/${pet.id}/edit" method="post" modelAttribute="pet">
			
				<p>
				
					<form:label path="type">Type: </form:label>
					<form:errors path="type"/>
					<form:input path="type"/>
					
				</p>
				
				<p>
				
					<form:label path="name">Name: </form:label>
					<form:errors path="name"/>
					<form:input path="name"/>
					
				</p>
				
				<p>
				
					<form:label path="breed">Breed: </form:label>
					<form:errors path="breed"/>
					<form:input path="breed"/>
					
				</p>
				<p>
				
					<form:label path="color">Color: </form:label>
					<form:errors path="color"/>
					<form:input path="color"/>
					
				</p>
				
				<p>
				
					<form:label path="age">Age: </form:label>
					<form:errors path="age"/>
					<form:input type="number" path="age"/>
					
				</p>
			
				<p>
				
					<form:label path="owner">Owner: </form:label>
					<form:errors path="owner"/>
					<form:input path="owner"/>
					
				</p>
				<a href="/pets/${pet.id }/edit"><button class="btn btn-primary">Update Pet</button></a> | 
				<a class="btn btn-primary" href="/home">Home</a>
			</form:form>
		
	</div>
	
</body>
</html>