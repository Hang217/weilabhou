<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
%>
<nav class="main-navigation">
    <ul>
    	<c:if test="${sessionScope.userType==0}">
        <li class="dropdown show-on-hover">
            <a href="javascript:;" data-toggle="dropdown">
                <i class="fa fa-ellipsis-h"></i>
                <span>管理员管理</span>
            </a>
             <ul class="dropdown-menu">
	             <li>
	                 <a href="<%=path%>/admin/admin/admin_myedit.jsp"  target="main">
	                     <span>个人信息修改</span>
	                 </a>
	             </li>
	             <li>
	                 <a href="<%=path %>/admin_list.action"  target="main">
	                     <span>管理员信息管理</span>
	                 </a>
	             </li>
	             <li>
	                 <a href='<%=path %>/admin_add.action'  target="main">
	                     <span>管理员信息添加</span>
	                 </a>
	             </li>	             	             
	         </ul>
        </li>
        </c:if>
         <li class="dropdown show-on-hover">
            <a href="javascript:;" data-toggle="dropdown">
                 <i class="fa fa-tasks"></i>
                <span>注册信息管理</span>
            </a>
             <ul class="dropdown-menu">
	             <li>
	                 <a href="<%=path%>/user_list.action"  target="main">
	                     <span>注册信息管理</span>
	                 </a>
	             </li>
	         </ul>
        </li>       
          <li class="dropdown show-on-hover">
            <a href="javascript:;" data-toggle="dropdown">
                <i class="fa fa-ellipsis-h"></i>
                <span>实验设备管理</span>
            </a>
             <ul class="dropdown-menu">
	             <li>
	                 <a href="<%=path%>/shebei_list.action"  target="main">
	                     <span>实验设备管理</span>
	                 </a>
	             </li>
	             <li>
	                 <a href='<%=path %>/shebei_add.action'  target="main">
	                     <span>实验设备添加</span>
	                 </a>
	             </li>	 	             
	         </ul>
        </li>
        
        
    </ul>
</nav>