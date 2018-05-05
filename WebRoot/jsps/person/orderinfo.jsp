<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	if (request.getAttribute("orderDto") == null) {
%>
<jsp:forward page="/jsps/person/order.jsp"></jsp:forward>
<%
	}
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>订单详情</title>

<link href="<%=path%>/css/admin.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/amazeui.css" rel="stylesheet" type="text/css">

<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/orstyle.css" rel="stylesheet" type="text/css">

<script src="<%=path%>/js/jquery.min.js"></script>
<script src="<%=path%>/js/amazeui.js"></script>


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

				<div class="user-orderinfo">

					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">订单详情</strong> / <small>Order&nbsp;details</small>
						</div>
					</div>
					<hr />
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step"> <em class="u-progress-stage-bg"></em>
								<i class="u-stage-icon-inner">1<em class="bg"></em></i>
								<p class="stage-name">拍下商品</p>
							</span> <span class="step-2 step"> <em
								class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">2<em
									class="bg"></em></i>
								<p class="stage-name">卖家发货</p>
							</span> <span class="step-3 step"> <em
								class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">3<em
									class="bg"></em></i>
								<p class="stage-name">确认收货</p>
							</span> <span class="step-4 step"> <em
								class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">4<em
									class="bg"></em></i>
								<p class="stage-name">交易完成</p>
							</span> <span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					<div class="order-infoaside">

						<div class="order-addresslist">
							<div class="order-address">
								<div class="icon-add"></div>
								<p class="new-tit new-p-re">
									<span class="new-txt">${orderDto.receiver }</span> <span
										class="new-txt-rd2">${orderDto.phone }</span>
								</p>
								<div class="new-mu_l2a new-p-re">
									<p class="new-mu_l2cw">
										<span class="title">收货地址：</span> <span class="province">${orderDto.province
											}</span>省 <span class="city">${orderDto.city }</span>市 <span
											class="street">${orderDto.address }</span>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="order-infomain">

						<div class="order-top">
							<div class="th th-item">
								<td class="td-inner">商品</td>
							</div>
							<div class="th th-price">
								<td class="td-inner">单价</td>
							</div>
							<div class="th th-number">
								<td class="td-inner">数量</td>
							</div>
							<div class="th th-operation">
								<td class="td-inner">商品操作</td>
							</div>
							<div class="th th-amount">
								<td class="td-inner">合计</td>
							</div>
							<div class="th th-status">
								<td class="td-inner">交易状态</td>
							</div>
							<div class="th th-change">
								<td class="td-inner">交易操作</td>
							</div>
						</div>

						<div class="order-main">

							<div class="order-status3">
								<div class="order-title">
									<div class="dd-num">
										订单编号：<a href="javascript:;">${orderDto.orderNum }</a>
									</div>
									<span>成交时间：${orderDto.time }</span>
								</div>
								<div class="order-content">
									<div class="order-left">
										<c:forEach var="item" items="${orderDto.orderItemList }">
											<ul class="item-list">
												<li class="td td-item">
													<div class="item-pic">
														<a href="#" class="J_MakePoint"> <img
															src="<%=path%>/${item.proImage}"
															class="itempic J_ItemImg">
														</a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#">
																<p>${item.proName}"</p>
																<p class="info-little">${item.specification}"</p>
															</a>
														</div>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price">${item.price}</div>
												</li>
												<li class="td td-number">
													<div class="item-number">
														<span>×</span>${item.amount}
													</div>
												</li>
												<li class="td td-operation">
													<div class="item-operation"></div>
												</li>
											</ul>

										</c:forEach>

									</div>
									<div class="order-right">
										<li class="td td-amount">
											<div class="item-amount">合计：${orderDto.subTotal}</div>
										</li>
										<div class="move-right">
											<!--交易成功-->
										<c:if test="${orderDto.state eq 4 }">
											<li class="td td-status">
												<div class="item-status">
													<p class="Mystatus">交易成功</p>

												</div>
											</li>
											<li class="td td-change">
												<div class="am-btn am-btn-danger anniu">交易完成</div>
											</li>
										</c:if>
										<!--待付款-->
										<c:if test="${orderDto.state eq 1}">
											<li class="td td-status">
												<div class="item-status">
													<p class="Mystatus">等待买家付款</p>
													<p class="order-info">
														<a href="<%=path%>/order/deleted.action?orderId=${orderDto.orderId }">取消订单</a>
													</p>

												</div>
											</li>
											<li class="td td-change"><a
												href="<%=path%>/order/payOrder.action?&orderId=${order.orderId}">
													<div class="am-btn am-btn-danger anniu">一键支付</div>
											</a></li>
										</c:if>
										<!--待发货-->
										<c:if test="${orderDto.state eq 2 }">
											<li class="td td-status">
												<div class="item-status">
													<p class="Mystatus">买家已付款</p>
													<p class="Mystatus">
														<a href="<%=path%>/order/deleted.action?orderId=${orderDto.orderId }">取消订单</a>
													</p>
												</div>
											</li>
											<li class="td td-change">
												<div class="am-btn am-btn-danger anniu">等待发货</div>
											</li>
										</c:if>
										<!--待收货-->
										<c:if test="${orderDto.state eq 3 }">
											<li class="td td-status">
												<div class="item-status">
													<p class="Mystatus">卖家已发货</p>

												</div>
											</li>
											<li class="td td-change">
												<a href="<%=path%>/order/changeState.action?orderId=${orderDto.orderId}&state=4"><div class="am-btn am-btn-danger anniu">确认收货</div></a>
											</li>
										</c:if>
										</div>
										
									</div>
								</div>

							</div>
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
						<li class="active"><a href="<%=path%>/jsps/person/order.jsp">订单管理</a></li>
						
					</ul>
				</li>

				<li class="person"><a href="#">我的小窝</a>
					<ul>
						<li><a href="<%=path%>/jsps/person/collection.jsp">收藏</a></li>
						<li><a href="<%=path%>/jsps/person/foot.jsp">足迹</a></li>
					</ul>
				</li>

			</ul>

		</aside>
	</div>

</body>

</html>