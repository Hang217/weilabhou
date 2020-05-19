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
					<li>设备信息信息添加</li>
				</ul>
			</div>
		</div>
		<div class="container-layout">
			<div class="panel gao-form-bg">
				<div class="panel-head bg-main">
					<strong>添加设备信息信息</strong>
				</div>
				<div class="panel-body">
					<form onsubmit="return true;" class="form-x radius-big" action="<%=path %>/shebei_save.action" name="gaoform" method="post">
								<div class="form-group" id="f_1510851941628">
									<div class="label">
										<label for="f_username_txt">
											设备编号
										</label>
									</div>
									<div class="field">
								        	<input class="input" id="shebeino" name="shebeino" maxlength="50" value="" data-validate="required:请填写内容" placeholder="输入内容" type="text">
									</div>
								</div>							
								<div class="form-group" id="f_1510851941628">
									<div class="label">
										<label for="f_username_txt">
											设备名称
										</label>
									</div>
									<div class="field">
								        	<input class="input" id="name" name="name" maxlength="50" value="" data-validate="required:请填写内容" placeholder="输入内容" type="text">
									</div>
								</div>							
								<div class="form-group" id="f_1510851941628">
									<div class="label">
										<label for="f_username_txt">
											设备类型
										</label>
									</div>
									<div class="field">
								        	<input class="input" id="leixing" name="leixing" maxlength="50" value="" data-validate="required:请填写内容" placeholder="输入内容" type="text">
									</div>
								</div>							
								<div class="form-group" id="f_1510851941628">
									<div class="label">
										<label for="f_username_txt">
											设备简介
										</label>
									</div>
									<div class="field">
								        	<input class="input" id="detail" name="detail" maxlength="50" value="" data-validate="required:请填写内容" placeholder="输入内容" type="text">
									</div>
								</div>							
								<div class="form-group" id="f_1510851941628">
									<div class="label">
										<label for="f_username_txt">
											设备价格
										</label>
									</div>
									<div class="field">
									 <input type="text" class="input" id="jiage" name="jiage" maxlength="8" value="" data-validate="required:请填写数字,age:请输入数字" placeholder="输入年龄">
									</div>
								</div>	
								<div class="form-group" id="f_1510851941628">
									<div class="label">
										<label for="f_username_txt">
											所属教室
										</label>
									</div>
									<div class="field">
								        	<input class="input" id="jiaoshiname" name="jiaoshiname" maxlength="50" value="" data-validate="required:请填写内容" placeholder="输入内容" type="text">
									</div>
								</div>							
								<div class="form-group" id="f_1510851941628">
									<div class="label">
										<label for="f_username_txt">
											设备状态
										</label>
									</div>
									<div class="field">
										<input id="status" name="status" type="radio" value="正常" checked="checked">正常
										<input id="status" name="status" type="radio" value="损坏">损坏
										<input id="status" name="status" type="radio" value="维修">维修
										<input id="status" name="status" type="radio" value="报废">报废		
									</div>
								</div>							
								<div class="form-group" id="f_1510851941628">
									<div class="label">
										<label for="f_username_txt">
											添加时间
										</label>
									</div>
									<div class="field">
										<input id="addshijian" name="addshijian" readonly="readonly" class="input" value="${requestScope.Yuangong.shijian}"  type="text" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/>
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
