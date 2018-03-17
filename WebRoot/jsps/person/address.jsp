<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	if (request.getAttribute("addressQueryAll") == null) {
%>
<jsp:forward page="/address/queryAll.action"></jsp:forward>
<%
	}
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>地址管理</title>

<link href="<%=path%>/css/admin.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/amazeui.css" rel="stylesheet" type="text/css">

<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/addstyle.css" rel="stylesheet" type="text/css">
<script src="<%=path%>/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=path%>/js/amazeui.js"></script>
<script type="text/javascript">
	// 1. province change
	
	/* (function($) { 
		
		})(jQuery); 
		jQuery( document ).ready(function( $){
		
		$("#province").change(function() {
			//通过 省份 id ，获取省份下面的城市
			//1. 清空 原有的 城市和区县内容
			alert("111111");
			$("#city").empty();
			$.get("${pageContext.request.contextPath}/city/getListByPid.action", {
				pid:$("#province").val(); // 获取选中的值
			}, function(data) {
				$("#city").append("<option value=''>" + '--请选择--' + "</option>");
				$.each(data, function(k, v) {
					var _ele = "<option value='"+v.cityId+"'>" + v.cityName + "</option>";
					$("#city").append(_ele);
				});
			})
		});
	} */
	
	function sel() {
		$("#city").empty();
		$.get("${pageContext.request.contextPath}/city/getListByPid.action", {
			pid : $("#province").val()
		}, function(data) {
			console.log(data);
			for ( var i = 0; i < data.length; i++) {
				$("#city").append(
						"<option value="+  
	                        data[i].cityId+">"
								+ data[i].cityName + "</option>");
			}
		})
	}
	
	
	function del() {
		var msg = "您真的确定要删除吗？\n\n请确认！";
		if (confirm(msg) == true) {
				var id = document.getElementById('id').value;
				var context = document.getElementById('PageContext').value;
				window.location.href = context+"/address/delete.action?id="
						+ id;
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
					<ul class="message-l">
						<div class="topMessage">
							<div class="menu-hd">
								<a href="#" target="_top" class="h">亲，请登录</a> <a href="#"
									target="_top">免费注册</a>
							</div>
						</div>
					</ul>
					<ul class="message-r">
						<div class="topMessage home">
							<div class="menu-hd">
								<a href="#" target="_top" class="h">商城首页</a>
							</div>
						</div>
						<div class="topMessage my-shangcheng">
							<div class="menu-hd MyShangcheng">
								<a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
							</div>
						</div>
						<div class="topMessage mini-cart">
							<div class="menu-hd">
								<a id="mc-menu-hd" href="#" target="_top"><i
									class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
									id="J_MiniCartNum" class="h">0</strong></a>
							</div>
						</div>
						<div class="topMessage favorite">
							<div class="menu-hd">
								<a href="#" target="_top"><i
									class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
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
			</div>
		</article>
	</header>

	<div class="nav-table">
		<div class="long-title">
			<span class="all-goods">全部分类</span>
		</div>
		<div class="nav-cont">
			<ul>
				<li class="index"><a href="#">首页</a></li>
				<li class="qc"><a href="#">闪购</a></li>
				<li class="qc"><a href="#">限时抢</a></li>
				<li class="qc"><a href="#">团购</a></li>
				<li class="qc last"><a href="#">大包装</a></li>
			</ul>
			<div class="nav-extra">
				<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利 <i
					class="am-icon-angle-right" style="padding-left: 10px;"></i>
			</div>
		</div>
	</div>
	<b class="line"></b>

	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-address">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small>
						</div>
					</div>
					<hr />
					<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
						<c:forEach var="address" items="${addressQueryAll.addressList }">
							<input type="hidden" name="id" id="id" value="${address.id}" />
							<c:choose>
								<c:when test="${address.status.intValue()==1 }">
									<li class="user-addresslist defaultAddr"><span
										class="new-option-r"><i class="am-icon-check-circle"></i>默认地址</span>
								</c:when>
								<c:otherwise>
									<li class="user-addresslist"><span class="new-option-r"><i
											class="am-icon-check-circle"></i><a
											href="${pageContext.request.contextPath}/address/changeStatusTrue.action?id=${address.id}">设为默认</a></span>
								</c:otherwise>

							</c:choose>

							<p class="new-tit new-p-re">
								<span class="new-txt">${address.receiver }</span> <span
									class="new-txt-rd2">${address.phone }</span>
							</p>
							<div class="new-mu_l2a new-p-re">
								<p class="new-mu_l2cw">
									<span class="title">地址：</span> <span class="province">${address.province
										}</span>省 <span class="city">${address.city }</span>市 <span
										class="street">${address.address }</span>
								</p>
							</div>
							<div class="new-addr-btn">
								<a
									href="${pageContext.request.contextPath}/address/getAddress.action?id=${address.id}"><i
									class="am-icon-edit"></i>编辑</a> <span class="new-addr-bar">|</span>
								<a href="javascript:void(0);" onclick="del();"><i
									class="am-icon-trash"></i>删除</a>
							</div>

							</li>
						</c:forEach>
					</ul>
					<div class="clear"></div>
					<a class="new-abtn-type"
						data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
					<!--例子-->
					<div class="am-modal am-modal-no-btn" id="doc-modal-1">

						<div class="add-dress">

							<!--标题 -->
							<div class="am-cf am-padding">
								<div class="am-fl am-cf">
									<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small>
								</div>
							</div>
							<hr />

							<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
								<form class="am-form am-form-horizontal"
									action="${pageContext.request.contextPath}/address/add.action"
									method="post">
									<div align="center" style="color: #ff0000;">${message }</div>
									<br>
									<div class="am-form-group">
										<label for="user-name" class="am-form-label">收货人</label>
										<div class="am-form-content">
											<input type="text" name="receiver" id="user-name"
												value="${addressParam.receiver}" placeholder="收货人">
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-phone" class="am-form-label">手机号码</label>
										<div class="am-form-content">
											<input id="user-phone" name="phone"
												value="${addressParam.phone}" placeholder="手机号必填"
												type="text">
										</div>
									</div>
									<div class="am-form-group">
										<label for="user-address" class="am-form-label">所在地</label>
										<div class="am-form-content address">
											<select id="province" name="province" onchange="sel()">
												<option value="">--请选择--</option>
												<c:forEach var="province"
													items="${addressQueryAll.provinceList }">
													<c:choose>
														<c:when test="${province.pid eq addressParam.province }">
															<option value="${province.pid }" selected="selected">${province.pname}</option>
														</c:when>
														<c:otherwise>
															<option value="${province.pid }">${province.pname}</option>
														</c:otherwise>
													</c:choose>
													
												</c:forEach>
											</select> 
											<select id="city" name="city">
												<option value="">--请选择--</option>
												<option value="1">广州</option>
												<option value="2">中山</option>
												<option value="3">深圳</option>
											</select>
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-intro" class="am-form-label">详细地址</label>
										<div class="am-form-content">
											<textarea class="" name="address" rows="3" id="user-intro"
												placeholder="输入详细地址">${addressParam.address }</textarea>
											<small>100字以内写出你的详细地址...</small>
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-intro" class="am-form-label">设为默认地址</label>
										<div class="am-form-content">
											&nbsp;&nbsp;&nbsp;<input type="radio" name="status" value="1">
											是&nbsp;&nbsp;&nbsp; <input type="radio" name="status"
												value="0"> 否
										</div>
									</div>
									<div class="am-form-group">
										<div class="am-u-sm-9 am-u-sm-push-3">
											<input class="am-btn am-btn-danger" type="submit" value="保存" />
											<a href="javascript: void(0)"
												class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
										</div>
									</div>
								</form>
							</div>

						</div>

					</div>

				</div>

				<script type="text/javascript">
					$(document).ready(
							function() {
								$(".new-option-r").click(
										function() {
											$(this).parent('.user-addresslist')
													.addClass("defaultAddr")
													.siblings().removeClass(
															"defaultAddr");
										});

								var $ww = $(window).width();
								if ($ww > 640) {
									$("#doc-modal-1").removeClass(
											"am-modal am-modal-no-btn")
								}

							})
				</script>

				<div class="clear"></div>
				<input id="PageContext" type="hidden"
					value="${pageContext.request.contextPath}" />
			</div>
			<!--底部-->
			<div class="footer">
				<div class="footer-hd">
					<p>
						<a href="#">恒望科技</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
							href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
					</p>
				</div>
				<div class="footer-bd">
					<p>
						<a href="#">关于恒望</a> <a href="#">合作伙伴</a> <a href="#">联系我们</a> <a
							href="#">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有</em>
					</p>
				</div>
			</div>
		</div>

		<aside class="menu">
			<ul>
				<li class="person active"><a href="index.html"><i
						class="am-icon-user"></i>个人中心</a></li>
				<li class="person">
					<p>
						<i class="am-icon-newspaper-o"></i>个人资料
					</p>
					<ul>
						<li><a href="information.html">个人信息</a></li>
						<li><a href="safety.html">安全设置</a></li>
						<li><a href="address.html">地址管理</a></li>
						<li><a href="cardlist.html">快捷支付</a></li>
					</ul>
				</li>
				<li class="person">
					<p>
						<i class="am-icon-balance-scale"></i>我的交易
					</p>
					<ul>
						<li><a href="order.html">订单管理</a></li>
						<li><a href="change.html">退款售后</a></li>
						<li><a href="comment.html">评价商品</a></li>
					</ul>
				</li>
				<li class="person">
					<p>
						<i class="am-icon-dollar"></i>我的资产
					</p>
					<ul>
						<li><a href="points.html">我的积分</a></li>
						<li><a href="coupon.html">优惠券 </a></li>
						<li><a href="bonus.html">红包</a></li>
						<li><a href="walletlist.html">账户余额</a></li>
						<li><a href="bill.html">账单明细</a></li>
					</ul>
				</li>

				<li class="person">
					<p>
						<i class="am-icon-tags"></i>我的收藏
					</p>
					<ul>
						<li><a href="collection.html">收藏</a></li>
						<li><a href="foot.html">足迹</a></li>
					</ul>
				</li>

				<li class="person">
					<p>
						<i class="am-icon-qq"></i>在线客服
					</p>
					<ul>
						<li><a href="consultation.html">商品咨询</a></li>
						<li><a href="suggest.html">意见反馈</a></li>

						<li><a href="news.html">我的消息</a></li>
					</ul>
				</li>
			</ul>

		</aside>
	</div>

</body>

</html>