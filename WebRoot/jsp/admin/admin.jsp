<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <script type="text/javascript" src="js/modernizr.min.js"></script>
</head>
<body>
	<jsp:include page="admin_main.jsp"></jsp:include>
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="result-wrap">
            <div class="result-title">
                <h1>快捷操作</h1>
            </div>
            <div class="result-content">
                <div class="short-wrap">
                    <a href="item.do?a=add"><i class="icon-font">&#xe001;</i>添加商品</a>
                    <a href="item.do?a=del&id="><i class="icon-font">&#xe005;</i>删除商品</a>
                    <a href="item.do?a=update&id="><i class="icon-font">&#xe048;</i>更新商品</a>
                    <a href="item.do?a=itemListAd"><i class="icon-font">&#xe048;</i>商品列表</a>
                    <a href="order.do?a=orderList"><i class="icon-font">&#xe041;</i>商品订单</a>
                </div>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>欢迎${sessionScope.user.roleName}：${sessionScope.user.userName}</h1>
            </div>
            <div class="result-content">
                <ul class="sys-info-list">
                    <li>
                        <label class="res-lab">登陆时间</label><span class="res-info"><%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%></span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!--/main-->
</body>
</html>