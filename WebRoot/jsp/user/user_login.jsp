<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="css/user_login.css">
<style>
	img{
		cursor:pointer;
	}
</style>
</head>
<body>
	<div style="text-align:center;">
		<div class="register-header">
			<h1>
				<span class="reg-login-btn">登陆</span>
			</h1>
		</div>
		<div class="register-body">
			<form action="user.do?a=checkLogin" method="post" id="register-from">
				<div class="reg-group">
					<input type="text" name="userName" class="reg-ipt"
						placeholder="请输入用户名" required>
					<p class="reg-tip-wrap">
						<span>${sessionScope.errMsg}</span>
					</p>
				</div>
				<div class="reg-group">
					<input type="password" name="password" class="reg-ipt"
						placeholder="请输入密码" required>
					<p class="reg-tip-wrap">
						<span>${sessionScope.errMsg}</span>
					</p>
				</div>
				<div class="reg-group">
					<input type="text" name="verify" class="reg-ipt reg-vf"
						placeholder="请输入验证码" required>&nbsp;&nbsp;<img
						src="user.do?a=verifycode" onclick="javascript:this.src=this.src+'&'+Math.random()"/>
					<p class="reg-tip-wrap">
						<span>${sessionScope.vfMsg}</span>
					</p>
				</div>
				<div class="reg-group clearfix">
					<input type="submit" id="login-btn" class="btn-full" value="登陆">
				</div>
			</form>
		</div>
	</div>
</body>
</html>