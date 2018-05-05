<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	if (request.getAttribute("provinceList") == null) {
%>
<jsp:forward page="/province/getList.action"></jsp:forward>
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

<title>地址修改</title>

<link href="<%=path%>/css/admin.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/amazeui.css" rel="stylesheet" type="text/css">

<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/addstyle.css" rel="stylesheet" type="text/css">
<script src="<%=path%>/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=path%>/js/amazeui.js"></script>
<script type="text/javascript">
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
		</article>
	</header>

	<div class="nav-table">
		<jsp:include page="/jsps/include/shopnav.jsp" />
	</div>
	<b class="line"></b>

	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-address">
					<!--标题 -->


					<div class="am-modal am-modal-no-btn" id="doc-modal-1">
						<div class="clear"></div>
						<div class="add-dress">

							<!--标题 -->
							<div class="am-cf am-padding">
								<div class="am-fl am-cf">
									<strong class="am-text-danger am-text-lg">修改地址</strong> / <small>Edit&nbsp;address</small>
								</div>
							</div>
							<hr />

							<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
								<form class="am-form am-form-horizontal"
									action="${pageContext.request.contextPath}/address/update.action"
									method="post">
									<input type="hidden" name="id" value="${address.id}">
									<div align="center" style="color: #ff0000;">${message }</div>
									<br>
									<div class="am-form-group">
										<label for="user-name" class="am-form-label">收货人</label>
										<div class="am-form-content">
											<input type="text" name="receiver" id="user-name"
												value="${address.receiver}" placeholder="收货人">
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-phone" class="am-form-label">手机号码</label>
										<div class="am-form-content">
											<input id="user-phone" name="phone" value="${address.phone}"
												placeholder="手机号必填" type="text">
										</div>
									</div>
									<div class="am-form-group">
										<label for="user-address" class="am-form-label">所在地</label>
										<div class="am-form-content address">
											<select id="province" name="province" onchange="sel()">
												<option value="">--请选择--</option>
												<c:forEach var="province" items="${provinceList }">
													<c:choose>
														<c:when test="${province.pid eq address.province }">
															<option value="${province.pid }" selected="selected">${province.pname}</option>
														</c:when>
														<c:otherwise>
															<option value="${province.pid }">${province.pname}</option>
														</c:otherwise>

													</c:choose>

												</c:forEach>
											</select> <select id="city" name="city">
												<option value="">--请选择--</option>
												<!-- <option value="1">广州</option>
												<option value="2">中山</option>
												<option value="3">深圳</option> -->
											</select>
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-intro" class="am-form-label">详细地址</label>
										<div class="am-form-content">
											<textarea class="" name="address" rows="3" id="user-intro"
												placeholder="输入详细地址">${address.address }</textarea>
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
											<a href="<%=path%>/jsps/person/address.jsp"
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
						<li class="active"><a href="<%=path%>/jsps/person/address.jsp">收货地址</a></li>
					</ul></li>
				<li class="person"><a href="#">我的交易</a>
					<ul>
						<li><a href="<%=path%>/jsps/person/order.jsp">订单管理</a></li>
						
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