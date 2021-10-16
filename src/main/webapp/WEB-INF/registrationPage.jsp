<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Registration Page</title>
    <style>
    	h1{
    	color: greenyellow;
    	background-color: blue;
    	padding-left: 275px;
    	}
    	body{
    	background-color: azure;
    	}
    	.container {
    	background-color: greenyellow;
    	margin: 130px;
    	}
    	.form-control {
    	background-color: azure;
    	}
    	p {
    	padding-left: 150px;
    	}
    	.btn{
    	padding-left:10px;
    	margin-right:125px;
    	margin-left:125px;
    	}
    </style>
</head>
<body>
	<div class="container">
	    <h1 class="navbar">Register!</h1>
	    
	    <p><form:errors path="user.*"/></p>
	    
	    <form:form class="form-control" method="POST" action="/registration" modelAttribute="user">
	        <p>
	            <form:label path="firstName">First Name:</form:label>
	            <form:input  path="firstName"/>
	        </p>
	        <p>
	            <form:label path="lastName">Last Name:</form:label>
	            <form:input path="lastName"/>
	        </p>
	        <p>
	            <form:label path="email">Email:</form:label>
	            <form:input type="email" path="email"/>
	        </p>
	        <p>
	            <form:label path="city">City:</form:label>
	            <form:input path="city"/>
	        </p>
	        <p>
	            <form:label path="state">State:</form:label>
	            <form:input path="state"/>
	        </p>
	        <p>
	            <form:label path="password">Password:</form:label>
	            <form:password path="password"/>
	        </p>
	        <p>
	            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
	            <form:password path="passwordConfirmation"/>
	        </p>
	        <input  class="btn btn-primary"type="submit" value="Register"/> | <a class="btn btn-primary" href="/login">Login</a>
	    </form:form>
  	
  </div>
</body>
</html>