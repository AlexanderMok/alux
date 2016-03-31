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
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="#" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li></li>
                <li><a href="admin.do?a=index">后台首页</a></li>
                <li><a href="item.do?a=itemList" target="_blank">商城首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href="user.do?a=exit">退出</a></li>
            </ul>
        </div>
    </div>
</div>
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="javascript:;"><i class="icon-font">&#xe003;</i>商品管理</a>
                    <ul class="sub-menu">
                        <li><a href="item.do?a=add"><i class="icon-font">&#xe008;</i>添加商品</a></li>
                        <li><a href="item.do?a=addType"><i class="icon-font">&#xe008;</i>添加分类</a></li>
                        <li><a href="item.do?a=del&id="><i class="icon-font">&#xe005;</i>删除商品</a></li>
                        <li><a href="item.do?a=update&id="><i class="icon-font">&#xe006;</i>更改商品</a></li>
                        <li><a href="order.do?a=orderList"><i class="icon-font">&#xe012;</i>处理商品</a></li>
                    </ul>
                </li>
                <c:if test="${sessionScope.user.role==3 }">
                	<jsp:include page="admin_admin_menue.jsp"></jsp:include>
                </c:if>                
            </ul>
        </div>
    </div>
  </body>  
</html>    