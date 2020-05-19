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
		<script language="javascript">
           function UserDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/user_del.action?id="+id;
               }
           }
           
           function UserEdit(id)
           {
				window.location.href="<%=path %>/user_edit.action?id="+id;
           }
           
           function UserAdd()
           {
                 var url="<%=path %>/user_add.action";

				 window.location.href=url;
           }
       </script>
	</head>

	<body>
		<!-- 查询-->
		<div class="container-layout">
			<div class="panel">
				<div class="panel-head bg-main">
					<strong>用户信息查询</strong>
				</div>
				<div class="panel-body">
					<form method="post" class="form-inline" action="<%=path%>/user_list.action" method="post">
						<div class="form-group">
							<div class="label">
								<label for="username">名字</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="username" name="username" size="20" placeholder="名字" /> </div>
						</div>
						<div class="form-button">
							<button class="button" type="submit"> 查询</button>
							<button  type="button" class="button" onclick="UserAdd()"> <span class="icon-plus text-blue"></span>添加</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- 查询-->
		<!-- 数据表格-->
		<div class="container-layout" style="margin-top: 30px;">
			<div class="panel">
				<div class="panel-head bg-main">
					<strong>用户信息列表</strong>
				</div>
				<div class="panel-body">
					<table class="table table-hover table-striped">
						<thead>
							<tr>
								<th>帐号</th>
								<th>用户名</th>
								<th>密码</th>
								<th>性别</th>
								<th>真实姓名</th>
								<th>电话</th>
								<th>邮箱</th>
								<th>状态</th>
								<th>操作</th>
				        	</tr>	
						</thead>
						<tbody>				        
							<c:forEach items="${pagers.datas}" var="User">
								<tr>
										<td>
											${User.id}
										</td>
										<td>
											${User.username}
										</td>
										<td>
											${User.password}
										</td>
										<td>
											${User.sex}
										</td>
										<td>
											${User.name}
										</td>
										<td>
											${User.telephone}
										</td>
										<td>
											${User.emall}
										</td>
										<td>
											<c:if test="${User.status == 0}"><span class="button bg-blue">正常</span></c:if>
											<c:if test="${User.status == 1}"><span class="button bg-red">拉黑</span></c:if>	
										</td>
									<td>
										<div class="button-group-small">
											<button type="button" class="button" onclick="UserEdit(${User.id})"><span class="icon-edit text-blue"></span>修改</button>
											<button type="button" class="button" onclick="UserDel(${User.id})"> <span class="icon-trash-o text-red"></span>删除</button>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>				
				</div>
				<!-- 分页 -->
				<div class="panel-foot bg-main">
					<ul class="pagination">
				      <pg:pager  url="${ctx}/user_list.action" maxIndexPages="5" items="${pagers.total}"  maxPageItems="15" export="curPage=pageNumber" >
						<pg:param name="name" value="${name}"/>
						<pg:last>  
							<font color="black">共${pagers.total}记录,共${pageNumber}页, </font> 
						</pg:last>  
							<font color="black">当前第${curPage}页 </font> 
				        <pg:first>  
				            <li><a href="${pageUrl}">首页</a></li>
						</pg:first>  
						<pg:prev>  
				    		<li><a href="${pageUrl}">上一页</a></li>
						</pg:prev>  
				       	<pg:pages>  
				        	<c:choose>  
				            	<c:when test="${curPage eq pageNumber}">  
				                	<li><a href="#"><font color="red">${pageNumber }</font> </a></li> 
				            	</c:when>  
				            	<c:otherwise>  
				               		<li><a href="${pageUrl}">${pageNumber}</a></li> 
				            	</c:otherwise>  
				        	</c:choose>  
				    	</pg:pages>
				             
				        <pg:next>  
				    		<li><a href="${pageUrl}">下一页</a></li>
						</pg:next>  
						<pg:last>  
							<c:choose>  
				            	<c:when test="${curPage eq pageNumber}">  
				                	<li><a href="#"><font color="red">尾页</font></a></li>
				            	</c:when>  
				            	<c:otherwise>  
				               		<li><a href="${pageUrl}">尾页</a></li>
				            	</c:otherwise>  
				        	</c:choose> 
						</pg:last>
					</pg:pager>							
					</ul>
				</div>
				<!-- 分页 -->
			</div>
		</div>
	</body>
</html>