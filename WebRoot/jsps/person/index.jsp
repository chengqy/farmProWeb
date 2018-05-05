<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	if (request.getAttribute("personInit") == null) {
%>
<jsp:forward page="/user/personInit.action"></jsp:forward>
<%
	}
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>个人中心</title>

<link href="<%=path%>/css/admin.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/amazeui.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/systyle.css" rel="stylesheet" type="text/css">

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
				<div class="wrap-left">
					<div class="wrap-list">
						<div class="m-user">
							<!--个人信息 -->
							<div class="m-bg"></div>
							<div class="m-userinfo">
								<div class="m-baseinfo">
									<a href="information.jsp"> <img
										src="<%=path %>/${sessionScope.loginSession.headImg}">
									</a> <em class="s-name">${sessionScope.loginSession.username }<span
										class="vip1"></em>
									<div class="s-prestige am-btn am-round">
										</span>
									</div>
								</div>
								<div class="m-right">
									<div class="m-address">
										<a href="<%=path%>/jsps/person/address.jsp" class="i-trigger">我的收货地址</a>
									</div>
								</div>
							</div>


						</div>
						<div class="box-container-bottom"></div>

						<!--订单 -->
						<div class="m-order">
							<div class="s-bar">
								<i class="s-icon"></i>我的订单 
							</div>
							<ul>
								<li><a href="<%=path%>/jsps/person/order.jsp""><i><img
											src="<%=path%>/images/pay.png" /></i><span>待付款<em
											class="m-num">${personInit.payCount }</em></span></a></li>
								<li><a href="<%=path%>/jsps/person/order.jsp""><i><img
											src="<%=path%>/images/send.png" /></i><span>待发货<em
											class="m-num">${personInit.sendCount }</em></span></a></li>
								<li><a href="<%=path%>/jsps/person/order.jsp""><i><img
											src="<%=path%>/images/receive.png" /></i><span>待收货<em
											class="m-num">${personInit.confirmCount }</em></span></a></li>
								<li><a href="<%=path%>/jsps/person/order.jsp""><i><img
											src="<%=path%>/images/comment.png" /></i><span>全部订单</span></a></li>

							</ul>
						</div>
						<!--收藏夹 -->
						<div class="you-like">
							<div class="s-bar">我的收藏</div>
							<div class="s-content">
								<c:forEach var="collection" items="${personInit.collection }">
									<div class="s-item-wrap">
										<div class="s-item">

											<div class="s-pic">
												<a href="<%=path%>/product/getProById.action?id=${collection.proId}" class="s-pic-link"> <img
													style="height: 200px"
													src="<%=path %>/${collection.proImage}"
													class="s-pic-img s-guess-item-img">
												</a>
											</div>
											<div class="s-price-box">
												<span class="s-price"><em class="s-price-sign">¥</em><em
													class="s-value">${collection.price}</em></span>
											</div>
											<div class="s-title">
												<a href="<%=path%>/product/getProById.action?id=${collection.proId}">${collection.proName}</a>
											</div>
										</div>
									</div>
								</c:forEach>


							</div>



							<div class="s-more-btn i-load-more-item" data-screen="0">
								<i class="am-icon-refresh am-icon-fw"></i>更多
							</div>

						</div>

					</div>
				</div>
				<div class="wrap-right">

					<!-- 日历-->
					<div class="day-list">
						<div class="s-bar">
							<a class="i-history-trigger s-icon" href="#"></a>我的日历 <a
								class="i-setting-trigger s-icon" href="#"></a>
						</div>
						<div class="s-care s-care-noweather">
							<div class="s-date">
								<em id="day">21</em> <span id="week">星期一</span> <span id="date">2015.12</span>
								<script>
									document.getElementById('day').innerHTML = new Date()
											.getDate();
									document.getElementById('week').innerHTML = ' 星期'
											+ '日一二三四五六'.charAt(new Date()
													.getDay());
									document.getElementById('date').innerHTML = new Date()
											.getFullYear()
											+ '.' + (new Date().getMonth() + 1);
								</script>
							</div>
						</div>
					</div>

					<!--热卖推荐 -->
					<div class="new-goods">
						<div class="s-bar">
							<i class="s-icon"></i>热卖推荐
						</div>
						<div class="new-goods-info">
							<a class="shop-info" href="<%=path%>/product/getProById.action?id=${personInit.hot.proId}" target="_blank">
								<div>
									<img src="<%=path%>/${personInit.hot.proImage}" alt="">
								</div> <span class="one-hot-goods">￥${personInit.hot.price}</span>
							</a>
						</div>
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
				<li class="person active"><a
					href="<%=path%>/jsps/person/index.jsp">个人中心</a></li>
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

					</ul></li>


				<li class="person"><a href="#">我的小窝</a>
					<ul>
						<li><a href="<%=path%>/jsps/person/collection.jsp">收藏</a></li>
						<li><a href="<%=path%>/jsps/person/foot.jsp">足迹</a></li>
					</ul></li>

			</ul>

		</aside>
	</div>
</body>

</html>