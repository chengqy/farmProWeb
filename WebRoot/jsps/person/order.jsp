<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	if (request.getAttribute("orderList") == null) {
%>
<jsp:forward page="/order/getList.action"></jsp:forward>
<%
	}
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>订单管理</title>

<link href="<%=path%>/css/admin.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/amazeui.css" rel="stylesheet" type="text/css">

<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/orstyle.css" rel="stylesheet" type="text/css">

<script src="<%=path%>/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=path%>/js/amazeui.js" type="text/javascript"></script>
<script type="text/javascript">
	function del(a) {
		if(a==1){
			var msg = "您真的确定要取消订单吗？\n\n请确认！";
		}else if(a==2){
			var msg = "请确保您已经收到货！";
		}
		
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}
</script>
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

				<div class="user-order">

					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small>
						</div>
					</div>
					<hr />

					<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

						<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
							<li class="am-active"><a href="#tab1">所有订单</a></li>
							<li><a href="#tab2">待付款</a></li>
							<li><a href="#tab3">待发货</a></li>
							<li><a href="#tab4">待收货</a></li>
						</ul>

						<div class="am-tabs-bd">
							<div class="am-tab-panel am-fade am-in am-active" id="tab1">
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
									<div class="order-list">
										<c:choose>
											<c:when test="${ empty orderList.allList }">
												<p align="center">暂无订单~快去选购吧~</p>
											</c:when>
											<c:otherwise>
												<c:forEach var="order" items="${orderList.allList }">
													<div class="order-status5">
														<div class="order-title">
															<div class="dd-num">
																订单编号：<a href="javascript:;">${order.orderNum }</a>
															</div>
															<span>成交时间：${order.time }</span>
														</div>
														<div class="order-content">
															<div class="order-left">
																<c:forEach var="item" items="${order.orderItemList }">
																	<ul class="item-list">
																		<li class="td td-item">
																			<div class="item-pic">
																				<a href="#" class="J_MakePoint"> <img
																					src="<%=path %>/${item.proImage }"
																					class="itempic J_ItemImg">
																				</a>
																			</div>
																			<div class="item-info">
																				<div class="item-basic-info">
																					<a href="#">
																						<p>${item.proName }</p>
																						<p class="info-little">${item.specification }
																						</p>
																					</a>
																				</div>
																			</div>
																		</li>
																		<li class="td td-price">
																			<div class="item-price">${item.price }</div>
																		</li>
																		<li class="td td-number">
																			<div class="item-number">
																				<span>×</span>${item.amount }
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
																	<div class="item-amount">
																		合计：${order.subTotal }
																		<!-- <p>
																		含运费：<span>10.00</span>
																	</p> -->
																	</div>
																</li>


																<div class="move-right">
																	<!--交易成功-->
																	<c:if test="${order.state eq 4 }">
																		<li class="td td-status">
																			<div class="item-status">
																				<p class="Mystatus">交易成功</p>
																				<p class="order-info">
																					<a href="<%=path%>/order/getOrderDetail.action?orderId=${order.orderId}">订单详情</a>
																				</p>

																			</div>
																		</li>
																		<li class="td td-change">
																			<div class="am-btn am-btn-danger anniu">交易完成</div>
																		</li>
																	</c:if>
																	<!--待付款-->
																	<c:if test="${order.state eq 1}">
																		<li class="td td-status">
																			<div class="item-status">
																				<p class="Mystatus">等待买家付款</p>
																				<p class="order-info">
																					<a href="<%=path%>/order/deleted.action?orderId=${order.orderId }" onclick="javascript:return del(1)">取消订单</a>
																				</p>

																			</div>
																		</li>
																		<li class="td td-change"><a href="<%=path%>/order/payOrder.action?&orderId=${order.orderId}">
																				<div class="am-btn am-btn-danger anniu">一键支付</div>
																		</a></li>
																	</c:if>
																	<!--待发货-->
																	<c:if test="${order.state eq 2 }">
																		<li class="td td-status">
																			<div class="item-status">
																				<p class="Mystatus">买家已付款</p>
																				<p class="order-info">
																					<a href="<%=path%>/order/getOrderDetail.action?orderId=${order.orderId}">订单详情</a>
																				</p>
																				<p class="order-info">
																					<a href="<%=path%>/order/deleted.action?orderId=${order.orderId }">取消订单</a>
																				</p>
																			</div>
																		</li>
																		<li class="td td-change">
																			<div class="am-btn am-btn-danger anniu">等待发货</div>
																		</li>
																	</c:if>
																	<!--待收货-->
																	<c:if test="${order.state eq 3 }">
																		<li class="td td-status">
																			<div class="item-status">
																				<p class="Mystatus">卖家已发货</p>
																				<p class="order-info">
																					<a href="<%=path%>/order/getOrderDetail.action?orderId=${order.orderId}">订单详情</a>
																				</p>

																			</div>
																		</li>
																		<li class="td td-change">
																			<a href="<%=path%>/order/changeState.action?orderId=${order.orderId}&state=4" onclick="javascript:return del(2)"><div class="am-btn am-btn-danger anniu">确认收货</div></a>
																		</li>
																	</c:if>
																	<!--待评价-->
																	<%-- <c:if test="${order.state eq 4 }">
																		<li class="td td-status">
																			<div class="item-status">
																				<p class="Mystatus">交易成功</p>
																				<p class="order-info">
																					<a href="<%=path%>/order/getOrderDetail.action?orderId=${order.orderId}">订单详情</a>
																				</p>
																			</div>
																		</li>
																		<li class="td td-change"><a
																			href="commentlist.html">
																				<div class="am-btn am-btn-danger anniu">评价商品</div>
																		</a></li>
																	</c:if> --%>

																</div>


															</div>
														</div>
													</div>
												</c:forEach>

											</c:otherwise>
										</c:choose>

									</div>

								</div>

							</div>

							<!-- 待付款 -->
							<div class="am-tab-panel am-fade" id="tab2">

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
									<div class="order-list">
										<c:choose>
											<c:when test="${ empty orderList.payList }">
												<p align="center">暂无订单~快去选购吧~</p>
											</c:when>
											<c:otherwise>
												<c:forEach var="order" items="${orderList.payList }">
													<div class="order-status1">
														<div class="order-title">
															<div class="dd-num">
																订单编号：<a href="javascript:;">${order.orderId }</a>
															</div>
															<span>成交时间：${order.time }</span>
														</div>
														<div class="order-content">
															<div class="order-left">
																<c:forEach var="item" items="${order.orderItemList }">
																	<ul class="item-list">
																		<li class="td td-item">
																			<div class="item-pic">
																				<a href="#" class="J_MakePoint"> <img
																					src="<%=path %>/${item.proImage }"
																					class="itempic J_ItemImg">
																				</a>
																			</div>
																			<div class="item-info">
																				<div class="item-basic-info">
																					<a href="#">
																						<p>${item.proName }</p>
																						<p class="info-little">${item.specification }
																						</p>
																					</a>
																				</div>
																			</div>
																		</li>
																		<li class="td td-price">
																			<div class="item-price">${item.price }</div>
																		</li>
																		<li class="td td-number">
																			<div class="item-number">
																				<span>×</span>${item.amount }
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
																	<div class="item-amount">
																		合计：${order.subTotal }
																		<!-- <p>
																		含运费：<span>10.00</span>
																	</p> -->
																	</div>
																</li>

																<div class="move-right">
																	<li class="td td-status">
																		<div class="item-status">
																			<p class="Mystatus">等待买家付款</p>
																			<p class="order-info">
																				<a href="<%=path%>/order/deleted.action?orderId=${order.orderId }" onclick="javascript:return del(1)">取消订单</a>
																			</p>

																		</div>
																	</li>
																	<li class="td td-change"><a href="<%=path%>/order/payOrder.action?&orderId=${order.orderId}">
																			<div class="am-btn am-btn-danger anniu">一键支付</div>
																	</a></li>

																</div>


															</div>
														</div>
													</div>
												</c:forEach>

											</c:otherwise>
										</c:choose>
									</div>

								</div>
							</div>
							<!-- 待发货 -->
							<div class="am-tab-panel am-fade" id="tab3">
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
									<div class="order-list">
										<c:choose>
											<c:when test="${ empty orderList.deliveryList }">
												<p align="center">暂无订单~快去选购吧~</p>
											</c:when>
											<c:otherwise>
												<c:forEach var="order" items="${orderList.deliveryList }">
													<div class="order-status2">
														<div class="order-title">
															<div class="dd-num">
																订单编号：<a href="javascript:;">${order.orderNum }</a>
															</div>
															<span>成交时间：${order.time }</span>
														</div>
														<div class="order-content">
															<div class="order-left">
																<c:forEach var="item" items="${order.orderItemList }">
																	<ul class="item-list">
																		<li class="td td-item">
																			<div class="item-pic">
																				<a href="#" class="J_MakePoint"> <img
																					src="<%=path %>/${item.proImage }"
																					class="itempic J_ItemImg">
																				</a>
																			</div>
																			<div class="item-info">
																				<div class="item-basic-info">
																					<a href="#">
																						<p>${item.proName }</p>
																						<p class="info-little">${item.specification }
																						</p>
																					</a>
																				</div>
																			</div>
																		</li>
																		<li class="td td-price">
																			<div class="item-price">${item.price }</div>
																		</li>
																		<li class="td td-number">
																			<div class="item-number">
																				<span>×</span>${item.amount }
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
																	<div class="item-amount">
																		合计：${order.subTotal }
																		<!-- <p>
																		含运费：<span>10.00</span>
																	</p> -->
																	</div>
																</li>

																<div class="move-right">
																	<li class="td td-status">
																		<div class="item-status">
																			<p class="Mystatus">买家已付款</p>
																			<p class="order-info">
																				<a href="<%=path%>/order/getOrderDetail.action?orderId=${order.orderId}">订单详情</a>
																			</p>
																			<p class="order-info">
																				<a href="<%=path%>/order/deleted.action?orderId=${order.orderId }">取消订单</a>
																			</p>
																		</div>
																	</li>
																	<li class="td td-change">
																		<div class="am-btn am-btn-danger anniu">等待发货</div>
																	</li>
																</div>


															</div>
														</div>
													</div>
												</c:forEach>

											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>

							<!-- 待收货 -->
							<div class="am-tab-panel am-fade" id="tab4">
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
									<div class="order-list">
										<c:choose>
											<c:when test="${ empty orderList.confirmList }">
												<p align="center">暂无订单~快去选购吧~</p>
											</c:when>
											<c:otherwise>
												<c:forEach var="order" items="${orderList.confirmList }">
													<div class="order-status3">
														<div class="order-title">
															<div class="dd-num">
																订单编号：<a href="javascript:;">${order.orderNum }</a>
															</div>
															<span>成交时间：${order.time }</span>
														</div>
														<div class="order-content">
															<div class="order-left">
																<c:forEach var="item" items="${order.orderItemList }">
																	<ul class="item-list">
																		<li class="td td-item">
																			<div class="item-pic">
																				<a href="#" class="J_MakePoint"> <img
																					src="<%=path %>/${item.proImage }"
																					class="itempic J_ItemImg">
																				</a>
																			</div>
																			<div class="item-info">
																				<div class="item-basic-info">
																					<a href="#">
																						<p>${item.proName }</p>
																						<p class="info-little">${item.specification }
																						</p>
																					</a>
																				</div>
																			</div>
																		</li>
																		<li class="td td-price">
																			<div class="item-price">${item.price }</div>
																		</li>
																		<li class="td td-number">
																			<div class="item-number">
																				<span>×</span>${item.amount }
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
																	<div class="item-amount">
																		合计：${order.subTotal }
																		<!-- <p>
																		含运费：<span>10.00</span>
																	</p> -->
																	</div>
																</li>


																<div class="move-right">

																	<li class="td td-status">
																		<div class="item-status">
																			<p class="Mystatus">卖家已发货</p>
																			<p class="order-info">
																				<a href="<%=path%>/order/getOrderDetail.action?orderId=${order.orderId}">订单详情</a>
																			</p>

																		</div>
																	</li>
																	<li class="td td-change">
																		<a href="<%=path%>/order/changeState.action?orderId=${order.orderId}&state=4" onclick="javascript:return del(2)"><div class="am-btn am-btn-danger anniu">确认收货</div></a>
																	</li>



																</div>


															</div>
														</div>
													</div>
												</c:forEach>

											</c:otherwise>
										</c:choose>
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