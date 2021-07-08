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
	<nav class="navbar navbar-expand-lg navbar-light bg-light px-5">
		<img src="${ pageContext.request.contextPath }/views/stogare/bia.jpg"
			class="rounded-circle" alt="Cinque Terre" width="100" height="80">

		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
					href="${ pageContext.request.contextPath }/user/listproduct">Trang Chủ</a></li>
					<c:if test="${sessionScope.user.getAdmin() == 0 }">
				<li class="nav-item active"><a class="nav-link"
					href="${ pageContext.request.contextPath }/admin/users">Users</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${ pageContext.request.contextPath }/admin/category">Categories</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${ pageContext.request.contextPath }/admin/product">Products</a>
				</li>
				<li class="nav-item active"><a class="nav-link"
					href="${ pageContext.request.contextPath }/admin/order">Order</a></li>
				</c:if>
				<c:if test="${sessionScope.user != null }">
					<li class="nav-item"><a class="nav-link"
						href="${ pageContext.request.contextPath }/logout">Logout</a></li>
				</c:if>

			</ul>
		</div>
	</nav>

	<div class="mt-5 col-10 offset-1">
		<form
			method="POST"
			action="${ pageContext.request.contextPath }/admin/users/store">

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
			    <input type="file" placeholder="Vui lòng chọn ảnh!" class="form-control" id="photo" name="photo">
			    <small id="photo_error" class="form-text text-danger"></small>
			</div>
		<div class="form-group">
				<label for="admin">Tài Khoản</label>
				<select name="admin" id="admin" class="form-control" required>
					<option selected disabled>Tài Khoản</option>
					<option value="1">User</option>
					<option value="0">Admin</option>
				</select>
			    <small id="admin_error" class="form-text text-danger"></small>
			</div>
			<div class="form-group">
				<label for="activated">Trạng Thái</label>
				<select name="activated" id="activated" class="form-control" required>
					<option selected disabled>Trạng Thái</option>
					<option value="1">Đang hoạt động</option>
					<option value="0">Vô hiệu hóa</option>
				</select>
			    <small id="activated_error" class="form-text text-danger"></small>
			</div>
			
			<div class="form-group mt-3">
				<button class="btn btn-primary">Submit</button>
				<button type="reset" class="btn btn-danger">Clear</button>
			</div>
		</form>
	</div>
</body>
</html>