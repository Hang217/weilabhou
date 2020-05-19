<%@ page language="java" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <title>微信小程序的实验室设备管理系统</title>
    <link href="<%=path %>/css/login.css" rel="stylesheet" type="text/css"/>
    <script src="<%=path %>/js/jquery-3.4.1.js"></script>
</head>

<body>
<div class="login_box">
    <div class="login_l_img"><img src="<%=path %>/images/login-img.png"/></div>
    <div class="login">
        <div class="login_logo"><a href="#"><img src="<%=path %>/images/login_logo.png"/></a></div>
        <div class="login_name">
            <p>微信小程序的实验室设备管理系统</p>
        </div>
        <form action="<%=path %>/login_login.action" name="ThisForm" method="post">
            <input name="userName" id="userName" type="text" value="用户名" onfocus="this.value=''"  onblur="if(this.value==''){this.value='用户名'}">
            <input name="userPw" id="userPw" type="password" onfocus="this.value=''">
            <select name="userType" id="userType">
              		<option value="0">超级管理员</option>
              		<option value="1">用户</option>
            </select>
            <input value="登录" style="width:100%;" type="submit" id="login_btn">
        </form>
    </div>
    <div class="copyright">Mr.Yang 版权所有©2020 </div>
</div>
</body>
</html>