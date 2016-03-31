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
				<span class="reg-login-btn">结算中</span>
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
				<c:forEach items="${sessionScope.shopcart}" var="s">
					<tr>
						<td class="tc"><input name="id[]" value="${s.id}" type="checkbox"></td>
						<td>${s.uid}</td>
						<td>${s.itemName}</td>
						<td>${s.itemId}</td>
						<td>${s.buyTime}</td>
						<td>${s.buyTotal}</td>
						<td></td>
						<td><a class="link-del" href="item.do?a=chkOrder&id=${s.id}">查看</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	<div>
	
		用户名:${user.userName}<br /> 
		商品名称:${item.itemName}<br />
		收货地址:${user.address}<br /> 
		提交订单时间：${order.buyTime}<br/>
		数量:${order.total}<br /> 订单状态:
		<c:if test="${order.status==0}">未处理</c:if>
		<c:if test="${order.status==1}">已处理</c:if>
		<br />
	</div>
</body>
</html>