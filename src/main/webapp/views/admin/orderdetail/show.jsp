<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>


<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" ></link>
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

	<h2>Hóa Đơn Chi Tiết</h2>
	<table class="table table-bordered mt-3">
			<thead>
				<tr>
					<td>Id</td>
					<td>Tên Sản Phẩm</td>
					<td>Số Lượng</td>
					<td>Thành Tiền</td>
					<td>Địa Chỉ</td>
					<td colspan="1">Thao tác</td>
				</tr>
			</thead>

			<tbody>
					<tr>
						<td>${ orderdetail.id }</td>
						<td>${ orderdetail.product.name }</td>
						<td>${ orderdetail.quantity }</td>
						<td>${ orderdetail.price }</td>
					<td>${ orderdetail.order.address }</td>
					<td><a class="btn btn-primary"
							href="${ pageContext.request.contextPath }/admin/order">Trở Về</a>
						</td>
					</tr>
			
			</tbody>
		</table>
	
	
	
</body>
</html>