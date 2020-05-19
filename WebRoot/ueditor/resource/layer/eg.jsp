<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="http://cdn.bootcss.com/jquery/1.12.3/jquery.min.js"></script>
  </head>
  
  <body>
       <s:if test="#session.user==null">
			<form action="<%=path %>/userLogin.action" name="userLogin" method="post">
			      <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
						   <input type="button" value="注  册" id="reg" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
			            </td>
			          </tr>
			      </table>
		    </form>
		    </s:if>
		    <s:else>
		        <br/>
			     欢迎您：<s:property value="#session.user.userName"/> &nbsp;&nbsp;&nbsp;&nbsp;
			    <a href="<%=path %>/userLogout.action">安全退出</a> &nbsp;&nbsp;&nbsp;&nbsp;
			    <br/><br/><br/>
			</s:else>
			<!-- js  之前加载jquery -->
		<script src="<%=path %>/js/layer/layer.js"></script>	
		<script>
		//关于
		$('#reg').on('click', function(){
		 //layer.alert(layer.v + ' - ddd');
					//如果是iframe层
			  layer.open({
			  type: 2, 
			  area: ['500px', '600px'],
	          shadeClose: true, //点击遮罩关闭
			  content: ['<%=path %>/qiantai/userinfo/userReg.jsp','no'] 
			  //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
			});   
		});
		</script>
  </body>
</html>
