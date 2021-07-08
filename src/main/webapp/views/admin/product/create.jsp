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
			action="${ pageContext.request.contextPath }/admin/product/store"
			>
			
			<div class="form-group">
				<label for="name">Name</label>
			    <input type="text" placeholder="Vui lòng điền tên!" class="form-control" id="name" name="name" autocomplete="off">
			    <small id="name_error" class="form-text text-danger"></small>
			</div>
			<div class="form-group">
				<label for="image">Image</label>
			    <input type="file" class="form-control" id="image" name="image" autocomplete="off">
			    <small id="image_error" class="form-text text-danger"></small>
			</div>
			<div class="form-group">
				<label for="price">Price</label>
			    <input type="text" placeholder="Vui lòng điền giá!" class="form-control" id="price" name="price" autocomplete="off">
			    <small id="price_error" class="form-text text-danger"></small>
			</div>
		
			
			
			<div class="form-group">
				<label for="create_date">Create_date</label>
			    <input type="date" class="form-control" id="create_date" name="create_date">
			    <small id="create_date_error" class="form-text text-danger"></small>
			</div>
		
			<div class="form-group">
				<label for="available">Available</label>
				<select name="available" id="available" class="form-control" required>
					<option selected disabled>Trạng Thái</option>
					<option value="1">Còn Hàng </option>
					<option value="0">Hết Hàng</option>
				</select>
			    <small id="available_error" class="form-text text-danger"></small>
			</div>
				<div class="form-group">
				<label for="category">Category_id</label>
			    <input type="text" class="form-control" id="category" name="category">
			    <small id="category_error" class="form-text text-danger"></small>
			</div>
			<div class="form-group mt-3">
				<button class="btn btn-primary">Submit</button>
				<button type="reset" class="btn btn-danger">Clear</button>
			</div>
		</form>
	</div>
</body>
</html>