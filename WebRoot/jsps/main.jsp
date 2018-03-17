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
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<c:choose>
							<c:when test="${empty sessionScope.loginSession }">
								<a href="/farmProShop/jsps/login.jsp" target="_top" class="h">亲，请登录</a>
								<a href="/farmProShop/jsps/register.jsp" target="_top">免费注册</a>
							</c:when>
							<c:otherwise>
								欢迎您！${sessionScope.loginSession.username }
							</c:otherwise>
						</c:choose>

					</div>
				</div>
			</ul>
			<ul class="message-r">
				<div class="topMessage home">
					<div class="menu-hd">
						<a href="/farmProShop/jsps/main.jsp" target="_top" class="h">商城首页</a>
					</div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng">
						<a href="/farmProShop/jsps/person/index.jsp" target="_top"><i
							class="am-icon-user am-icon-fw"></i>个人中心</a>
					</div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd">
						<a id="mc-menu-hd" href="/farmProShop/jsps/shopcart.jsp"
							target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
							id="J_MiniCartNum" class="h">0</strong></a>
					</div>
				</div>
				<div class="topMessage favorite">
					<div class="menu-hd">
						<a href="/farmProShop/jsps/person/collection.jsp" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
					</div>
			</ul>
		</div>

		<!--悬浮搜索框-->

		<div class="nav white">

			<div class="logoBig">
				<li><img src="<%=path%>/images/logobig.PNG" /></li>
			</div>

			<div class="search-bar pr">
				<a name="index_none_header_sysc" href="#"></a>
				<form>
					<input id="searchInput" name="index_none_header_sysc" type="text"
						placeholder="搜索" autocomplete="off"> <input
						id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
						type="submit">
				</form>
			</div>
		</div>

		<div class="clear"></div>
	</div>


	<div class="banner">
		<!--轮播 -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider
			id="demo-slider-0">
			<ul class="am-slides">
				<li class="banner1"><a href="introduction.html"><img
						src="<%=path%>/images/ad1.jpg" /></a></li>
				<li class="banner2"><a><img src="<%=path%>/images/ad2.jpg" /></a></li>
				<li class="banner3"><a><img src="<%=path%>/images/ad3.jpg" /></a></li>
				<li class="banner4"><a><img src="<%=path%>/images/ad4.jpg" /></a></li>

			</ul>
		</div>
		<div class="clear"></div>
	</div>

	<div class="shopNav">
		<div class="slideall">

			<div class="long-title">
				<span class="all-goods">全部分类</span>
			</div>
			<div class="nav-cont">
				<ul>
					<li class="index"><a href="#">首页</a></li>
					<li class="qc"><a href="#">地区频道</a></li>
					<li class="qc last"><a href="#">每日热货</a></li>
				</ul>
				<div class="nav-extra">
					<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
					<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
				</div>
			</div>

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
									</div> <!-- <div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="饼干">饼干</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="薯片">薯片</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span></a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="蛋糕">虾条</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span></a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>
													</div>

												</div>
											</div>
										</div>
									</div> --> <b class="arrow"></b>
								</li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="<%=path %>/images/meat.png"></i><a class="ml-22"
												href="<%=path %>/product/getPagingList.action?cateId=2">畜牧畜禽</a>
										</h3>
										<em>&gt;</em>
									</div>
									<!-- <div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">

															<dd>
																<a title="蒸蛋糕" href="#"><span>鸡</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>鸭</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>鹅</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>牛</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>猪</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>羊</span></a>
															</dd>
														</dl>

													</div>

												</div>
											</div>
										</div>
									</div>  --><b class="arrow"></b>
								</li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="<%=path %>/images/bamboo.png"></i><a class="ml-22"
												href="<%=path %>/product/getPagingList.action?cateId=3">新鲜蔬菜</a>
										</h3>
										<em>&gt;</em>
									</div>
									<!-- <div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="豆干">豆干</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>

													</div>

												</div>
											</div>
										</div>
									</div>  --><b class="arrow"></b>
								</li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="<%=path %>/images/nut.png"></i><a class="ml-22"
												href="<%=path %>/product/getPagingList.action?cateId=4">农副产品</a>
										</h3>
										<em>&gt;</em>
									</div>
									<!-- <div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="蛋糕">坚果</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span></a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>

													</div>

												</div>
											</div>
										</div>
									</div> --> <b class="arrow"></b>
								</li>


								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="<%=path %>/images/fish.png"></i><a class="ml-22"
												href="<%=path %>/product/getPagingList.action?cateId=5">海味河鲜</a>
										</h3>
										<em>&gt;</em>
									</div>
									<!-- <div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="水产">水产</span>
															</dt>
															<dd>
																<a title="鱼" href="#"><span>鱼</span></a>
															</dd>
															<dd>
																<a title="虾" href="#"><span>虾</span></a>
															</dd>
															<dd>
																<a title="蟹" href="#"><span>蟹</span></a>
															</dd>

														</dl>

														<dl class="dl-sort">
															<dt>
																<span title="鱿鱼丝">海味</span>
															</dt>


														</dl>
													</div>

												</div>
											</div>
										</div>
									</div> --> <b class="arrow"></b>
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


			<!--小导航
			<div class="am-g am-g-fixed smallnav">
				<div class="am-u-sm-3">
					<a href="sort.html"><img src="../images/navsmall.jpg" />
						<div class="title">商品分类</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img src="../images/huismall.jpg" />
						<div class="title">大聚惠</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img src="../images/mansmall.jpg" />
						<div class="title">个人中心</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img src="../images/moneysmall.jpg" />
						<div class="title">投资理财</div> </a>
				</div>
			</div> -->

			<!--走马灯 -->

			<div class="marqueen">
				<span class="marqueen-title">商城头条</span>
				<div class="demo">

					<ul>
						<li class="title-first"><a target="_blank" href="#"> <img
								src="../images/TJ2.jpg"></img> <span>[特惠]</span>商城爆品1分秒
						</a></li>
						<li class="title-first"><a target="_blank" href="#"> <span>[公告]</span>商城与广州市签署战略合作协议
								<img src="../images/TJ.jpg"></img>
								<p>XXXXXXXXXXXXXXXXXX</p>
						</a></li>

						<div class="mod-vip">
							<c:choose>
								<c:when test="${empty sessionScope.loginSession }">
									<div class="m-baseinfo">
										<a href="<%=path%>/jsps/person/index.jsp"> <img
											src="<%=path%>/images/getAvatar.do.jpg"></a> <em> Hi,<span
											class="s-name">请登录</span> <a href="#"></a>
										</em>
									</div>
									<div class="member-logout">
										<a class="am-btn-warning btn" href="<%=path%>/jsps/login.jsp">登录</a>
										<a class="am-btn-warning btn"
											href="<%=path%>/jsps/register.jsp">注册</a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="m-baseinfo">
										<a href="<%=path%>/jsps/person/index.jsp"> <img
											src="<%=path %>/${loginSession.headImg}"></a> <em> Hi,<span
											class="s-name">${loginSession.username}</span> <a href="#"></a>
										</em>
									</div>

									<div class="member-logout">
										<a href="#">0待收货</a> <a href="#"><strong>0</strong>待发货</a> <a
											href="#"><strong>0</strong>待付款</a>
									</div>
								</c:otherwise>
							</c:choose>
							<div class="clear"></div>
						</div>

						<li><a target="_blank" href="#"><span>[特惠]</span>洋河年末大促，低至两件五折</a></li>
						<li><a target="_blank" href="#"><span>[公告]</span>华北、华中部分地区配送延迟</a></li>
						<li><a target="_blank" href="#"><span>[特惠]</span>家电狂欢千亿礼券
								买1送1！</a></li>

					</ul>
					<div class="advTip">
						<img src="<%=path %>/images/advTip.jpg" />
					</div>
				</div>
			</div>
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
					<img src="<%=path %>/images/2016.png "></img>
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
						<img src="<%=path %>/images/tj.png "></img>
					</div>
				</div>
				<div class="am-u-sm-4 am-u-lg-3 ">
					<div class="info ">
						<h3>囤货过冬</h3>
						<h4>让爱早回家</h4>
					</div>
					<div class="recommendationMain ">
						<img src="<%=path %>/images/tj1.png "></img>
					</div>
				</div>
				<div class="am-u-sm-4 am-u-lg-3 ">
					<div class="info ">
						<h3>浪漫情人节</h3>
						<h4>甜甜蜜蜜</h4>
					</div>
					<div class="recommendationMain ">
						<img src="<%=path %>/images/tj2.png "></img>
					</div>
				</div>

			</div>
			<div class="clear "></div>
			<!--热门活动 -->

			<div class="am-container activity ">
				<div class="shopTitle ">
					<h4>新鲜好货</h4>
					<h3>每日好货买不停</h3>
					<span class="more "> <a class="more-link " href="# ">全部商品</a>
					</span>
				</div>

				<div class="am-g am-g-fixed ">
					<div class="am-u-sm-3 ">
						<div class="icon-sale one "></div>
						<h4>特产</h4>
						<div class="activityMain ">
							<img style="height: 300px" src="<%=path %>/${mainProInitDto.special.proImage } "></img>
						</div>
						<div class="info ">
							<h3>送礼优选</h3>
						</div>
					</div>

					<div class="am-u-sm-3 ">
						<div class="icon-sale two "></div>
						<h4>水果</h4>
						<div class="activityMain ">
							<img  style="height: 300px" src="<%=path %>/${mainProInitDto.fruit.proImage } "></img>
						</div>
						<div class="info ">
							<h3>好货不停</h3>
						</div>
					</div>

					<div class="am-u-sm-3 ">
						<div class="icon-sale three "></div>
						<h4>蔬菜 </h4>
						<div class="activityMain ">
							<img style="height: 300px" src="<%=path %>/${mainProInitDto.vegetable.proImage } "></img>
						</div>
						<div class="info ">
							<h3>好货不停</h3>
						</div>
					</div>

					<div class="am-u-sm-3 last ">
						<div class="icon-sale "></div>
						<h4>水产</h4>
						<div class="activityMain ">
							<img style="height: 300px" src="<%=path %>/${mainProInitDto.sea.proImage } "></img>
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
					<!-- <div class="today-brands ">
						<a href="# ">桂花糕</a> <a href="# ">奶皮酥</a> <a href="# ">栗子糕 </a> <a
							href="# ">马卡龙</a> <a href="# ">铜锣烧</a> <a href="# ">豌豆黄</a>
					</div> -->
					<span class="more "> <a class="more-link " href="# ">更多美味</a>
					</span>
				</div>
			</div>

			<%-- <div class="am-g am-g-fixed floodOne ">
				<div class="am-u-sm-5 am-u-md-3 am-u-lg-4 text-one ">
					<a href="# ">
						<div class="outer-con ">
							<div class="title ">零食大礼包开抢啦</div>
							<div class="sub-title ">当小鱼儿恋上软豆腐</div>
						</div> <img src="<%=path %>/images/act1.png " />
					</a>
				</div>
				<div class="am-u-sm-7 am-u-md-5 am-u-lg-4">
					<div class="text-two">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">仅售：¥13.8</div>

						</div>
						<a href="# "><img src="../images/act2.png " /></a>
					</div>
					<div class="text-two last">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">仅售：¥13.8</div>

						</div>
						<a href="# "><img src="../images/act2.png " /></a>
					</div>
				</div>
				<div class="am-u-sm-12 am-u-md-4 ">
					<div class="am-u-sm-3 am-u-md-6 text-three">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>

							<div class="sub-title ">尝鲜价：¥4.8</div>
						</div>
						<a href="# "><img src="../images/act3.png " /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-6 text-three">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>

							<div class="sub-title ">尝鲜价：¥4.8</div>
						</div>
						<a href="# "><img src="../images/act3.png " /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-6 text-three">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>

							<div class="sub-title ">尝鲜价：¥4.8</div>
						</div>
						<a href="# "><img src="../images/act3.png " /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-6 text-three last ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>

							<div class="sub-title ">尝鲜价：¥4.8</div>
						</div>
						<a href="# "><img src="../images/act3.png " /></a>
					</div>
				</div>

			</div> --%>
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
					<!-- <div class="today-brands ">
						<a href="# ">腰果</a> <a href="# ">松子</a> <a href="# ">夏威夷果 </a> <a
							href="# ">碧根果</a> <a href="# ">开心果</a> <a href="# ">核桃仁</a>
					</div> -->
					<span class="more "> <a class="more-link " href="# ">更多美味</a>
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
			<!-- <div class="am-g am-g-fixed floodTwo ">
	

				<div class="am-u-sm-5 am-u-md-4 text-one ">
					<a href="# "> <img src="../images/act1.png " />
						<div class="outer-con ">
							<div class="title ">零食大礼包开抢啦</div>
							<div class="sub-title ">当小鱼儿恋上软豆腐</div>

						</div>
					</a>
				</div>
				<div class="am-u-sm-7 am-u-md-4 am-u-lg-2 text-two">
					<div class="outer-con ">
						<div class="title ">雪之恋和风大福</div>

						<div class="sub-title ">仅售：¥13.8</div>
					</div>
					<a href="# "><img src="../images/5.jpg " /></a>
				</div>

				<div class="am-u-md-4 am-u-lg-2 text-three">
					<div class="outer-con ">
						<div class="title ">小优布丁</div>

						<div class="sub-title ">尝鲜价：¥4.8</div>
					</div>
					<a href="# "><img src="../images/act3.png " /></a>
				</div>
				<div class="am-u-md-4 am-u-lg-2 text-three">
					<div class="outer-con ">
						<div class="title ">小优布丁</div>

						<div class="sub-title ">尝鲜价：¥4.8</div>
					</div>
					<a href="# "><img src="../images/act3.png " /></a>
				</div>
				<div class="am-u-sm-6 am-u-md-4 am-u-lg-2 text-two ">
					<div class="outer-con ">
						<div class="title ">雪之恋和风大福</div>

						<div class="sub-title ">仅售：¥13.8</div>
					</div>
					<a href="# "><img src="../images/5.jpg " /></a>
				</div>
				<div class="am-u-sm-6 am-u-md-3 am-u-lg-2 text-four ">
					<div class="outer-con ">
						<div class="title ">雪之恋和风大福</div>

						<div class="sub-title ">仅售：¥13.8</div>
					</div>
					<a href="# "><img src="../images/5.jpg " /></a>
				</div>
				<div class="am-u-sm-4 am-u-md-3 am-u-lg-4 text-five">
					<div class="outer-con ">
						<div class="title ">小优布丁</div>
						<div class="sub-title ">尝鲜价：¥4.8</div>

					</div>
					<a href="# "><img src="../images/act2.png " /></a>
				</div>
				<div class="am-u-sm-4 am-u-md-3 am-u-lg-2 text-six">
					<div class="outer-con ">
						<div class="title ">小优布丁</div>

						<div class="sub-title ">尝鲜价：¥4.8</div>
					</div>
					<a href="# "><img src="../images/act3.png " /></a>
				</div>
				<div class="am-u-sm-4 am-u-md-3 am-u-lg-4 text-five">
					<div class="outer-con ">
						<div class="title ">小优布丁</div>
						<div class="sub-title ">尝鲜价：¥4.8</div>

					</div>
					<a href="# "><img src="../images/act2.png " /></a>
				</div>
			</div> -->

			<div class="clear "></div>



			<div class="am-container ">
				<div class="shopTitle ">
					<h4>海味</h4>
					<h3>你是我的优乐美么？不，我是你小鱼干</h3>
					<!-- <div class="today-brands ">
						<a href="# ">小鱼干</a> <a href="# ">海苔</a> <a href="# ">鱿鱼丝</a> <a
							href="# ">海带丝</a>
					</div> -->
					<span class="more "> <a class="more-link " href="# ">更多美味</a>
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
			<!-- <div class="am-g am-g-fixed flood method3 ">
				<ul class="am-thumbnails ">
					<li>
						<div class="list ">
							<a href="# "> <img src="../images/cp.jpg " />
								<div class="pro-title ">萨拉米 1+1小鸡腿</div> <span class="e-price ">￥29.90</span>
							</a>
						</div>
					</li>
					<li>
						<div class="list ">
							<a href="# "> <img src="../images/cp2.jpg " />
								<div class="pro-title ">ZEK 原味海苔</div> <span class="e-price ">￥8.90</span>
							</a>
						</div>
					</li>
					<li>
						<div class="list ">
							<a href="# "> <img src="../images/cp.jpg " />
								<div class="pro-title ">萨拉米 1+1小鸡腿</div> <span class="e-price ">￥29.90</span>
							</a>
						</div>
					</li>
					<li>
						<div class="list ">
							<a href="# "> <img src="../images/cp2.jpg " />
								<div class="pro-title ">ZEK 原味海苔</div> <span class="e-price ">￥8.90</span>
							</a>
						</div>
					</li>
					<li>
						<div class="list ">
							<a href="# "> <img src="../images/cp.jpg " />
								<div class="pro-title ">萨拉米 1+1小鸡腿</div> <span class="e-price ">￥29.90</span>
							</a>
						</div>
					</li>
					<li>
						<div class="list ">
							<a href="# "> <img src="../images/cp2.jpg " />
								<div class="pro-title ">ZEK 原味海苔</div> <span class="e-price ">￥8.90</span>
							</a>
						</div>
					</li>
					<li>
						<div class="list ">
							<a href="# "> <img src="../images/cp.jpg " />
								<div class="pro-title ">萨拉米 1+1小鸡腿</div> <span class="e-price ">￥29.90</span>
							</a>
						</div>
					</li>
					<li>
						<div class="list ">
							<a href="# "> <img src="../images/cp2.jpg " />
								<div class="pro-title ">ZEK 原味海苔</div> <span class="e-price ">￥8.90</span>
							</a>
						</div>
					</li>
					<li>
						<div class="list ">
							<a href="# "> <img src="../images/cp.jpg " />
								<div class="pro-title ">萨拉米 1+1小鸡腿</div> <span class="e-price ">￥29.90</span>
							</a>
						</div>
					</li>
					<li>
						<div class="list ">
							<a href="# "> <img src="../images/cp2.jpg " />
								<div class="pro-title ">ZEK 原味海苔</div> <span class="e-price ">￥8.90</span>
							</a>
						</div>
					</li>

				</ul>

			</div> -->

			<div class="footer ">
				<div class="footer-hd ">
					<p>
						<a href="# ">恒望科技</a> <b>|</b> <a href="# ">商城首页</a> <b>|</b> <a
							href="# ">支付宝</a> <b>|</b> <a href="# ">物流</a>
					</p>
				</div>
				
			</div>
		</div>
	</div>
	
	<!--引导 -->

	<div class="navCir">
		<li class="active"><a href="home3.html"><i
				class="am-icon-home "></i>首页</a></li>
		<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
		<li><a href="shopcart.html"><i
				class="am-icon-shopping-basket"></i>购物车</a></li>
		<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>
	</div>
	<!--菜单 -->
	<div class=tip>
		<div id="sidebar">
			<div id="wrap">
				<div id="prof" class="item ">
					<a href="# "> <span class="setting "></span>
					</a>
					<div class="ibar_login_box status_login ">
						<div class="avatar_box ">
							<p class="avatar_imgbox ">
								<img src="../images/no-img_mid_.jpg " />
							</p>
							<ul class="user_info ">
								<li>用户名：sl1903</li>
								<li>级&nbsp;别：普通会员</li>
							</ul>
						</div>
						<div class="login_btnbox ">
							<a href="# " class="login_order ">我的订单</a> <a href="# "
								class="login_favorite ">我的收藏</a>
						</div>
						<i class="icon_arrow_white "></i>
					</div>

				</div>
				<div id="shopCart " class="item ">
					<a href="# "> <span class="message "></span>
					</a>
					<p>购物车</p>
					<p class="cart_num ">0</p>
				</div>
				<div id="asset " class="item ">
					<a href="# "> <span class="view "></span>
					</a>
					<div class="mp_tooltip ">
						我的资产 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="foot " class="item ">
					<a href="# "> <span class="zuji "></span>
					</a>
					<div class="mp_tooltip ">
						我的足迹 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="brand " class="item ">
					<a href="#"> <span class="wdsc "><img
							src="../images/wdsc.png " /></span>
					</a>
					<div class="mp_tooltip ">
						我的收藏 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="broadcast " class="item ">
					<a href="# "> <span class="chongzhi "><img
							src="../images/chongzhi.png " /></span>
					</a>
					<div class="mp_tooltip ">
						我要充值 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div class="quick_toggle ">
					<li class="qtitem "><a href="# "><span class="kfzx "></span></a>
						<div class="mp_tooltip ">
							客服中心<i class="icon_arrow_right_black "></i>
						</div></li>
					<!--二维码 -->
					<li class="qtitem "><a href="#none "><span
							class="mpbtn_qrcode "></span></a>
						<div class="mp_qrcode " style="display:none; ">
							<img src="../images/weixin_code_145.png " /><i
								class="icon_arrow_white "></i>
						</div></li>
					<li class="qtitem "><a href="#top " class="return_top "><span
							class="top "></span></a></li>
				</div>

				<!--回到顶部 -->
				<div id="quick_links_pop " class="quick_links_pop hide "></div>

			</div>

		</div>
		<div id="prof-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>我</div>
		</div>
		<div id="shopCart-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>购物车</div>
		</div>
		<div id="asset-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>资产</div>

			<div class="ia-head-list ">
				<a href="# " target="_blank " class="pl ">
					<div class="num ">0</div>
					<div class="text ">优惠券</div>
				</a> <a href="# " target="_blank " class="pl ">
					<div class="num ">0</div>
					<div class="text ">红包</div>
				</a> <a href="# " target="_blank " class="pl money ">
					<div class="num ">￥0</div>
					<div class="text ">余额</div>
				</a>
			</div>

		</div>
		<div id="foot-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>足迹</div>
		</div>
		<div id="brand-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>收藏</div>
		</div>
		<div id="broadcast-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>充值</div>
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