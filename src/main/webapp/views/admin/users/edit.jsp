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
		<form:form modelAttribute="user" method="POST"
			action="${ pageContext.request.contextPath }/admin/users/update/${user.id }">
			<input type="hidden" name="_method" value="put"  />
			<form:errors path="*" element="div" delimiter="<br>" />
			<div class="form-group mt-3">

				<label for="username">Name</label>
				<form:input path="username" class="form-control" autocomplete="off" placeholder="Vui lòng điền tên!"/>
				<form:errors path="username" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group mt-3">
				<label for="email">Email</label>
				<form:input path="email" class="form-control" id="email" placeholder="Vui lòng điền email!"
					name="email" autocomplete="off" />
				<form:errors path="email" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group mt-3">
				<label for="password">Password</label>
				<form:password path="password" value="*********" name="password" placeholder="Vui lòng điền pass!"
					class="form-control" readonly="true" />
				<form:errors path="password" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group mt-3">
				<label for="admin">Tài khoản</label>
				<form:select path="admin" id="admin" class="form-control">
					<form:option value="1">Admin</form:option>
					<form:option value="0">Member</form:option>
				</form:select>
				<form:errors path="admin" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group mt-3">
				<label for="photo">Image</label> <input type="file"
					class="form-control" id="photo" name="photo">
				<form:errors path="photo" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group mt-3">
				<label for="status">Trạng thái</label>
				<form:select path="activated" id="activated" class="form-control">
					<form:option value="1">Đang hoạt động</form:option>
					<form:option value="0">Vô hiệu hóa</form:option>
				</form:select>
				<form:errors path="activated" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group mt-3">
				<button class="btn btn-primary">Submit</button>
				<button type="reset" class="btn btn-danger">Clear</button>
			</div>
		</form:form>
	</div>
</body>
</html>