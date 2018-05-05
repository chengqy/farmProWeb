<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head lang="en">
<meta charset="UTF-8">
<title>注册</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet" href="../css/amazeui.min.css" />
<link href="../css/dlstyle.css" rel="stylesheet" type="text/css">
<script src="../js/jquery.min.js"></script>
<script src="../js/amazeui.min.js"></script>
<script type="text/javascript">
	function getCode() {
		var phone = document.getElementById('phone').value;
		var context = document.getElementById('PageContext').value;
		window.location.href = context + "/user/sendMessage.action?phone="
				+ phone;
	}
</script>
</head>

<body>

	<div class="login-boxtitle">
		<a href="/farmProShop/jsps/main.jsp"><img alt=""
			src="../images/logobig.PNG" /></a>
	</div>

	<div class="res-banner">
		<div class="res-main">
			<div class="login-banner-bg">
				<span></span><img src="../images/big.jpg" />
			</div>
			<form
				action="${pageContext.request.contextPath}/user/register.action"
				method="post">
				<div class="login-box">

					<div class="am-tabs" id="doc-my-tabs">
						<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
							<li class="am-active"><a href="">手机号注册</a></li>
						</ul>
						<p align="center" style=" color:#ff0000;font-size: 10px"> ${message }</p>
						<div class="am-tab-panel">
							<span style=" color:#ff0000;font-size: 10px">${userValidatorparam.errors.phone}</span>
							<div class="user-phone">
								<label for="phone"><i
									class="am-icon-mobile-phone am-icon-md"></i></label> <input type="tel"
									name="phone" id="phone" value="${userValidatorparam.phone}"
									placeholder="请输入手机号">

							</div>

							<span style=" color:#ff0000;font-size: 10px">${userValidatorparam.errors.code}</span>
							<div class="verification">
								<label for="code"><i class="am-icon-code-fork"></i></label> <input
									type="tel" name="code" value="${userValidatorparam.code}"
									id="code" placeholder="请输入验证码"> <a class="btn"
									href="javascript:void(1);" onclick="getCode()"> <span
									id="dyMobileButton">获取</span>
								</a>

							</div>

							<input id="PageContext" type="hidden"
								value="${pageContext.request.contextPath}" /> <span  style=" color:#ff0000;font-size: 10px">${userValidatorparam.errors.password}</span>
							<div class="user-pass">
								<label for="password"><i class="am-icon-lock"></i></label> <input
									type="password" name="password" id="password"
									value="${userValidatorparam.password}" placeholder="设置密码">

							</div>
							<span style=" color:#ff0000;font-size: 10px">${userValidatorparam.errors.password2}</span>
							<div class="user-pass">
								<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
								<input type="password" name="password2"
									value="${userValidatorparam.password2}" id="passwordRepeat"
									placeholder="确认密码">
							</div>


							<div class="am-cf">
								<input type="submit" name="" value="注册"
									class="am-btn am-btn-primary am-btn-sm am-fl">
							</div>

							<hr>
						</div>

						<script>
							$(function() {
								$('#doc-my-tabs').tabs();
							})
						</script>

					</div>
				</div>
			</form>
		</div>
	</div>

	<!--底部-->
	<div class="footer">
		<jsp:include page="/jsps/include/footer.jsp" />
	</div>
</body>

</html>