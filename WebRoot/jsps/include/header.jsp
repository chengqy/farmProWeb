<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function logout() {
		var msg = "您真的确定要退出吗？\n\n请确认！";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
}

</script>

</head>
<body>
	<ul class="message-l">
		<div class="topMessage">
			<div class="menu-hd">
				<c:choose>
					<c:when test="${empty sessionScope.loginSession }">
						<a href="<%=path%>/jsps/login.jsp" target="_top" class="h">亲，请登录</a>
						<a href="<%=path%>/jsps/register.jsp" target="_top">免费注册</a>
					</c:when>
					<c:otherwise>
								欢迎您！${sessionScope.loginSession.username }&nbsp;【<a href="<%=path%>/user/logout.action" onclick="javascript:return logout()">退出</a>】
							</c:otherwise>
				</c:choose>

			</div>
		</div>
	</ul>
	<ul class="message-r">
		<div class="topMessage home">
			<div class="menu-hd">
				<a href="<%=path%>/jsps/main.jsp" target="_top" class="h">商城首页</a>
			</div>
		</div>
		<div class="topMessage my-shangcheng">
			<div class="menu-hd MyShangcheng">
				<a href="<%=path%>/jsps/person/index.jsp" target="_top"><i
					class="am-icon-user am-icon-fw"></i>个人中心</a>
			</div>
		</div>
		<div class="topMessage mini-cart">
			<div class="menu-hd">
				<a id="mc-menu-hd" href="<%=path%>/jsps/shopcart.jsp"
					target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><!-- <strong
					id="J_MiniCartNum" class="h">0</strong> --></a>
			</div>
		</div>
		<div class="topMessage favorite">
			<div class="menu-hd">
				<a href="<%=path%>/jsps/person/collection.jsp" target="_top"><i
					class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
			</div>
	</ul>
</body>
</html>