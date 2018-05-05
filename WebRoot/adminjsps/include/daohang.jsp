<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'daohang.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <div class="daohang">
				<ul>
					<li><button type="button"
							class="am-btn am-btn-default am-radius am-btn-xs" ><a href="<%=path%>/adminjsps/index.jsp">首页</a></li>
					<li><button type="button"
							class="am-btn am-btn-default am-radius am-btn-xs">
							<a href="<%=path%>/adminjsps/orderList.jsp">订单管理</a>
							<a href="javascript:void(0);" class="am-close am-close-spin"
								data-am-modal-close="">×</a>
						</button></li>
					<li><button type="button"
							class="am-btn am-btn-default am-radius am-btn-xs">
							<a href="<%=path%>/adminjsps/productList.jsp">商品管理</a>
							<a href="javascript:void(0);" class="am-close am-close-spin"
								data-am-modal-close="">×</a>
						</button></li>
				</ul>
			</div>
  </body>
</html>
