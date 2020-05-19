﻿<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" href="<%=path%>/css/pintuer.css" />
		<link rel="stylesheet" href="<%=path%>/css/gcommon.css" />
		<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=path%>/js/pintuer.js"></script>
				<!-- 日期控件 -->
		<script src="<%=path%>/resource/My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>
		<div class="container-layout">
			<div class="xs12">
				<ul class="bread bg-main">
					<li><a href="#" class="icon-home">首页</a> </li>
					<li>管理员信息修改</li>
				</ul>
			</div>
		</div>
		<div class="container-layout">
			<div class="panel gao-form-bg">
				<div class="panel-head bg-main">
					<strong>修改管理员</strong>
				</div>
				<div class="panel-body">
					<form onsubmit="return true;" class="form-x radius-big" action="<%=path %>/admin_update.action" name="gaoform" method="post">
								<div class="form-group" id="f_1510851941628">
									<div class="label">
										<label for="f_username_txt">
											用户名
										</label>
									</div>
									<div class="field">
								        	<input class="input" id="username" name="username" maxlength="50" value="${requestScope.Admin.username}" data-validate="required:请填写内容" placeholder="输入内容" type="text">
									</div>
								</div>							
								<div class="form-group" id="f_1510851941628">
									<div class="label">
										<label for="f_username_txt">
											密码
										</label>
									</div>
									<div class="field">
								        	<input class="input" id="userpwd" name="userpwd" maxlength="50" value="${requestScope.Admin.userpwd}" data-validate="required:请填写内容" placeholder="输入内容" type="text">
									</div>
								</div>							
								<div class="form-group" id="f_1510851941628">
									<div class="label">
										<label for="f_username_txt">
											身份
										</label>
									</div>
									<div class="field">
										<input id="identity" name="identity" type="radio" value="管理员" checked="checked">管理员
										<input id="identity" name="identity" type="radio" value="超级管理员">超级管理员								
									</div>
								</div>							
						<div class="form-button">
						       			<input type="hidden" id="id" name="id" value="${requestScope.Admin.id}"/>
								<button class="button bg-blue" type="submit"> 修改 </button>
						</div>
					</form>
				</div>
			</div>
		</div>
   </body>
</html>