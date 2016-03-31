<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</head>
<body>
	<div style="text-align:center;">
		<div class="register-header">
			<h1>
				<span class="reg-login-btn">结算提交订单</span>
			</h1>
		</div>
	</div>
	<div><a href="order.do?a=orderListUser">查看您购买的商品</a></div>
	<div class="result-content">
			<table class="result-tab" width="100%" style="text-align:center;">
				<tr>
					<td class="tc"></td>
					<td>用户Id</td>
					<td>商品名称</td>
					<td>itemId</td>
					<td>购买时间</td>
					<td>购买数量</td>
					<td>商品单价</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${sessionScope.shopcart}" var="i">
					<tr>
						<td class="tc"><input name="id[]" value="${i.id}" type="checkbox"></td>
						<td>${i.uid}</td>
						<td>${i.itemName}</td>
						<td>${i.itemId}</td>
						<td>${i.buyTime}</td>
						<td>${i.buyTotal}</td>
						<td></td>
						<td><a class="link-del" href="order.do?a=chkOrder&id=${i.id}">查看</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	<div>
		<c:if test=""></c:if>
		用户名:${user.userName}<br /> 
		商品名称:${item.itemName}<br />
		收货地址:${user.address}<br /> 
		数量:${order.total}<br /> 订单状态:
		<c:if test="${order.status==0}">未处理</c:if>
		<c:if test="${order.status==1}">已处理</c:if>
		<br />
	</div>
</body>
</html>