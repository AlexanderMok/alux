<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">

<title>My JSP 'itemList.jsp' starting page</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<script type="text/javascript" src="js/modernizr.min.js"></script>
</head>
<body>
	<jsp:include page="../admin/admin_main.jsp"></jsp:include>
	<!--/sidebar-->
	<div class="main-wrap">
		<div class="crumb-wrap">
			<div class="crumb-list">
				<i class="icon-font"></i><a href="admin.do?a=index">后台首页</a><span
					class="crumb-step">&gt;</span><span class="crumb-name">商品列表</span>
			</div>
		</div>
		<div class="search-wrap">
			<div class="search-content">
				<form action="#" method="post">
					<table class="search-tab">
						<tr>
							<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.user.roleName}：${sessionScope.user.userName}</th>
							<td></td>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="result-wrap">
			<form name="myform" id="myform" action="" method="post">
				<div class="result-title">
					<div class="result-list">
						<a href="item.do?a=itemListAdmin"><i class="icon-font"></i>新增商品</a>
					</div>
				</div>
				<div class="result-content">
					<table class="result-tab" width="100%" style="text-align:center;">
						<tr>
							<td class="tc"><input class="allChoose" name=""
								type="checkbox"></td>
							<td>用户id</td>
							<td>gid</td>
							<td>购买时间</td>
							<td>数量</td>
							<td>状态</td>
							<td>操作</td>
						</tr>
						<c:forEach items="${sessionScope.orderList}" var="i">
							<tr>
								<td class="tc"><input name="id[]" value="59"
									type="checkbox"></td>
								<td>${i.uid}</td>
								<td>${i.gid}</td>
								<td>${i.buyTime}</td>
								<td>${i.total}</td>
								<td>${i.status}</td>
								<td>
									<a class="link-del" href="item.do?a=del&id=${i.id}">删除</a>
									<a class="link-del" href="order.do?a=status&id=${i.id}">发货</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</form>
		</div>
	</div>
	<!--/main-->
</body>
</html>