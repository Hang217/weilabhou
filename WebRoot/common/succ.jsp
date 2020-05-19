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
	</head>

	<body>
		<!-- 导航 -->
		<div class="container-layout">
			<div class="xs12">
				<ul class="bread bg-main">
					<li><a href="#" class="icon-home">基于微信小程序的实验室设备管理系统</a> </li>
				</ul>
			</div>
		</div>
		<!-- 查询-->
		<div class="container-layout">
			<div class="panel">
				<div class="panel-head bg-main">
					<strong>操作信息提示</strong>
				</div>
				<div class="panel-body">
					${msg }
				</div>
			</div>
		</div>
		<!-- 查询-->
	</body>
</html>