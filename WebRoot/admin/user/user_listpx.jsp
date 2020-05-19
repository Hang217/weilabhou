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
	</head>

	<body>
		<!-- 导航 -->
		<div class="container-layout">
			<div class="xs12">
				<ul class="bread bg-main">
					<li><a href="#" class="icon-home">首页</a> </li>
					<li>用户积分排行</li>
				</ul>
			</div>
		</div>
		<!-- 数据表格-->
		<div class="container-layout" style="margin-top: 30px;">
			<div class="panel">
				<div class="panel-head bg-main">
					<strong>用户积分排行</strong>
				</div>
				<div class="panel-body">
					<table class="table table-hover table-striped">
						<thead>
							<tr>
								<th>排名</th>
								<th>用户名</th>
								<th>真实姓名</th>
								<th>电话</th>
								<th>积分</th>
				        	</tr>	
						</thead>
						<tbody>				        
							<c:forEach items="${userlist}" var="User" varStatus="step">
								<tr>
										<td>
											${step.index + 1}
										</td>
										<td>
											${User.username}
										</td>
										<td>
											${User.name}
										</td>
										<td>
											${User.telephone}
										</td>
										<td>
											<button class="button bg-green">${User.jifen}</button>
										</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>				
				</div>
			</div>
		</div>
	</body>
</html>