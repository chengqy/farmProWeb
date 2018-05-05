<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>付款成功页面</title>
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/amazeui.css" />
	<link href="<%=path%>/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/demo.css" rel="stylesheet" type="text/css" />

		<link href="<%=path%>/css/sustyle.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="<%=path%>/js/jquery-1.7.min.js"></script>
</head>

<body>


	<!--顶部导航条 -->
	<div class="am-container header">
		<jsp:include page="/jsps/include/header.jsp" />
	</div>
	<!-- 搜索框 -->
	<jsp:include page="/jsps/include/search.jsp" />

	<div class="clear"></div>



	<div class="take-delivery">
		<div class="status">
			<h2>您已成功付款</h2>
			<div class="successInfo">
				<ul>
					<li>付款金额<em>${orderDto.subTotal }</em></li>
					<div class="user-info">
						<p>收货人：${orderDto.receiver }</p>
						<p>联系电话：${orderDto.phone }</p>
						<p>收货地址：${orderDto.province }省${orderDto.city
							}市${orderDto.address }</p>
					</div>
					请认真核对您的收货信息，如有错误请联系卖家

				</ul>
				<div class="option">
					<span class="info">您可以</span> <a href="<%=path%>/jsps/person/order.jsp"
						class="J_MakePoint">查看<span>已买到的宝贝</span></a> 
				</div>
			</div>
		</div>
	</div>

	<div class="footer">
		<jsp:include page="/jsps/include/footer.jsp" />
	</div>


</body>
</html>
