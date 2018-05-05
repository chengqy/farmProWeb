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
	content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>结算页面</title>

<link href="<%=path%>/css/amazeui.css" rel="stylesheet" type="text/css" />

<link href="<%=path%>/css/demo.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/cartstyle.css" rel="stylesheet"
	type="text/css" />

<link href="<%=path%>/css/jsstyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path%>/js/address.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-1.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var to = $('#to')
		// var from=$('.defaultAddr');
		var fromAddr = $('.defaultAddr .buy--address-detail')
		to.html(fromAddr.html())
		$('.to-buy-address-detail').html(
				$('.defaultAddr .buy-address-detail').html())
		$('.user-addresslist').on(
				'click',
				function() {
					var fromAddr = $('.defaultAddr .buy--address-detail')
					to.html(fromAddr.html())
					$('.to-buy-address-detail').html(
							$('.defaultAddr .buy-address-detail').html())
				})

	}
</script>
</head>

<body>

	<!--顶部导航条 -->
	<div class="am-container header">
		<jsp:include page="/jsps/include/header.jsp" />
	</div>

	<jsp:include page="/jsps/include/search.jsp" />

	<div class="clear"></div>
	<div class="concent">
		<!--地址 -->
		<div class="paycont">
			<div class="address">
				<h3>确认收货地址</h3>
				<div class="control">
					<a href="<%=path%>/jsps/person/address.jsp"><div
							class="tc-btn createAddr theme-login am-btn am-btn-danger">管理地址</div></a>
				</div>
				<div class="clear"></div>
				<ul>
					<c:choose>
						<c:when test="${empty orderDto.addressList }">
							<p align="center">暂时没有收货地址~快去添加</p>
						</c:when>
						<c:otherwise>
							<c:forEach var="address" items="${orderDto.addressList }">
								<c:choose>
									<c:when test="${address.status eq 1}">
										<div class="per-border"></div>
										<li class="user-addresslist defaultAddr">
											<div class="address-left">
												<div class="user DefaultAddr">
													<span class="buy-address-detail"> <span
														class="buy-user">${address.receiver } </span> <span
														class="buy-phone">${address.phone }</span> <input
														type="hidden" name="addressId" value="${address.id }" />
													</span>
												</div>
												<div class="default-address DefaultAddr">
													<span class="buy-line-title buy-line-title-type">收货地址：</span>
													<span class="buy--address-detail"> <span
														class="province">${address.province }</span>省 <span
														class="city">${address.city }</span>市 <span class="street">${address.address
															}</span>
													</span> </span>
												</div>
												<ins class="deftip">默认地址</ins>

											</div>

											<div class="clear"></div>
										</li>
									</c:when>
									<c:otherwise>
										<div class="per-border"></div>
										<li class="user-addresslist">
											<div class="address-left">
												<div class="user DefaultAddr">
													<span class="buy-address-detail"> <span
														class="buy-user">${address.receiver } </span> <span
														class="buy-phone">${address.phone } </span> <input
														type="hidden" name="addressId" value="${address.id }" />
													</span>
												</div>
												<div class="default-address DefaultAddr">
													<span class="buy-line-title buy-line-title-type">收货地址：</span>
													<span class="buy--address-detail"> <span
														class="province">${address.province }</span>省 <span
														class="city">${address.city }</span>市 <span class="street">${address.address
															}</span>
													</span>
												</div>
												<!-- <ins class="deftip hidden">默认地址</ins> -->
											</div>
											<div class="address-right">
												<span class="am-icon-angle-right am-icon-lg"></span>
											</div>
											<div class="clear"></div>



										</li>

									</c:otherwise>

								</c:choose>
							</c:forEach>
						</c:otherwise>

					</c:choose>

				</ul>

				<div class="clear"></div>
			</div>


			<!--订单 -->
			<div class="concent">
				<div id="payTable">
					<h3>确认订单信息</h3>
					<div class="cart-table-th">
						<div class="wp">

							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">金额</div>
							</div>

						</div>
					</div>
					<c:forEach var="item" items="${orderDto.orderItemList }">
						<div class="clear"></div>

						<tr class="item-list">
							<div class="bundle  bundle-last">

								<div class="bundle-main">
									<ul class="item-content clearfix">
										<div class="pay-phone">
											<li class="td td-item">
												<div class="item-pic">
													<a href="#" class="J_MakePoint"> <img
														src="<%=path%>/${item.proImage}" class="itempic J_ItemImg"></a>
												</div>
												<div class="item-info">
													<div class="item-basic-info">
														<a href="#" class="item-title J_MakePoint"
															data-point="tbcart.8.11">${item.proName}</a>
													</div>
												</div>
											</li>
											<li class="td td-info">
												<div class="item-props">
													<span class="sku-line">规格：${item.specification}</span>
												</div>
											</li>
											<li class="td td-price">
												<div class="item-price price-promo-promo">
													<div class="price-content">
														<em class="J_Price price-now">${item.price}</em>
													</div>
												</div>
											</li>
										</div>
										<li class="td td-amount">
											<div class="amount-wrapper ">
												<div class="item-amount ">
													<span class="phone-title">购买数量</span>
													<div class="sl">
														<span class="text_box">${item.amount}</span>
													</div>
												</div>
											</div>
										</li>
										<li class="td td-sum">
											<div class="td-inner">
												<em tabindex="0" class="J_ItemSum number">${item.total}</em>
											</div>
										</li>
									</ul>
									<div class="clear"></div>
								</div>
							</div>
						</tr>
					</c:forEach>

				</div>
			</div>
			<div class="clear"></div>

			<!--含运费小计 -->
			<div class="buy-point-discharge ">
				<p class="price g_price ">
					合计（含运费） <span>¥</span><em class="pay-sum">${orderDto.subTotal}</em>
				</p>
			</div>

			<!--信息 -->
			<div class="order-go clearfix">
				<div class="pay-confirm clearfix">
					<form name="form1" action="<%=path%>/order/pay.action"
						method="post">
						<input type="hidden" name="orderId" value="${orderDto.orderId}" />
						<div class="box">
							<div tabindex="0" id="holyshit267" class="realPay">
								<em class="t">实付款：</em> <span class="price g_price "> <span>¥</span>
									<em class="style-large-bold-red " id="J_ActualFee">${orderDto.subTotal}</em>
								</span>
							</div>

							<div id="holyshit268" class="pay-address">

								<p class="buy-footer-address">
									<span class="buy-line-title buy-line-title-type">寄送至：</span> <span
										id='to' class="buy--address-detail"> <!-- <span class="province">湖北</span>省
									<span class="city">武汉</span>市 <span class="dist">洪山</span>区 <span
									class="street">雄楚大道666号(中南财经政法大学)</span> -->
									</span> </span>
								</p>
								<p class="buy-footer-address">
									<span class="buy-line-title">收货人：</span> <span
										class="buy-address-detail to-buy-address-detail"> <!-- <span class="buy-user">艾迪
								</span> <span class="buy-phone">15871145629</span> -->
									</span>
								</p>
							</div>
						</div>

						<div id="holyshit269" class="submitOrder">
							<div class="go-btn-wrap">
								<a id="J_Go" href="javascript:document.form1.submit();"
									class="btn-go" tabindex="0" title="点击此按钮，提交订单">立即付款</a>
							</div>
						</div>
					</form>
					<div class="clear"></div>
				</div>
			</div>
		</div>

		<div class="clear"></div>
	</div>
	<div class="footer">
		<jsp:include page="/jsps/include/footer.jsp" />
	</div>

	<div class="clear"></div>
</body>
</html>