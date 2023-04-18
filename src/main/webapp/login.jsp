<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<!-- 引入JQuery  bootstrap.js-->
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<style type="text/css">
	body{
	   background: url(images/view.jpg)repeat;
	}
	#login-box {
		/*border:1px solid #F00;*/
		padding: 35px;
		border-radius:15px;
		background: #56666B;
		color: #fff;

	}

	</style>
</head>
<body>
	<div class="container" id="top">
		<div class="row" style="margin-top: 280px; ">
			<div class="col-md-4"></div>
			<div class="col-md-4" id="login-box">
			<h1><img src="./images/logo.png" alt="" width=316></h1>
				<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/login" id="from1" method="post">
				  <div class="form-group">
				    <label for="id" class="col-sm-3 control-label">Account：</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="id" placeholder="Please enter your account" name="id">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="password" class="col-sm-3 control-label">password：</label>
				    <div class="col-sm-9">
				      <input type="password" class="form-control" id="password" placeholder="Please enter your password" name="password">
				    </div>
				  </div>
				  <div class="form-group pull-left" style="margin-right: 15px;">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="submit" class="btn btn-default btn-info">Log in</button>
				    </div>
				  </div>
					<a href="${pageContext.request.contextPath}/register">No account？</a>
				</form>
			</div>
			<div class="col-md-4"></div>
		</div>		
	</div>
</body>
</html>