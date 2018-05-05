<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>My JSP 'sidebar.jsp' starting page</title>

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
	<div id="wrap">
		<div id="prof" class="item ">
			<a href="# "> <span class="setting "></span>
			</a>
			<div class="ibar_login_box status_login ">
				<c:choose>
					<c:when test="${empty sessionScope.loginSession }">
						<div class="avatar_box ">
							<p class="avatar_imgbox ">
								<img src="<%=path%>/images/no-img_mid_.jpg " />
							</p>
							<ul class="user_info ">
								
							</ul>
							<div class="login_btnbox ">
							<a href="<%=path%>/jsps/login.jsp" target="_top" class="h">请登录</a>
						</div>
						</div>

					</c:when>
					<c:otherwise>
						<div class="avatar_box ">
							<p class="avatar_imgbox ">
								<img src="<%=path%>/${sessionScope.loginSession.headImg } " />
							</p>
							<ul class="user_info ">
								欢迎您！${sessionScope.loginSession.username }
							</ul>
						</div>
						<div class="login_btnbox ">
							<a href="<%=path%>/jsps/person/order.jsp " class="login_order ">我的订单</a>
							<a href="<%=path%>/jsps/person/collection.jsp"
								class="login_favorite ">我的收藏</a>
						</div>

					</c:otherwise>
				</c:choose>
				
				<i class="icon_arrow_white "></i>
			</div>

		</div>
		<div id="shopCart " class="item ">
			<a href="<%=path%>/jsps/shopcart.jsp"> <span class="message "></span>
			</a>
			<p>购物车</p>
			<p class="cart_num ">
				<c:choose>
					<c:when test="${empty sessionScope.cartSession }">
						0
					</c:when>
					<c:otherwise>
						${cartSession }		
					</c:otherwise>
				</c:choose>
			</p>
		</div>

		<div id="foot " class="item ">
			<a href="<%=path%>/jsps/person/foot.jsp"> <span class="zuji "></span>
			</a>
			<div class="mp_tooltip ">
				我的足迹 <i class="icon_arrow_right_black "></i>
			</div>
		</div>

		<div id="brand " class="item ">
			<a href="<%=path%>/jsps/person/collection.jsp"> <span class="wdsc "><img
					src="<%=path%>/images/wdsc.png " /></span>
			</a>
			<div class="mp_tooltip ">
				我的收藏 <i class="icon_arrow_right_black "></i>
			</div>
		</div>

		<div class="quick_toggle ">
			<li class="qtitem "><a href="#top " class="return_top "><span
					class="top "></span></a></li>
		</div>

	</div>
</body>
</html>
