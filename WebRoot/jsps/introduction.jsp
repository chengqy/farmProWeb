<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>商品页面</title>

<link href="<%=path%>/css/admin.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/demo.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="<%=path%>/css/optstyle.css" rel="stylesheet" />
<link type="text/css" href="<%=path%>/css/style.css" rel="stylesheet" />

<script type="text/javascript" src="<%=path%>/js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/quick_links.js"></script>

<script type="text/javascript" src="<%=path%>/js/amazeui.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/jquery.imagezoom.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.flexslider.js"></script>
<script type="text/javascript" src="<%=path%>/js/list.js"></script>
<script type="text/javascript">
function putInShopCart() {
	var amount = document.getElementById('text_box').value;
	/* var context = document.getElementById('PageContext').value; */
	window.location.href = "<%=path%>"+ "/cartItem/addCartItem.action?proId=${proInitDto.product.proId}&amount="+amount;
}

function buy() {
	var amount = document.getElementById('text_box').value;
	window.location.href = "<%=path%>"+ "/order/buyAtOnce.action?proId=${proInitDto.product.proId}&amount="+amount;
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
	<b class="line"></b>
	<div class="listMain">

		<!--分类-->
		<div class="nav-table">
			<jsp:include page="/jsps/include/shopnav.jsp" />
		</div>
		<ol class="am-breadcrumb am-breadcrumb-slash">
			<li>首页</li>
			<li>分类</li>
			<li class="am-active">内容</li>
		</ol>
		<script type="text/javascript">
			$(function() {
			});
			$(window).load(function() {
				$('.flexslider').flexslider({
					animation : "slide",
					start : function(slider) {
						$('body').removeClass('loading');
					}
				});
			});
		</script>
		<div class="scoll">
			<section class="slider">
				<div class="flexslider">
					<ul class="slides">
						<li><img src="<%=path%>/images/01.jpg" title="pic" /></li>
						<li><img src="<%=path%>/images/02.jpg" /></li>
						<li><img src="<%=path%>/images/03.jpg" /></li>
					</ul>
				</div>
			</section>
		</div>

		<!--放大镜-->

		<div class="item-inform">
			<div class="clearfixLeft" id="clearcontent">

				<div class="box">
					<script type="text/javascript">
						$(document).ready(
								function() {
									$(".jqzoom").imagezoom();
									$("#thumblist li a").click(
											function() {
												$(this).parents("li").addClass(
														"tb-selected")
														.siblings()
														.removeClass(
																"tb-selected");
												$(".jqzoom").attr(
														'src',
														$(this).find("img")
																.attr("mid"));
												$(".jqzoom").attr(
														'rel',
														$(this).find("img")
																.attr("big"));
											});
								});
					</script>

					<div class="tb-booth tb-pic tb-s310">
						<a href="<%=path%>/${proInitDto.product.proImage }"><img
							src="<%=path%>/${proInitDto.product.proImage }" alt="细节展示放大镜特效"
							rel="<%=path%>/${proInitDto.product.proImage }" class="jqzoom" /></a>
					</div>
					<ul class="tb-thumb" id="thumblist">

						<c:forEach var="pic" items="${proInitDto.product.proImage }">
							<li>
								<div class="tb-pic tb-s40">
									<a href="#"><img src="<%=path%>/${pic }"
										mid="<%=path%>/${pic }" big="<%=path%>/${pic }"></a>
								</div>
							</li>

						</c:forEach>
					</ul>
				</div>

				<div class="clear"></div>
			</div>

			<div class="clearfixRight">

				<!--规格属性-->
				<!--名称-->
				<div class="tb-detail-hd">
					<h1>${proInitDto.product.proName }</h1>
				</div>
				<div class="tb-detail-list">
					<!--价格-->
					<div class="tb-detail-price">
						<li class="price iteminfo_price">
							<dt>价格</dt>
							<dd>
								<em>¥</em><b class="sys_item_price">${proInitDto.product.price }</b>
							</dd>
						</li>
						<div class="clear"></div>
					</div>

					
					<div class="clear"></div>

					<!--销量-->
					<ul class="tm-ind-panel">
						<li class="tm-ind-item tm-ind-sellCount canClick">
							<div class="tm-indcon">
								<span class="tm-label">月销量</span><span class="tm-count">${proInitDto.product.sales }</span>
							</div>
						</li>
					</ul>
					<div class="clear"></div>

					<!--各种规格-->
					<dl class="iteminfo_parameter sys_item_specpara">
						<dt class="theme-login">
							<div class="cart-title">
								可选规格<span class="am-icon-angle-right"></span>
							</div>
						</dt>
						<dd>
							<!--操作页面-->

							<div class="theme-popover-mask"></div>

							<div class="theme-popover">
								<div class="theme-span"></div>
								<div class="theme-poptit">
									<a href="javascript:;" title="关闭" class="close">×</a>
								</div>
								<div class="theme-popbod dform">
									<form class="theme-signin" name="loginform" action=""
										method="post">

										<div class="theme-signin-left">

											<div class="theme-options">
												<div class="cart-title">规格</div>
												<ul>
													<li class="sku-line selected">${proInitDto.product.specification
														}<i></i>
													</li>

												</ul>
											</div>
											<div class="theme-options">
												<div class="cart-title number">数量</div>
												<dd>
													<input id="min" class="am-btn am-btn-default" name="" type="button" value="-" />
													<input id="text_box" name="amount" type="text" value="1" style="width:30px;" />
													<input id="add" class="am-btn am-btn-default" name="" type="button" value="+" />
													<span id="Stock" class="tb-hidden" >库存<span class="stock">${proInitDto.product.stock}
													
													</span>
												</dd>

											</div>
											<div class="clear"></div>

											<div class="btn-op">
												<div class="btn am-btn am-btn-warning">确认</div>
												<div class="btn close am-btn am-btn-warning">取消</div>
											</div>
										</div>

									</form>
								</div>
							</div>

						</dd>
					</dl>
					<div class="clear"></div>
					
				</div>
				<input id="PageContext" type="hidden"
								value="${pageContext.request.contextPath}" />
				<div class="pay">
					<!-- <div class="pay-opt"> -->
					<a href="/farmProShop/jsps/main.jsp"><span
						class="am-icon-home am-icon-fw">首页</span></a>
					<c:choose>
						<c:when
							test="${loginSession==null or proInitDto.product.isCollect eq 0  }">
							<a
								href="<%=path%>/myCollection/collect.action?id=${proInitDto.product.proId }"><span
								class="am-icon-heart am-icon-fw">收藏</span></a>
						</c:when>
						<c:otherwise>
							<span class="am-icon-heart am-icon-fw">已收藏</span>
						</c:otherwise>
					</c:choose>

					<li>
						<div class="clearfix tb-btn tb-btn-buy theme-login">
							<a id="LikBuy"  href="javascript:void(0);" onclick="buy()">立即购买</a>
						</div>
					</li>
					<li>
						<div class="clearfix tb-btn tb-btn-basket theme-login">
							<a id="LikBasket" href="javascript:void(0);"
							onclick="putInShopCart()" ><i></i>加入购物车</a>
						</div>
					</li>
				</div>

			</div>

			<div class="clear"></div>

		</div>

		<div class="clear"></div>


		<!-- introduce-->

		<div class="introduce">
			<div class="browse">
				<div class="mc">
					<ul>
						<div class="mt">
							<h2>看了又看</h2>
						</div>
						<c:forEach var="pro" items="${proInitDto.specialList }">
							<li >
							<div class="p-img">
								<a href="<%=path%>/product/getProById.action?id=${pro.proId}"> <img class="" src="<%=path %>/${pro.proImage}">
								</a>
							</div>
							<div class="p-name">
								<a href="<%=path%>/product/getProById.action?id=${pro.proId}"> ${pro.proName}</a>
							</div>
							<div class="p-price">
								<strong>￥${pro.price}</strong>
							</div>
						</li>
						</c:forEach>
						

					</ul>
				</div>
			</div>
			<div class="introduceMain">
				<div class="am-tabs" data-am-tabs>
					<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
						<li class="am-active"><a href="#"> <span
								class="index-needs-dt-txt" data-id="xiangqing">宝贝详情</span></a></li>


					</ul>

					<div class="am-tabs-bd">
						<!-- 宝贝详情对应内容 -->
						<div class="am-tab-panel am-fade am-in am-active" data-cid="xiangqing">
							<div class="J_Brand">

								<div class="attr-list-hd tm-clear">
									<h4>产品参数：</h4>
								</div>
								<div class="clear"></div>
								<ul id="J_AttrUL">
									<li title="">产品类型:&nbsp;${proInitDto.product.cateName }</li>
									<li title="">产地:&nbsp;${proInitDto.product.cityName }</li>
									<li title=""></li>
									<li title="">简介：</li>
								</ul>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;${proInitDto.product.introduction }</p>
								<div class="clear"></div>
							</div>

							<div class="details">
								<div class="attr-list-hd after-market-hd">
									<h4>商品细节</h4>
								</div>
								<div class="twlistNews">
									<c:forEach var="pic" items="${proInitDto.product.pictureList }">
										<img src="<%=path %>/${pic}" />

									</c:forEach>
								</div>
							</div>
							<div class="clear"></div>

						</div>
						
					</div>

				</div>

				<div class="clear"></div>

				<div class="footer">
					<jsp:include page="/jsps/include/footer.jsp" />
				</div>
			</div>

		</div>
	</div>
	<!--菜单 -->
	<div class=tip>
		<div id="sidebar">
			<jsp:include page="/jsps/include/sidebar.jsp" />
		</div>
	</div>

<script>

</script>
</body>

</html>