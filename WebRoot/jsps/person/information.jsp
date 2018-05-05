<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	if (request.getSession().getAttribute("loginSession") == null) {
%>
<jsp:forward page="/jsps/login.jsp"></jsp:forward>
<%
	}
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>个人资料</title>

<link href="<%=path%>/css/admin.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/amazeui.css" rel="stylesheet" type="text/css">

<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/infstyle.css" rel="stylesheet" type="text/css">
<script src="<%=path%>/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=path%>/js/amazeui.js" type="text/javascript"></script>
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
		</article>
	</header>
	<div class="nav-table">
		<jsp:include page="/jsps/include/shopnav.jsp" />
	</div>
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-info">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small>
						</div>
					</div>
					<hr />
					<form class="am-form am-form-horizontal"
						action="${pageContext.request.contextPath}/user/update.action"
						method="post" enctype="multipart/form-data">
						<!--头像 -->
						<div class="user-infoPic">

							<div class="filePic">
								<input type="file" name="pic" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">
								<img class="am-circle am-img-thumbnail"
									src="<%=path %>/${loginSession.headImg}" alt="" />
									
							</div>

							<p class="am-form-help">头像</p>

							<div class="info-m">
								<div>
									<b>账号：<i>${loginSession.phone }</i></b>
								</div>
							</div>
						</div>
						<p align="center" style=" color:#ff0000">${message }</p>
						<!--个人信息 -->
						<div class="info-main" >

							<div class="am-form-group">
								<label for="user-name2" class="am-form-label">用户名</label>
								<div class="am-form-content">${loginSession.username }</div>
							</div>

							<div class="am-form-group">
								<label for="user-name2" class="am-form-label">新用户名</label>
								<div class="am-form-content">
									<input type="text" name="username" id="user-name2" value="${username }"
										placeholder="nickname">

								</div>
							</div>



							<div class="am-form-group">
								<label class="am-form-label">性别</label>
								<div class="am-form-content sex">
									<label class="am-radio-inline"> <input type="radio"
										name="sex" value="1" data-am-ucheck> 男
									</label> <label class="am-radio-inline"> <input type="radio"
										name="sex" value="2" data-am-ucheck> 女
									</label> <label class="am-radio-inline"> <input type="radio"
										name="sex" value="0" data-am-ucheck> 保密
									</label>
								</div>
							</div>

							<div class="info-btn">
								<input class="am-btn am-btn-danger" type="submit" value="保存修改">
							</div>

						</div>
					</form>
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
						<li class="active"><a href="<%=path%>/jsps/person/information.jsp">个人信息</a></li>
						<li><a href="<%=path%>/jsps/person/password.jsp">修改密码</a></li>
						<li><a href="<%=path%>/jsps/person/bindphone.jsp">换绑手机</a></li>
						<li><a href="<%=path%>/jsps/person/address.jsp">收货地址</a></li>
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