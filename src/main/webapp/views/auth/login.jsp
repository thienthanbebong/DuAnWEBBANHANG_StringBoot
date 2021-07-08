<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/bootstrap.min.css"></link>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
	
	<div class="container" style="margin-top: 50px;">
            <div class="row" style="border: 1px darkgrey solid; border-radius: 10px;width: 50%; margin: 0 auto; padding: 20px;" >
                <div class="col-sm-12">
                <h3>Login</h3>
                <form action="${ pageContext.request.contextPath }/login" method="post">
                    <div class="form-group">
                        <label>Email:</label>
                        <input type="text" class="form-control" name="email" placeholder="Enter Email">
                    </div>
                    <div class="form-group">
                        <label>Password:</label>
                        <input type="password" class="form-control" name="password" placeholder="Enter Password">
                    </div>
                   
                   	<c:if test="${not empty sessionScope.error }">
			<div class="alert alert-danger">${sessionScope.error }</div>
			<c:remove var="error" scope="session" />
		</c:if>
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-primary">Cancel</button>
                    
					 <p style="margin: 10px; font-size: 16px;"><a href="${ pageContext.request.contextPath }/auth/users">Đăng Ký Tài Khoản</a></p>
					
                </form>
                </div>
            </div>
        </div>
	
</body>
</html>