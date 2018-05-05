<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>绑定手机</title>

<link href="<%=path%>/css/admin.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/amazeui.css" rel="stylesheet" type="text/css">

<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/stepstyle.css" rel="stylesheet"
	type="text/css">

<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
<script src="<%=path%>/js/amazeui.js"></script>
<script type="text/javascript">
	function sendMobileCode1() {
		//提交form
		document.form1.action='<%=path%>/user/sendBindMessage.action';
		document.form1.submit();
		
	}
	function sendMobileCode() {
		//提交form
		document.form1.action='<%=path%>/user/sendBindOldMessage.action';
		document.form1.submit();
		
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

				<div class="am-cf am-padding">
					<div class="am-fl am-cf">
						<strong class="am-text-danger am-text-lg">绑定手机</strong> / <small>Bind&nbsp;Phone</small>
					</div>
				</div>
				<hr />
				<!--进度条-->
				<div class="m-progress">
					<div class="m-progress-list">
						<span class="step-1 step"> <em class="u-progress-stage-bg"></em>
							<i class="u-stage-icon-inner">1<em class="bg"></em></i>
							<p class="stage-name">绑定手机</p>
						</span> <span class="step-2 step"> <em class="u-progress-stage-bg"></em>
							<i class="u-stage-icon-inner">2<em class="bg"></em></i>
							<p class="stage-name">完成</p>
						</span> <span class="u-progress-placeholder"></span>
					</div>
					<div class="u-progress-bar total-steps-2">
						<div class="u-progress-bar-inner"></div>
					</div>
				</div>
				<form class="am-form am-form-horizontal" name="form1"
					action="${pageContext.request.contextPath}/user/bindphone.action"
					method="post">
					<p align="center" style=" color:#ff0000">${message }</p>
					 <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
					<div class="am-form-group bind">
						<label for="user-phone" class="am-form-label">验证手机</label>
						<div class="am-form-content">
							<span id="user-phone">${loginSession.phone }</span>
						</div>
					</div>
					<div class="am-form-group code">
						<label for="user-code" class="am-form-label">验证码</label>
						<div class="am-form-content">
							<input type="tel" name="code" value="${ code}" id="user-code"
								placeholder="短信验证码">
						</div>
						<a class="btn" href="javascript:void(0);" onclick="sendMobileCode()"
							 id="sendMobileCode"> <span
							class="am-btn am-btn-danger">验证码</span>
						</a>
					</div>
					<div class="am-form-group">
						<label for="user-new-phone" class="am-form-label">验证手机</label>
						<div class="am-form-content">
							<input type="tel" name="phone" value="${ phone}" id="phone"
								placeholder="绑定新手机号">
						</div>
					</div>
					<div class="am-form-group code">
						<label for="user-new-code" class="am-form-label">验证码</label>
						<div class="am-form-content">
							<input type="tel" name="code2" value="${ code2}"
								id="user-new-code" placeholder="短信验证码">
						</div>
						<a class="btn" href="javascript:void(0);"
							onclick="sendMobileCode1()" id="sendMobileCode"> <span
							class="am-btn am-btn-danger">验证码</span>
						</a>
					</div>
					<div class="info-btn">
						<input class="am-btn am-btn-danger" type="submit" value="保存修改" />
					</div>

				</form>

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
						<li class="active"><a href="<%=path%>/jsps/person/bindphone.jsp">换绑手机</a></li>
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