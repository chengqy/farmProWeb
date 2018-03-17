<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>

<head lang="en">
<meta charset="UTF-8">
<title>登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet" href="<%=path %>/css/amazeui.css" />
<link href="<%=path %>/css/dlstyle.css" rel="stylesheet" type="text/css">
</head>

<body>

	<div class="login-boxtitle">
		<a href="home.html"><img alt="logo" src="<%=path %>/images/logobig.PNG" /></a>
	</div>

	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg">
				<span></span><img src="<%=path %>/images/big.jpg" />
			</div>
			<div class="login-box">

				<h3 class="title">登录商城</h3>
				<%-- <c:if test="${errors!=null }">
					<c:forEach items="errors" var="error">
						${error.defaultMessage }
					</c:forEach>
				
				</c:if> --%>
				${message }
				<%
					String message = (String) request.getAttribute("message");
					if (message != null)
						request.removeAttribute("message");
				%>
				<form action="${pageContext.request.contextPath}/seller/login.action"
					method="post">
					<div class="login-form">
						<div class="user-name">
							<label for="user"><i class="am-icon-user"></i></label> <input
								type="text" name="sellerName" id="sellerName"  value="${sellerParam.sellerName }"
								placeholder="邮箱/手机/用户名">
						</div>
						<br>
						<div class="user-pass">
							<label for="password"><i class="am-icon-lock"></i></label> <input
								type="password" name="password" id="password" value="${sellerParam.password }"
								placeholder="请输入密码">
						</div>

					</div>


					<div class="am-cf">
						<input type="submit" name="" value="登 录"
							class="am-btn am-btn-primary am-btn-sm">
					</div>
				</form>

			</div>
		</div>
	</div>


	<div class="footer ">
		<div class="footer-hd ">
			<p>
				<a href="# ">恒望科技</a> <b>|</b> <a href="# ">商城首页</a> <b>|</b> <a
					href="# ">支付宝</a> <b>|</b> <a href="# ">物流</a>
			</p>
		</div>
		<div class="footer-bd ">
			<p>
				<a href="# ">关于恒望</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a
					href="# ">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有</em>
			</p>
		</div>
	</div>
</body>

</html>
