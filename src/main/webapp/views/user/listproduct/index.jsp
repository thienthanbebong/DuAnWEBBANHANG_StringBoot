<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Chủ</title>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/bootstrap.min.css"></link>
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

	<div class="col-10 offset-1 mt-5 border border-primary p-2">
		<form method="GET"
			action="${ pageContext.request.contextPath }/user/listproduct">
			<div class="row col-12 mt-2">
				<div class="col-6">
					<label>Sắp xếp theo</label> <select name="sort_by"
						class="form-control">
						<option value="id">Mặc định</option>
						<option value="name">Tên Sản Phẩm</option>
						<option value="price">Price</option>
						<option value="create_date">Ngày Nhập</option>
					</select>
				</div>
				<div class="col-6">
					<label>Thứ tự</label> <select name="sort_direction"
						class="form-control">
						<option value="asc">Tăng dần</option>
						<option value="desc">Giảm dần</option>
					</select>
				</div>
			</div>

			<div>
				<button class="btn btn-primary mt-4">Lọc</button>
				<a href="${ pageContext.request.contextPath }/user/listproduct"
					class="btn btn-danger mt-4" type="reset"> Reset </a>
			</div>
		</form>
	</div>



	<div class="mt-3 col-10 offset-1 border border-primary p-2">


		<div class="row ">

			<c:forEach var="product" items="${ pageData.content }">
				<div class="card text-center col-3 mt-2 m-5">
					<div class="card-body">
						<img
							src="${ pageContext.request.contextPath }/views/stogare/${product.image }"
							width="210px" height="160px" alt="" class="img-fluid">

					</div>
					<div class="row border top mt-2 mb-1">
						<b>Tên SP: ${ product.name }</b> <b>Price: ${ product.price }$</b>
					</div>
					<div class="car-footer mb-2 ml-2">
						<a
							href="${ pageContext.request.contextPath }/shopping-cart/add/${ product.id}"
							class="btn btn-success ">Buy Now</a> <a
							href="${ pageContext.request.contextPath }/shopping-cart/add/${ product.id}"
							class="btn btn-info ml-2">Chi Tiết</a>
					</div>
				</div>
			</c:forEach>
		</div>


		<div>
			<ul class="pagination">
				<li class="page-item"><a class="page-link"
					href="${ pageContext.request.contextPath }/user/listproduct?limit=5&page=0">0</a>
				</li>
				<c:forEach begin="0" end="${ pageData.totalPages - 1 }"
					varStatus="page">

					<li class="page-item"><a class="page-link"
						href="${ pageContext.request.contextPath }/user/listproduct?limit=5&page=${ page.index + 1 }">${ page.index + 1 }</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<script src="${ pageContext.request.contextPath }/js/hello.js"></script>
</body>
</html>