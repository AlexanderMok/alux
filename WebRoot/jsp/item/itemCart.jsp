<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>AluxShopping</title>
<meta chartset="utf-8">
<link rel="stylesheet" type="text/css" href="css/user_login.css">
<link rel="stylesheet" type="text/css" href="css/top.css" />
<link rel="stylesheet" type="text/css" href="css/items.css">
<link rel="stylesheet" type="text/css" href="css/main.css" />
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/index.js"></script>
<style>
main {
	text-align:center;
}

main .result-content {
	margin: 0 auto;
	min-height: 300px;
	text-align: center;
}
</style>
</head>

<body>
	<jsp:include page="/top.jsp"></jsp:include>
	<jsp:include page="/sign_in_reg.jsp"></jsp:include>
	<!--/sidebar-->
	<main>
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
						<td>${i.price}</td>
						<td><a class="link-del" href="item.do?a=deleteCart&id=${i.id}">删除</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<p class="reg-tip-wrap"></p>
		<div>
			<button class="btn-full" id="btn">全选/反选</button>
			<button class="btn-full" onclick="javascript:history.go(-1)">返回</button>
			<button class="btn-full" onclick="javascript:check('order.do?a=checkOrder')">结账</button>
		</div>
		<p class="reg-tip-wrap"></p>
	</main>
	<!--/main-->
	<jsp:include page="/footer.jsp"></jsp:include>
	<script src="js/order.js"></script>
</body>
</html>