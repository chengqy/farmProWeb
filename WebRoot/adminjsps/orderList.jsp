<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	if (request.getAttribute("orderDetailInfo") == null) {
%>
<jsp:forward page="/order/getPagingList.action"></jsp:forward>
<%
	}
%>
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>后台订单管理</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png"
	href="<%=path%>/adminjsps/assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="<%=path%>/adminjsps/assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet"
	href="<%=path%>/adminjsps/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="<%=path%>/adminjsps/assets/css/admin.css">
<script src="<%=path%>/adminjsps/assets/js/jquery.min.js"></script>
<script src="<%=path%>/adminjsps/assets/js/app.js"></script>
</head>
<body>
	<!--[if lte IE 9]><p class="browsehappy">升级你的浏览器吧！ <a href="http://se.360.cn/" target="_blank">升级浏览器</a>以获得更好的体验！</p><![endif]-->
</head>

<body>
	<header class="am-topbar admin-header">
		<div class="am-collapse am-topbar-collapse" id="topbar-collapse">
			<jsp:include page="/adminjsps/include/topbar.jsp" />
		</div>
	</header>

	<div class="am-cf admin-main">

		<div class="nav-navicon admin-main admin-sidebar">


			<div class="sideMenu am-icon-dashboard"
				style="color:#aeb2b7; margin: 10px 0 0 0;">欢迎系统管理员：${sellerSession.sellerName}</div>
			<div class="sideMenu">
				<h3 class="am-icon-flag">
					<em></em> <a href="#">商品管理</a>
				</h3>
				<ul>
					<li><a href="<%=path%>/adminjsps/productList.jsp">商品列表</a></li>
					<li><a href="<%=path%>/adminjsps/addPro.jsp">添加新商品</a></li>
				</ul>
				<h3 class="am-icon-cart-plus on">
					<em></em> <a href="<%=path%>/adminjsps/orderList.jsp"> 订单管理</a>
				</h3>
				<ul>
					<li><a href="<%=path%>/adminjsps/orderList.jsp">订单列表</a></li>
				</ul>
			</div>
			<!-- sideMenu End -->

			<script type="text/javascript">
				jQuery(".sideMenu").slide({
					titCell : "h3", //鼠标触发对象
					targetCell : "ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
					effect : "slideDown", //targetCell下拉效果
					delayTime : 300, //效果时间
					triggerTime : 150, //鼠标延迟触发时间（默认150）
					defaultPlay : true,//默认是否执行效果（默认true）
					returnDefault : true
				//鼠标从.sideMen移走后返回默认状态（默认false）
				});
			</script>

		</div>

		<div class=" admin-content">

			<jsp:include page="/adminjsps/include/daohang.jsp" />
			<div class="admin-biaogelist">
				<div class="listbiaoti am-cf">
					<ul class="am-icon-flag on">栏目名称
					</ul>
					<dl class="am-icon-home" style="float: right;">
						当前位置： 首页 >
						<a href="#">订单列表</a>
					</dl>

				</div>
				<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
					<form action="<%=path%>/order/getPagingList.action" method="post">
						<ul>
							<li>
								<div class="am-btn-group am-btn-group-xs">
									<select
										data-am-selected="{btnWidth: 90, btnSize: 'sm', btnStyle: 'default'}"
										name="status">
										<option value="">订单状态</option>
										<c:forEach var="status" items="${orderDetailInfo.statusList }">
											<c:choose>
												<c:when
													test="${status.status eq orderDetailInfo.orderPageParam.status }">
													<option value="${status.status }" selected="selected">${status.name
														}</option>
												</c:when>
												<c:otherwise>
													<option value="${status.status }" >${status.name}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>

									</select>
								</div>
							</li>

							<li><input type="text"
								class="am-form-field am-input-sm am-input-xm"
								placeholder="关键词搜索" name="keyword"
								value="${orderDetailInfo.orderPageParam.keyword}" /></li>
							<li><button type="submit"
									class="am-btn am-radius am-btn-xs am-btn-success"
									style="margin-top: -1px;">搜索</button></li>
						</ul>
					</form>
				</div>
				<c:choose>
					<c:when test="${empty orderDetailInfo.allList }">
						<p align="center">暂无订单~</p><br><br><br><br>
					</c:when>
					<c:otherwise>
						<form class="am-form am-g">
							<table width="100%"
								class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
								<thead>
									<tr class="am-success">
		
										<th class="table-title">订单编号</th>
										<th class="table-type">收货地址</th>
										<th class="table-author am-hide-sm-only">收货人</th>
										<th class="table-author am-hide-sm-only">购买总额</th>
										<th class="table-date am-hide-sm-only">购买日期</th>
										<th class="table-author am-hide-sm-only">订单状态</th>
										<th width="130px" class="table-set">操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="order" items="${orderDetailInfo.allList }">
										<tr>
											<td><a href="#">${order.orderNum }</a></td>
											<c:choose>
												<c:when test="${empty order.province}">
													<td>未支付</td>
												</c:when>
												<c:otherwise>
													<td>${order.province}省${order.city}市${order.address}</td>
												</c:otherwise>
											</c:choose>
											<td class="am-hide-sm-only">${order.receiver}</td>
											<td class="am-hide-sm-only">${order.subTotal}</td>
											<td class="am-hide-sm-only">${order.time}</td>
											<c:choose>
												<c:when test="${order.state eq 1}">
													<td class="am-hide-sm-only">待支付</td>
												</c:when>
												<c:when test="${order.state eq 2}">
													<td class="am-hide-sm-only">待发货</td>
												</c:when>
												<c:when test="${order.state eq 3}">
													<td class="am-hide-sm-only">待收货</td>
												</c:when>
												<c:when test="${order.state eq 4}">
													<td class="am-hide-sm-only">已完成</td>
												</c:when>
											</c:choose>
											
											<td>
												<div class="am-btn-toolbar">
													<div class="am-btn-group am-btn-group-xs">
														<c:if test="${order.state eq 2}">
															<button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round"
																data-am-modal="{target: '#my-popups'}" title="发货"><a href="<%=path%>/order/adminChangeState.action?orderId=${order.orderId}&state=3" class="am-icon-pencil-square-o"></a>
															<!-- <span class="am-icon-pencil-square-o"></span> -->
															</button>							
														</c:if>
														
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
									
								</tbody>
							</table>
		
							<div class="am-btn-group am-btn-group-xs">
								
							</div>
		
							<ul class="am-pagination am-fr">
								<c:choose>
									<c:when test="${orderDetailInfo.orderPageParam.current eq 1}">
										<li>«</li>
									</c:when>
									<c:otherwise>
										<li><a
											href="<%=path%>/order/getPagingList.action?status=${orderDetailInfo.orderPageParam.status}
								&keyword=${orderDetailInfo.orderPageParam.keyword}
								&queryPage=${orderDetailInfo.orderPageParam.current-1}">«</a></li>
									</c:otherwise>
								</c:choose>
								<li class="am-active"><a href="#">${orderDetailInfo.orderPageParam.current
										}</a></li>
								<c:choose>
									<c:when
										test="${orderDetailInfo.orderPageParam.current eq orderDetailInfo.orderPageParam.totalPage}">
										<li>»</li>
									</c:when>
									<c:otherwise>
										<li><a href="<%=path%>/order/getPagingList.action?status=${orderDetailInfo.orderPageParam.status}
								&keyword=${orderDetailInfo.orderPageParam.keyword}
								&queryPage=${orderDetailInfo.orderPageParam.current+1}">»</a></li>
									</c:otherwise>
								</c:choose>
								<li>共${orderDetailInfo.orderPageParam.totalPage }页</li>
								<li>到第</li>
								<li><input type="text" name="queryPage"
									style=" height:10px; width: 60px"></li>
								<li>页</li>
								<li><input type="submit" value="确定" /></li>
							</ul>
		
							<hr />
							
						</form>
					</c:otherwise>
				</c:choose>
				<div class="foods">
					<jsp:include page="/adminjsps/include/footer.jsp" />
				</div>

			</div>

		</div>

	</div>
	<script src="<%=path%>/adminjsps/assets/js/amazeui.min.js"></script>
</body>
</html>