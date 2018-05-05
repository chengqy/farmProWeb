<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="sideMenu am-icon-dashboard"
				style="color:#aeb2b7; margin: 10px 0 0 0;">欢迎系统管理员：${sellerSession.sellerName
				}
			</div>
			<div class="sideMenu">
				<h3 class="am-icon-flag">
					<em></em> <a href="#">商品管理</a>
				</h3>
				<ul>
					<li><a href="<%=path%>/adminjsps/productList.jsp">商品列表</a></li>
					<li><a href="<%=path%>/adminjsps/addPro.jsp">添加新商品</a></li>
				</ul>
				<h3 class="am-icon-cart-plus">
					<em></em> <a href="<%=path%>/adminjsps/orderList.jsp"> 订单管理</a>
				</h3>
				<ul>
					<li><a href="<%=path%>/adminjsps/orderList.jsp">订单列表</a></li>
				</ul>

			</div>

	<script type="text/javascript">
		jQuery(".sideMenu").slide({
			titCell : "h3", //鼠标触发对象
			targetCell : "ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
			effect : "slideDown", //targetCell下拉效果
			delayTime : 300, //效果时间
			triggerTime : 150, //鼠标延迟触发时间（默认150）
			defaultPlay : true,//默认是否执行效果（默认true）
			returnDefault : true
		//鼠标从.sideMen移走后返回默认状态（默认false）
		});
	</script>
</body>
</html>