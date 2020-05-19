<%@ page language="java" pageEncoding="UTF-8"%>
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
					<li>用户信息添加</li>
				</ul>
			</div>
		</div>
		<div class="container-layout">
			<div class="panel gao-form-bg">
				<div class="panel-head bg-main">
					<strong>添加用户</strong>
				</div>
				<div class="panel-body">
					<form onsubmit="return true;" class="form-x radius-big" action="<%=path %>/user_save.action" name="gaoform" method="post">
								<div class="form-group" id="f_1510851941628">
									<div class="label">
										<label for="f_username_txt">
											用户名
										</label>
									</div>
									<div class="field">
								        	<input class="input" id="username" name="username" maxlength="50" value="" data-validate="required:请填写内容" placeholder="输入内容" type="text">
									</div>
								</div>							
								<div class="form-group" id="f_1510851941628">
									<div class="label">
										<label for="f_username_txt">
											密码
										</label>
									</div>
									<div class="field">
								        	<input class="input" id="password" name="password" maxlength="50" value="" data-validate="required:请填写内容" placeholder="输入内容" type="text">
									</div>
								</div>							
								<div class="form-group" id="f_1510851941628">
									<div class="label">
										<label for="f_username_txt">
											真实姓名
										</label>
									</div>
									<div class="field">
								        	<input class="input" id="name" name="name" maxlength="50" value="" data-validate="required:请填写内容" placeholder="输入内容" type="text">
									</div>
								</div>							
								<div class="form-group" id="f_1510851941628">
									<div class="label">
										<label for="f_username_txt">
											性别
										</label>
									</div>
									<div class="field">
										<select id="sex">
											<option value="男">男</option>
											<option value="女">女</option>
										</select>
									</div>
								</div>	
								<div class="form-group" id="f_1510851941628">
									<div class="label">
										<label for="f_username_txt">
											电话
										</label>
									</div>
									<div class="field">
								        	<input class="input" id="telephone" name="telephone" maxlength="50" value="" data-validate="required:请填写内容" placeholder="输入内容" type="text">
									</div>
								</div>							
								<div class="form-group" id="f_1510851941628">
									<div class="label">
										<label for="f_username_txt">
											邮箱
										</label>
									</div>
									<div class="field">
								        	<input class="input" id="emall" name="emall" maxlength="50" value="" data-validate="required:请填写内容" placeholder="输入内容" type="text">
									</div>
								</div>							
						<div class="form-button">
								<button class="button bg-blue" type="submit"> 添加</button>
						</div>
					</form>
				</div>
			</div>
		</div>
   </body>
</html>
