<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
					href="${ pageContext.request.contextPath }/user/listproduct">Trang
						Chủ</a></li>
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
	<c:if test="${not empty sessionScope.thongbao }">
		<div class="alert alert-danger">${sessionScope.thongbao }</div>
		<c:remove var="thongbao" scope="session" />
	</c:if>
	<div class="container">
		<h2>Giỏ Hàng:</h2>
		<div class="rows">
			<div class="col-sm-9">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Amount</th>
							<th></th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="item" items="${CART_ITEMS}">
							<form
								action="${ pageContext.request.contextPath }/shopping-cart/update"
								method="post">
								<input type="hidden" name="id" value="${item.productId}" />
								<tr>
									<td>${item.productId }</td>
									<td>${item.name }</td>
									<td>${item.price}</td>
									<td><input name="qty" value="${item.qty}"
										onblur="this.form.submit()" style="width: 50px;"></td>
									<td>${item.price*item.qty}</td>
									<td><a class="btn btn-primary btn-sm"
										href="${ pageContext.request.contextPath }/shopping-cart/del/${item.productId }">Remove</a></td>
								</tr>
							</form>
						</c:forEach>


					</tbody>
				</table>
				<p>Thành Tiền:${TOTAL}</p>
				<hr />
				<a class="btn btn-primary btn-sm"
					href="${ pageContext.request.contextPath }/shopping-cart/clear">Clear
					Cart</a> <a class="btn btn-primary btn-sm"
					href="${ pageContext.request.contextPath }/user/listproduct">Add
					more</a>

			</div>

		</div>

	</div>

	<form method="POST"
		action="${ pageContext.request.contextPath }/user/listproduct/store">
		<div class="form-group ">
			<label for="address">Địa Chỉ:</label> <input type="text"
				placeholder="Vui lòng điền địa chỉ nhận hàng!!!"
				class="form-control" id="address" name="address" autocomplete="off">
			<small id="address_error"></small>

		</div>

		<div class="form-group mt-3">
			<button class="btn btn-primary">Đặt Hàng</button>
			<button type="reset" class="btn btn-danger">Clear</button>
		</div>
	</form>

</body>
</html>
