<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<div id="sign-up" class="reg-modal in">
	<div class="register-header">
		<h1>
			<span class="reg-login-btn">登陆</span>
			<div id="closeBtn"></div>
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
					src="user.do?a=verifycode" onclick="javascript:this.src=this.src+'&'+Math.random()" style="cursor:pointer;"/>
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
<div id="reg-up" class="reg-modal in">
	<div class="register-header">
		<h1>
			<span class="reg-login-btn">注册</span>
			<div id="closeBtn2"></div>
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
				<input type="tel" name="tel" class="reg-ipt" placeholder="请输入电话号码"
					required>
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
				<p class="roleName">
					<input type="radio" name="role" value="1">卖家 <input
						type="hidden" name="roleName" value="卖家"> <input
						type="radio" name="role" value="2">买家
				</p>
			</div>
			<div class="reg-group clearfix">
				<input type="submit" id="login-btn" class="btn-full" value="注册">
			</div>
		</form>
	</div>
</div>