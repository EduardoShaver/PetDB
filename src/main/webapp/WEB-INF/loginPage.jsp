<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
    	h1{
    	color: greenyellow;
    	background-color: blue;
    	padding-left: 300px;
    	}
    	.body{
    	background-color: azure;
    	}
    	.container {
    	background-color: greenyellow;
    	margin: 150px;
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
<body class="body">
	<div class="container">

	    <h1 class="navbar">Login</h1>
	    <p><c:out value="${error}" /></p>
	    <form class="form-control" method="post" action="/login">
	        <p>
	            <label for="email">Email</label>
	            <input type="text" id="email" name="email"/>
	        </p>
	        <p>
	            <label for="password">Password</label>
	            <input type="password" id="password" name="password"/>
	        </p>
	        <input class="btn btn-primary" type="submit" value="Login!"/> | <a class="btn btn-primary" href="/registration">Register!</a>
	    </form>   
     </div>
    
</body>
</html>