<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" ></link>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<body>
	
	<div class="mt-5 col-10 offset-1">
		<form
			method="POST"
			action="${ pageContext.request.contextPath }/auth/users/store">

			<div class="form-group">
				<label for="name">Name</label>
			    <input type="text" placeholder="Vui lòng điền tên!" class="form-control" id="username" name="username" autocomplete="off">
			    <small id="name_error" class="form-text text-danger"></small>
			</div>
			<div class="form-group">
				<label for="email">Email</label>
			    <input type="email" placeholder="Vui lòng điền email!" class="form-control" id="email" name="email" autocomplete="off">
			    <small id="email_error" class="form-text text-danger"></small>
			</div>
			<div class="form-group">
				<label for="password">Password</label>
			    <input type="password" placeholder="Vui lòng điền pass!" class="form-control" id="password" name="password" autocomplete="off">
			    <small id="password_error" class="form-text text-danger"></small>
			</div>
	
			<div class="form-group">
				<label for="avatar">Photo</label>
			    <input type="file" class="form-control" id="photo" name="photo">
			    <small id="photo_error" class="form-text text-danger"></small>
			</div>

			<div class="form-group">
				<input hidden="true" value="1" type="number" class="form-control"
					id="admin" name="admin" autocomplete="off">
			</div>
			
			<div class="form-group">
				<input hidden="true" value="1" type="number" class="form-control"
					id="activated" name="activated" autocomplete="off">
			</div>

			<div class="form-group mt-3">
				<button class="btn btn-primary">Submit</button>
				<button type="reset" class="btn btn-danger">Clear</button>
			</div>
		</form>
	</div>
</body>
</html>