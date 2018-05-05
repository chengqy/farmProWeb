<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	if (request.getAttribute("mainProInitDto") == null) {
%>
<jsp:forward page="/product/mainInit.action"></jsp:forward>
<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>首页</title>

<link href="<%=path%>/css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/admin.css" rel="stylesheet" type="text/css" />

<link href="<%=path%>/css/demo.css" rel="stylesheet" type="text/css" />

<link href="<%=path%>/css/hmstyle.css" rel="stylesheet" type="text/css" />
<script src="<%=path%>/js/jquery.min.js"></script>
<script src="<%=path%>/js/amazeui.min.js"></script>
</head>

<body>
	<div class="hmtop">
		<!--顶部导航条 -->
		<div class="am-container header">
			<jsp:include page="/jsps/include/header.jsp" />
		</div>

		<jsp:include page="/jsps/include/search.jsp" />

		<div class="clear"></div>
	</div>


	<div class="banner">
		<!--轮播 -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider
			id="demo-slider-0">
			<ul class="am-slides">
				<li class="banner1"><a href="#"><img
						src="<%=path%>/images/ad5.jpg" /></a></li>
				<li class="banner2"><a><img src="<%=path%>/images/ad9.jpg" /></a></li>
				<li class="banner3"><a><img src="<%=path%>/images/ad3.jpg" /></a></li>
				<li class="banner4"><a><img src="<%=path%>/images/ad4.jpg" /></a></li>

			</ul>
		</div>
		<div class="clear"></div>
	</div>

	<div class="shopNav">
		<div class="slideall">

			<jsp:include page="/jsps/include/shopnav.jsp" />

			<!--侧边导航 -->
			<div id="nav" class="navfull">
				<div class="area clearfix">
					<div class="category-content" id="guide_2">

						<div class="category">
							<ul class="category-list" id="js_climit_li">

								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="<%=path%>/images/cookies.png"></i><a
												class="ml-22" href="<%=path %>/product/getPagingList.action?cateId=1">生鲜水果</a>
										</h3>
										<em>&gt;</em>
									</div> 
									 <b class="arrow"></b>
								</li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="<%=path %>/images/meat.png"></i><a class="ml-22"
												href="<%=path %>/product/getPagingList.action?cateId=2">畜牧畜禽</a>
										</h3>
										<em>&gt;</em>
									</div>
									<b class="arrow"></b>
								</li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="<%=path %>/images/bamboo.png"></i><a class="ml-22"
												href="<%=path %>/product/getPagingList.action?cateId=3">新鲜蔬菜</a>
										</h3>
										<em>&gt;</em>
									</div>
									
									<b class="arrow"></b>
								</li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="<%=path %>/images/nut.png"></i><a class="ml-22"
												href="<%=path %>/product/getPagingList.action?cateId=4">农副产品</a>
										</h3>
										<em>&gt;</em>
									</div>
									<b class="arrow"></b>
								</li>


								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="<%=path %>/images/fish.png"></i><a class="ml-22"
												href="<%=path %>/product/getPagingList.action?cateId=5">海味河鲜</a>
										</h3>
										<em>&gt;</em>
									</div>
									<b class="arrow"></b>
								</li>
								<li class="appliance js_toggle relative last">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="<%=path %>/images/package.png"></i><a
												class="ml-22" href="<%=path %>/product/getPagingList.action?cateId=6">特产专区</a>
										</h3>
										<em>&gt;</em>
									</div>

								</li>
							</ul>
						</div>
					</div>

				</div>
			</div>
			<!--轮播 -->
			<script type="text/javascript">
				(function() {
					$('.am-slider').flexslider();
				});
				$(document)
						.ready(
								function() {
									$("li")
											.hover(
													function() {
														$(
																".category-content .category-list li.first .menu-in")
																.css("display",
																		"none");
														$(
																".category-content .category-list li.first")
																.removeClass(
																		"hover");
														$(this).addClass(
																"hover");
														$(this)
																.children(
																		"div.menu-in")
																.css("display",
																		"block")
													},
													function() {
														$(this).removeClass(
																"hover")
														$(this).children(
																"div.menu-in")
																.css("display",
																		"none")
													});
								})
			</script>

			<div class="clear"></div>
		</div>
		<script type="text/javascript">
			if ($(window).width() < 640) {
				function autoScroll(obj) {
					$(obj).find("ul").animate({
						marginTop : "-39px"
					}, 500, function() {
						$(this).css({
							marginTop : "0px"
						}).find("li:first").appendTo(this);
					})
				}
				$(function() {
					setInterval('autoScroll(".demo")', 3000);
				})
			}
		</script>
	</div>
	<div class="shopMainbg">
		<div class="shopMain" id="shopmain">

			<!--今日推荐 -->

			<div class="am-g am-g-fixed recommendation">
				<div class="clock am-u-sm-3"">
					<img src="<%=path %>/images/20188.jpg "></img>
					<p>
						今日<br>推荐
					</p>
				</div>
				<div class="am-u-sm-4 am-u-lg-3 ">
					<div class="info ">
						<h3>真的有鱼</h3>
						<h4>开年福利篇</h4>
					</div>
					<div class="recommendationMain ">
						<img src="<%=path %>/images/timg6.jpg "></img>
					</div>
				</div>
				<div class="am-u-sm-4 am-u-lg-3 ">
					<div class="info ">
						<h3>囤货过冬</h3>
						<h4>让爱早回家</h4>
					</div>
					<div class="recommendationMain ">
						<img src="<%=path %>/images/timg2.jpg "></img>
					</div>
				</div>
				<div class="am-u-sm-4 am-u-lg-3 ">
					<div class="info ">
						<h3>浪漫情人节</h3>
						<h4>甜甜蜜蜜</h4>
					</div>
					<div class="recommendationMain ">
						<img src="<%=path %>/images/timg4.jpg "></img>
					</div>
				</div>

			</div>
			<div class="clear "></div>
			<!--热门活动 -->

			<div class="am-container activity ">
				<div class="shopTitle ">
					<h4>新鲜好货</h4>
					<h3>每日好货买不停</h3>
					<span class="more "> <a class="more-link " href="<%=path %>/product/getPagingList.action ">全部商品</a>
					</span>
				</div>

				<div class="am-g am-g-fixed ">
					<div class="am-u-sm-3 ">
						<div class="icon-sale one "></div>
						<h4>特产</h4>
						<div class="activityMain ">
							<a href="<%=path %>/product/getPagingList.action?cateId=6 ">
							<img style="height: 300px" src="<%=path %>/${mainProInitDto.special.proImage } " ></img>
							</a>
						</div>
						<div class="info ">
							<h3>送礼优选</h3>
						</div>
					</div>

					<div class="am-u-sm-3 ">
						<div class="icon-sale two "></div>
						<h4>水果</h4>
						<div class="activityMain ">
							<a href="<%=path %>/product/getPagingList.action?cateId=1 ">
							<img  style="height: 300px" src="<%=path %>/${mainProInitDto.fruit.proImage } "></img>
							</a>
						</div>
						<div class="info ">
							<h3>好货不停</h3>
						</div>
					</div>

					<div class="am-u-sm-3 ">
						<div class="icon-sale three "></div>
						<h4>蔬菜 </h4>
						<div class="activityMain ">
							<a href="<%=path %>/product/getPagingList.action?cateId=3 ">
								<img style="height: 300px" src="<%=path %>/${mainProInitDto.vegetable.proImage } "></img>
							</a>
						</div>
						<div class="info ">
							<h3>好货不停</h3>
						</div>
					</div>

					<div class="am-u-sm-3 last ">
						<div class="icon-sale "></div>
						<h4>水产</h4>
						<div class="activityMain ">
							<a href="<%=path %>/product/getPagingList.action?cateId=5 ">
								<img style="height: 300px" src="<%=path %>/${mainProInitDto.sea.proImage } "></img>
							</a>
						</div>
						<div class="info ">
							<h3>好货不停</h3>
						</div>
					</div>

				</div>
			</div>
			<div class="clear "></div>

			<!--特产-->

			<div class="am-container ">
				<div class="shopTitle ">
					<h4>特产</h4>
					<h3>每一种特产都有一个故事</h3>
					
					<span class="more "> <a class="more-link " href="<%=path %>/product/getPagingList.action?cateId=6 ">更多美味</a>
					</span>
				</div>
			</div>

			
			<div class="am-g am-g-fixed flood method3 ">
				<ul class="am-thumbnails ">
				<c:forEach var="pro" items="${mainProInitDto.specialList }">
					<li>
						<div class="list ">
							<a href="<%=path%>/product/getProById.action?id=${pro.proId}"> <img style="height: 200px" src="<%=path %>/${pro.proImage}" />
								<div class="pro-title ">${pro.proName}</div> <span class="e-price ">￥${pro.price}</span>
							</a>
						</div>
					</li>
				
				</c:forEach>

				</ul>

			</div>
			<div class="clear "></div>
			<!--坚果-->
			<div class="am-container ">
				<div class="shopTitle ">
					<h4>水果</h4>
					<h3>酸甜可口，美容养颜</h3>
					
					<span class="more "> <a class="more-link " href="<%=path %>/product/getPagingList.action?cateId=1">更多美味</a>
					</span>
				</div>
			</div>
			<div class="am-g am-g-fixed flood method3 ">
				<ul class="am-thumbnails ">
				<c:forEach var="pro" items="${mainProInitDto.fruitList }">
					<li>
						<div class="list ">
							<a href="<%=path%>/product/getProById.action?id=${pro.proId}"> <img style="height: 200px" src="<%=path %>/${pro.proImage}" />
								<div class="pro-title ">${pro.proName}</div> <span class="e-price ">￥${pro.price}</span>
							</a>
						</div>
					</li>
				
				</c:forEach>

				</ul>

			</div>

			<div class="clear "></div>
			<div class="am-container ">
				<div class="shopTitle ">
					<h4>海味</h4>
					<h3>你是我的优乐美么？不，我是你小鱼干</h3>
					<span class="more "> <a class="more-link " href="<%=path %>/product/getPagingList.action?cateId=5">更多美味</a>
					</span>
				</div>
			</div>
			<div class="am-g am-g-fixed flood method3 ">
				<ul class="am-thumbnails ">
				<c:forEach var="pro" items="${mainProInitDto.seaList }">
					<li>
						<div class="list ">
							<a href="<%=path%>/product/getProById.action?id=${pro.proId}"> <img style="height: 200px" src="<%=path %>/${pro.proImage}" />
								<div class="pro-title ">${pro.proName}</div> <span class="e-price ">￥${pro.price}</span>
							</a>
						</div>
					</li>
				
				</c:forEach>

				</ul>

			</div>

			<!--底部-->
			<div class="footer">
				<jsp:include page="/jsps/include/footer.jsp" />
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
		window.jQuery
				|| document
						.write('<script src="<%=path %>/js/jquery.min.js "><\/script>');
	</script>
	<script type="text/javascript " src="<%=path %>/js/quick_links.js "></script>
</body>

</html>