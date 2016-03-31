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
<script src="js/index.js"></script>
</head>

<body>
	<jsp:include page="../admin/admin_main.jsp"></jsp:include>
	<div
		style="clear:both;text-align:center;position:absolute;top:7%;left:45%;">
		<form action="user.do?a=saveNewU" method="post">
			<p class="reg-tip-wrap"></p>
			<div>
				<input type="text" name="userName" class="reg-ipt"
					placeholder="${user.userName}" required>
				<p class="reg-tip-wrap"></p>
			</div>
			<div>
				<input type="password" name="password" class="reg-ipt"
					placeholder="${user.userName}" required>
				<p class="reg-tip-wrap"></p>
			</div>
			<div>
				<input type="tel" name="tel" class="reg-ipt"
					placeholder="${user.tel}" required>
				<p class="reg-tip-wrap"></p>
			</div>
			<div>
				<input type="email" name="email" class="reg-ipt"
					placeholder="${user.email}" required>
				<p class="reg-tip-wrap"></p>
			</div>
			<div>
				<input type="text" name="address" class="reg-ipt"
					placeholder="${user.address}" required>
				<p class="reg-tip-wrap"></p>
			</div>
			<div>
				<input type="radio" name="role" value="1">卖家 <input
					type="radio" name="role" value="2">买家
					

			</div>
			<input type="hidden" name="roleName" value="${user.roleName}">
			<div>
				<input type="submit" id="login-btn" class="btn-full" value="确认">
				<input class="btn-full" onclick="history.go(-1)" value="返回"
					type="button">
			</div>
		</form>
	</div>
</body>
</html>