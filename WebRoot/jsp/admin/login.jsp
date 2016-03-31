<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>Alux</title>
    <link rel="stylesheet" type="text/css" href="css/admin_login.css"/>
    <style>
    	img{
    		cursor:pointer;
    	}
    </style>
</head>
<body>
<div class="admin_login_wrap">
    <h1>商城后台管理</h1>
    <div class="adming_login_border">
        <div class="admin_input">
            <form action="admin.do?a=checkLogin" method="post">
                <ul class="admin_items">
                    <li>
                        <label for="userName">用户名：</label>
                        <input type="text" name="userName" placeholder="请输入用户名" id="user" size="40" class="admin_input_style" required/>
                        <span>${sessionScope.userMsg}</span>
                    </li>
                    <li>
                        <label for="password">密码：</label>
                        <input type="password" name="password" placeholder="请输入密码" id="pwd" size="40" class="admin_input_style" required/>
                    	<span>${sessionScope.pswMsg}</span>
                    </li>
                    <li>
                        <label for="verify">验证码：</label><img src="admin.do?a=verifycode" onclick="javascript:this.src=this.src+'&'+Math.random()"/>
                        <input type="text" name="verify" placeholder="请输入验证码" id="pwd" size="40" class="admin_input_style" required/>
                        <span>${sessionScope.vfMsg}</span>
                    </li>
                    <li>
                        <input type="submit" tabindex="3" value="提交" class="btn btn-primary" />
                    </li>
                </ul>
            </form>
        </div>
    </div>
</div>
</body>
</html>
