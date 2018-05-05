<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	if (request.getAttribute("scanList") == null) {
%>
<jsp:forward page="/scan/getList.action"></jsp:forward>
<%
	}
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>我的足迹</title>

<link href="<%=path%>/css/admin.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/amazeui.css" rel="stylesheet" type="text/css">

<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/footstyle.css" rel="stylesheet"
	type="text/css">

</head>

<body>
	<!--头 -->
	<header>
		<article>
			<div class="mt-logo">
				<!--顶部导航条 -->
				<div class="am-container header">
					<jsp:include page="/jsps/include/header.jsp" />
				</div>

				<!--悬浮搜索框-->

				<jsp:include page="/jsps/include/search.jsp" />

				<div class="clear"></div>
			</div>
		</article>
	</header>
	<div class="nav-table">
		<jsp:include page="/jsps/include/shopnav.jsp" />
	</div>
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-foot">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">我的足迹</strong> / <small>Browser&nbsp;History</small>
						</div>
					</div>
					<hr />

					<!--足迹列表 -->
					<c:choose>
						<c:when test="${empty scanList }">
							<p align="center">暂无足迹~</p>
						</c:when>
						<c:otherwise>
							<c:forEach var="scan" items="${scanList }">
								<div class="goods">

									<div class="goods-box first-box">
										<div class="goods-pic">
											<div class="goods-pic-box">
												<a class="goods-pic-link" target="_blank" href="<%=path%>/product/getProById.action?id=${scan.proId}">
												 <img src="<%=path%>/${scan.proImage}" style="height: 200px"
													class="goods-img"></a>
											</div>
											<a class="goods-delete"
												href="<%=path %>/scan/delete.action?id=${scan.id}"><i
												class="am-icon-trash"></i></a>
											<c:if test="${scan.status eq 0}">
												<div class="goods-status goods-status-show">
													<span class="desc">宝贝已下架</span>
												</div>
											</c:if>

										</div>

										<div class="goods-attr">
											<div class="good-title">
												<a class="title" href="<%=path%>/product/getProById.action?id=${scan.proId}" target="_blank">${scan.proName}</a>
											</div>
											<div class="goods-price">
												<span class="g_price"> <span>¥</span><strong>${scan.price}</strong>
												</span>
											</div>
											<div class="clear"></div>
											<div class="goods-num">
												<div class="match-recom">
													<a
														href="<%=path %>/product/getPagingList.action?cateId=${scan.cateId}"
														class="match-recom-item">找相似</a> <i><em></em><span></span></i>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</div>
			</div>

			<!--底部-->
			<div class="footer">
				<jsp:include page="/jsps/include/footer.jsp" />
			</div>
		</div>

		<aside class="menu">
			<ul>
				<li class="person"><a href="<%=path%>/jsps/person/index.jsp">个人中心</a></li>
				<li class="person"><a href="#">个人资料</a>
					<ul>
						<li><a href="<%=path%>/jsps/person/information.jsp">个人信息</a></li>
						<li><a href="<%=path%>/jsps/person/password.jsp">修改密码</a></li>
						<li><a href="<%=path%>/jsps/person/bindphone.jsp">换绑手机</a></li>
						<li><a href="<%=path%>/jsps/person/address.jsp">收货地址</a></li>
					</ul></li>
				<li class="person"><a href="#">我的交易</a>
					<ul>
						<li><a href="<%=path%>/jsps/person/order.jsp">订单管理</a></li>
						
					</ul>
				</li>

				<li class="person"><a href="#">我的小窝</a>
					<ul>
						<li><a href="<%=path%>/jsps/person/collection.jsp">收藏</a></li>
						<li  class="active"><a href="<%=path%>/jsps/person/foot.jsp">足迹</a></li>
					</ul>
				</li>

			</ul>
		</aside>
	</div>

</body>

</html>