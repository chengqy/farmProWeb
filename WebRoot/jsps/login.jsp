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
		<a href="<%=path %>/jsps/main.jsp"><img alt="logo" src="<%=path %>/images/logobig.PNG" /></a>
	</div>

	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg">
				<span></span><img src="<%=path %>/images/big.jpg" />
			</div>
			<div class="login-box">

				<h3 class="title">登录商城</h3>
				
				<p align="center" style=" color:#ff0000" >${message }</p>
				<%
					String message = (String) request.getAttribute("message");
					if (message != null)
						request.removeAttribute("message");
				%>
				<form action="${pageContext.request.contextPath}/user/login.action"
					method="post">
					<div class="login-form">
						<div class="user-name">
							<label for="user"><i class="am-icon-user"></i></label> <input
								type="text" name="username" id="username" value="${userParam.username }"
								placeholder="邮箱/手机/用户名">
						</div>
						<br>
						<div class="user-pass">
							<label for="password"><i class="am-icon-lock"></i></label> <input
								type="password" name="password" id="password" value="${userParam.password }"
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
		<jsp:include page="/jsps/include/footer.jsp" />
	</div>
</body>

</html>
