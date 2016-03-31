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
<link rel="stylesheet" type="text/css" href="css/user_login.css">
<link rel="stylesheet" type="text/css" href="css/items.css">
<link rel="stylesheet" type="text/css" href="css/top.css">
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/index.js"></script>
</head>
<body>
	<jsp:include page="/top.jsp"></jsp:include>
	<jsp:include page="/sign_in_reg.jsp"></jsp:include>
	<main>
		<div class="main">
			<div id="pic-container" style="text-align:center;">
				<ul>
					<li id="pic1" class="img">
						<div class="pic">
							<img src="${item.itemPic}" />
							<div class="img-footer">
								<p></p>
								<a href="#"></a> <em>3</em>
							</div>
						</div>
					</li>
					<li id="pic1" class="img">
						<!--<table width='550' align="center">
							<tr>
								<td align="right">商品名称:</td>
								<td>${item.itemName}</td>
							</tr>


							<tr>
								<td align="right">商品单价:</td>
								<td>${item.price}</td>
							</tr>
							<tr>
								<td align="right">商品描述:</td>
								<td>${item.itemDesc}</td>
							</tr>

						</table> -->
						<div>
							<p>商品名称:${item.itemName}</p>
							<p>商品单价${item.price}</p>
							<p>商品描述:${item.itemDesc}</p>
						</div>
						<a href="item.do?a=addCart&id=${item.id}&itemName=${item.itemName}">添加到购物车</a>
						<br><a href="javascript:history.go(-1)">返回</a>
					</li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</main>
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>