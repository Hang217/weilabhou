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
		<script type="text/javascript">
           function jiazhangDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/jiazhang_del.action?id="+id;
               }
           }
           
           function jiazhangEdit(id)
           {
				window.location.href="<%=path %>/jiazhang_edit.action?id="+id;
           }
           
           function jiazhangAdd()
           {
                 var url="<%=path %>/jiazhang_add.action";

				 window.location.href=url;
           }
       </script>
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
					<strong>欢迎使用！</strong>
				</div>
				<div class="panel-body">
				</div>
			</div>
		</div>
		<!-- 查询-->
	</body>
</html>