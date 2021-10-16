<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<meta charset="UTF-8">
	<title>Welcome</title>
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
	<%-- <c:if test="${idea.name != null}"> --%>
		<h1>Welcome, <c:out value="${user.firstName}" /></h1>
	
		
		 <div>
			<h3>Pets</h3>
			<table class="table">
			
			<thead>
				<tr class="table-dark">
				
					<td>Name</td>
					<td>Type</td>
					<td>Breed</td>
					<td>Color</td>
					<td>Age</td>
					<td>Owner</td>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${allPets}" var="pet">
					<tr class="table-info">
					
						<td><a href="/pets/${pet.id}/edit"><c:out value="${pet.name}"/></a></td>
						<td><c:out value="${pet.type}"></c:out></td>
						<td><c:out value="${pet.breed}"></c:out></td>
						<td><c:out value="${pet.color}"></c:out></td>
						<td><c:out value="${pet.age}"></c:out></td>
						<td><c:out value="${pet.owner}"></c:out></td>
						
						
						
					</tr>
				</c:forEach>
			</tbody>
			
			</table>
		</div>
		<a class="btn btn-primary" href="/pets/new">Create a Pet</a> |
		<a class="btn btn-primary" href="/logout">Logout</a>
	<%-- </c:if> --%>
</body>
</html>