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
		
		<script src="<%=path %>/js/tableExport.js"></script>
		<script language="javascript">
           function ShebeiDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/shebei_del.action?id="+id;
               }
           }
           
           function ShebeiEdit(id)
           {
				window.location.href="<%=path %>/shebei_edit.action?id="+id;
           }
           
           function ShebeiAdd()
           {
                 var url="<%=path %>/shebei_add.action";

				 window.location.href=url;
           }
       </script>
	</head>

	<body>
		<!-- 导航 -->
		<div class="container-layout">
			<div class="xs12">
				<ul class="bread bg-main">
					<li><a href="#" class="icon-home">首页</a> </li>
					<li>设备信息信息管理</li>
				</ul>
			</div>
		</div>
		<!-- 查询-->
		<div class="container-layout">
			<div class="panel">
				<div class="panel-head bg-main">
					<strong>设备信息信息查询</strong>
				</div>
				<div class="panel-body">
					<form method="post" class="form-inline" action="<%=path%>/shebei_list.action" method="post">
						<div class="form-group">
							<div class="label">
								<label for="username">设备名称</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="name" name="name" size="20" placeholder="名字" /> </div>
						</div>
						<div class="form-group">
							<div class="label">
								<label for="username">设备状态</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="status" name="status" size="20" placeholder="设备状态" /> </div>
						</div>
						<div class="form-group">
							<div class="label">
								<label for="username">所属教室</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="jiaoshiname" name="jiaoshiname" size="20" placeholder="所属教室" /> </div>
						</div>
						<div class="form-group">
							<div class="label">
								<label for="username">设备入库时间</label>
							</div>
							<div class="field">
								<input type="text" class="input" id="addshijian" name="addshijian" size="20" placeholder="设备入库时间" /> </div>
						</div>																		
						<div class="form-button">
							<button class="button" type="submit"> 查询</button>
							<button  type="button" class="button" onclick="ShebeiAdd()"> <span class="icon-plus text-blue"></span>添加</button>
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
						<a data-type="xls" class="button bg-red" href="javascript:tableExport('table1', 'test', 'xls');">导出excel</a>
				</div>
			    						
				<div class="panel-body">
					<table class="table table-hover table-striped" id="table1">
						<thead>
							<tr>
								<th>ID</th>
								<th>设备编号</th>
								<th>设备名称</th>
								<th>设备类型</th>
								<th>设备简介</th>
								<th>所属教室</th>
								<th>设备状态</th>
								<th>设备价格</th>
								<th>添加时间</th>
								<th>二维码</th>
								<th>操作</th>
				        	</tr>	
						</thead>
						<tbody>				        
							<c:forEach items="${pagers.datas}" var="Shebei">
								<tr>
										<td>
											${Shebei.id}
										</td>
										<td>
											${Shebei.shebeino}
										</td>
										<td>
											${Shebei.name}
										</td>
										<td>
											${Shebei.leixing}
										</td>
										<td>
											${Shebei.detail}
										</td>
										<td>
											${Shebei.jiaoshiname}
										</td>
										<td>
											${Shebei.status}
										</td>
										<td>
											${Shebei.jiage}
										</td>
										<td>
											${Shebei.addshijian}
										</td>
										<td>
											<img alt="" src="<%=path %>/${Shebei.erweima}" width="100px" height="100px"/>
										</td>
									<td>
										<div class="button-group-small">
											<a class="button bg-green" href="<%=path %>/shebei_gencode.action?id=${Shebei.id}">生成二维码</a>
											<button type="button" class="button" onclick="ShebeiEdit(${Shebei.id})"><span class="icon-edit text-blue"></span>修改</button>
											<button type="button" class="button" onclick="ShebeiDel(${Shebei.id})"> <span class="icon-trash-o text-red"></span>删除</button>
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
				      <pg:pager  url="${ctx}/shebei_list.action" maxIndexPages="5" items="${pagers.total}"  maxPageItems="15" export="curPage=pageNumber" >
				      	<pg:param name="name" value="${bean.name}"/>
				      <pg:param name="status" value="${bean.status}"/>
				      <pg:param name="jiaoshiname" value="${bean.jiaoshiname}"/>
				      <pg:param name="addshijian" value="${bean.addshijian}"/>
				      
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