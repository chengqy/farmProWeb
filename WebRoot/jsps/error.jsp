<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>错误提示</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="<%=path%>/css/admin.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/amazeui.css" rel="stylesheet" type="text/css">

<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/infstyle.css" rel="stylesheet" type="text/css">
<script src="<%=path%>/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=path%>/js/amazeui.js" type="text/javascript"></script>
>

</head>

<body>
	<!--头 -->
	<header> 
		<article>
			<div class="mt-logo">
				
				<!-- 搜索框 -->
				<jsp:include page="/jsps/include/search.jsp" />
		
				<div class="clear"></div>
			</div>
		</article>
	</header>
	<b class="line"></b>
	<div class="center">
		<p align="center">发生[${message}]错误！请重新操作或联系管理员！</p>
	</div>
</body>


</html>
