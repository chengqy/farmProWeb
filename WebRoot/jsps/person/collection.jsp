<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	if (request.getAttribute("collectList") == null) {
%>
<jsp:forward page="/myCollection/getList.action"></jsp:forward>
<%
	}
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>我的收藏</title>

<link href="<%=path%>/css/admin.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/amazeui.css" rel="stylesheet" type="text/css">

<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/colstyle.css" rel="stylesheet" type="text/css">

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
				<!-- 搜索框 -->
				<jsp:include page="/jsps/include/search.jsp" />

				<div class="clear"></div>
			</div>
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

				<div class="user-collection">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">我的收藏</strong> / <small>My&nbsp;Collection</small>
						</div>
					</div>
					<hr />

					<div class="you-like">
						<div class="s-bar">
							我的收藏
							<!-- <a class="am-badge am-badge-danger am-round">降价</a>
								<a class="am-badge am-badge-danger am-round">下架</a> -->
						</div>
						<div class="s-content">
							<c:choose>
								<c:when test="${empty collectList }">
									<p align="center">暂无商品~快去选购吧~</p>
								</c:when>
								<c:otherwise>
									<c:forEach var="collect" items="${collectList }">
										<div class="s-item-wrap">
											<div class="s-item">

												<div class="s-pic">
													<a href="<%=path%>/product/getProById.action?id=${collect.proId}" class="s-pic-link"> <img
														style="height: 180px" src="<%=path%>/${collect.proImage }"
														class="s-pic-img s-guess-item-img">
														 <c:if test="${collect.status eq 0 }">
															<span class="tip-title">已下架</span>
														</c:if>
													</a>
												</div>
												<div class="s-info">
													<div class="s-title">
														<a href="<%=path%>/product/getProById.action?id=${collect.proId}" >${collect.proName}</a>
													</div>
													<div class="s-price-box">
														<span class="s-price"><em class="s-price-sign">¥</em><em
															class="s-value">${collect.price }</em></span>
													</div>
												</div>
												<div class="s-tp">
													<a
														href="<%=path%>/myCollection/delete.action?id=${collect.id}"><span
														class="ui-btn-loading-before">取消收藏</span> </a> <a
														href="<%=path%>/myCollection/addCartItem.action?proId=${collect.proId}&amount=1"><span
														class="ui-btn-loading-before buy">加入购物车</span></a>
													<!-- <p>
														<a href="javascript:;" class="c-nodo J_delFav_btn">取消收藏</a>
													</p> -->
												</div>
											</div>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>


						</div>

						<!-- <div class="s-more-btn i-load-more-item" data-screen="0">
							<i class="am-icon-refresh am-icon-fw"></i>
						</div> -->

					</div>

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
						<li class="active"><a href="<%=path%>/jsps/person/collection.jsp">收藏</a></li>
						<li><a href="<%=path%>/jsps/person/foot.jsp">足迹</a></li>
					</ul>
				</li>

			</ul>
		</aside>
	</div>

</body>

</html>