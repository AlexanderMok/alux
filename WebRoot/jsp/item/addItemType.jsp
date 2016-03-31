<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
					class="crumb-step">&gt;</span><a class="crumb-name"
					href="item.do?a=itemListAdmin">商品管理</a><span class="crumb-step">&gt;</span><span>添加商品分类</span>
			</div>
		</div>
		<div class="result-wrap">
			<div class="result-content">
				<form action="item.do?a=addType" method="post" id="myform"
					name="myform">
					<table class="insert-tab" width="100%">
						<tbody>
							<tr>
								<th>商品一级分类：</th>
								<td><input type="text" class="common-text required" name="first">
								</td>
							</tr>
							<tr>
								<th>商品二级分类：</th>
								<td><input class="common-text required" id="title"
									name="second" size="50" placeholder="" type="text"></td>
							</tr>
							<tr>
								<th>商品三级分类：</th>
								<td><input class="common-text" name="third" size="50"
									type="text"></td>
							</tr>
							<tr>
								<th></th>
								<td><input class="btn btn-primary btn6 mr10" value="提交"
									type="submit"> <input class="btn btn6"
									onclick="history.go(-1)" value="返回" type="button"></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!--/main-->
</body>
</html>
