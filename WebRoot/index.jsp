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
<meta charset="UTF-8">
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
			<div id="pic-container">
				<ul>
					<li id="pic1" class="img">
					<c:forEach items="${sessionScope.itemList}" var="i"> 
						<div class="pic">
						<a href="item.do?a=show&id=${i.id}">
							<img src="${i.itemPic}"/>
							<span class="img-footer">
								<p>${i.itemName}</p>
								 <em>3</em>
							</span>
						</a>						
						</div>
					</c:forEach>
					</li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</main>
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>