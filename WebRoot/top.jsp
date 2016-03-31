<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>
	<nav>
		<ul>
			<li><a href="item.do">首页</a></li>
			<li><a href="javascript:;" class="login-btn">登陆</a></li>
			<li><a href="javascript:;" class="reg-btn">注册</a></li>
			<li><a href="item.do?a=showCart">查看购物车</a></li>
			<li><a href="admin.do?a=login">后台管理</a></li>
		</ul>
	</nav>
</header>
<div>
	<span> <c:choose>
			<c:when test="${sessionScope.user.userName==null}">
				<span>快登录或注册，来Alux尽情Shopping吧！</span>
			</c:when>
			<c:otherwise>
					当前登陆${sessionScope.user.roleName}：${sessionScope.user.userName} &nbsp;&nbsp;<a
					href="user.do?a=exit">退出</a>
			</c:otherwise>
		</c:choose>
	</span>
</div>
<script src="js/order.js"></script>