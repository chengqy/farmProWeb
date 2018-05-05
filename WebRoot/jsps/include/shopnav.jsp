<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="long-title">
		<span class="all-goods"><a class="all-goods"
			style="color: white" href="<%=path%>/product/getPagingList.action">全部分类</a></span>
	</div>
	<div class="nav-cont">
		<ul>
			<li class="index"><a href="<%=path%>/jsps/main.jsp">首页</a></li>
			<li class="qc last"><a href="<%=path%>/product/getPagingList.action">地区频道</a></li>
		</ul>
		<div class="nav-extra">
			<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b><a href="<%=path%>/jsps/person/order.jsp">我的订单</a>
			 <i class="am-icon-angle-right" style="padding-left: 10px;"></i>
		</div>
	</div>
</body>
</html>