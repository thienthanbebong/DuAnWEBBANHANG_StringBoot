<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/bootstrap.min.css"></link>
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
		<form:form modelAttribute="product"  method="POST"
			action="${ pageContext.request.contextPath }/admin/product/update/${product.id }">
			<input type="hidden" name="_method" value="put" />

			<div class="form-group mt-3">
				<label for="name">Name</label>
				<form:input path="name" placeholder="Vui lòng điền tên!" class="form-control" autocomplete="off" />
				<form:errors path="name" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group mt-3">
				<label for="price">Price</label>
				<form:input path="price" placeholder="Vui lòng điền giá!"class="form-control" autocomplete="off" />
				<form:errors path="price" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group mt-3">
				<label for="create_date">Create_date</label>
				<form:input path="create_date" 
					class="form-control" autocomplete="off"  />
				<form:errors path="create_date" element="span"
					cssClass="text-danger" />
			</div>
			<div class="form-group mt-3">
				<label for="available">Available</label>
				<form:select path="available" id="available" class="form-control">
					<form:option value="1">Còn Hàng</form:option>
					<form:option value="0">Hết Hàng</form:option>
				</form:select>
				<form:errors path="available" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group mt-3">
				<label for="image">Image</label> <input type="file"
					class="form-control" name="image" id="image">
				<form:errors path="image" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group mt-3">
				<label for="category">Category_id</label>
				<form:input path="category" class="form-control" placeholder="Vui lòng điền id!"
					autocomplete="off" />
				<form:errors path="category" element="span"
					cssClass="text-danger" />
			</div>
			<div class="form-group mt-3">
				<button class="btn btn-primary">Submit</button>
				<button type="reset" class="btn btn-danger">Clear</button>
			</div>
		</form:form>
	</div>
</body>
</html>