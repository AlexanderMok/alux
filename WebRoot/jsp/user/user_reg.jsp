<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>My JSP 'user.jsp' starting page</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/user_login.css">
<script src="index.js"></script>
</head>

<body>
	<c:if test="${sessionScope.user.role==3 }">
		<jsp:include page="../admin/admin_main.jsp"></jsp:include>
	</c:if>
	<c:choose>
		<c:when test="${sessionScope.user.role==3}">
		<div style="clear:both;text-align:center;position:absolute;top:7%;left:45%;">
			<form action="user.do?a=saveNewU" method="post">
				<p class="reg-tip-wrap"></p>
				<div>
					<input type="text" name="userName" class="reg-ipt"
						placeholder="请输入用户名" required>
						<p class="reg-tip-wrap"></p>				
				</div>
				<div>
					<input type="password" name="password" class="reg-ipt"
						placeholder="请输入密码" required>
						<p class="reg-tip-wrap"></p>
				</div>
				<div>
					<input type="tel" name="tel" class="reg-ipt" placeholder="请输入电话号码"
						required>
						<p class="reg-tip-wrap"></p>
				</div>
				<div>
					<input type="email" name="email" class="reg-ipt"
						placeholder="请输入电子邮箱" required>
						<p class="reg-tip-wrap"></p>
				</div>
				<div>
					<input type="text" name="address" class="reg-ipt"
						placeholder="请输入地址" required>
						<p class="reg-tip-wrap"></p>
				</div>
				<div>
					<input type="radio" name="role" value="1">卖家 <input
						type="radio" name="role" value="2">买家
					<input type="hidden" name="roleName" value="卖家">
				</div>
				<div>
					<input type="submit" id="login-btn" class="btn-full" value="确认">
				</div>
			</form>
		</div>	
		</c:when>
		<c:otherwise>
			<div style="text-align:center;">
				<div class="register-header">
					<h1>
						<span class="reg-login-btn">注册</span>
					</h1>
				</div>
				<div class="register-body">
					<form action="user.do?a=save" method="post" id="register-from">
						<div class="reg-group">
							<input type="text" name="userName" class="reg-ipt"
								placeholder="请输入用户名" required>
							<p class="reg-tip-wrap"></p>
						</div>
						<div class="reg-group">
							<input type="password" name="password" class="reg-ipt"
								placeholder="请输入密码" required>
							<p class="reg-tip-wrap"></p>
						</div>
						<div class="reg-group">
							<input type="tel" name="tel" class="reg-ipt"
								placeholder="请输入电话号码" required>
							<p class="reg-tip-wrap"></p>
						</div>
						<div class="reg-group">
							<input type="email" name="email" class="reg-ipt"
								placeholder="请输入电子邮箱" required>
							<p class="reg-tip-wrap"></p>
						</div>
						<div class="reg-group">
							<input type="text" name="address" class="reg-ipt"
								placeholder="请输入地址" required>
							<p class="reg-tip-wrap"></p>
						</div>
						<div class="reg-group">
							<input type="radio" name="role" value="1">卖家 <input
								type="radio" name="role" value="2">买家
							<p class="reg-tip-wrap">
							<input type="hidden" name="roleName" value="卖家">
							</p>
						</div>
						<div class="reg-group clearfix">
							<input type="submit" id="login-btn" class="btn-full" value="注册">
						</div>
					</form>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>