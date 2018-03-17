<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	if (request.getAttribute("proInitDto") == null) {
%>
<jsp:forward page="/product/addInit.action"></jsp:forward>
<%
	}
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>添加农产品</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png"
	href="<%=path%>/adminjsps/assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="<%=path%>/adminjsps/assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet"
	href="<%=path%>/adminjsps/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="<%=path%>/adminjsps/assets/css/admin.css">
<script src="<%=path%>/adminjsps/assets/js/jquery.min.js"></script>
<script src="<%=path%>/adminjsps/assets/js/app.js"></script>
<style type="text/css">
span {
	color: #ff0000;
	font-size: 10px;
}
</style>
</head>

<body>
	<header class="am-topbar admin-header">
		<div class="am-topbar-brand">
			<img src="<%=path%>/adminjsps/assets/i/logo.png">
		</div>

		<div class="am-collapse am-topbar-collapse" id="topbar-collapse">
			<ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">

				<li class="am-dropdown tognzhi" data-am-dropdown>
					<button
						class="am-btn am-btn-primary am-dropdown-toggle am-btn-xs am-radius am-icon-bell-o"
						data-am-dropdown-toggle>
						消息管理<span class="am-badge am-badge-danger am-round">6</span>
					</button>
					<ul class="am-dropdown-content">



						<li class="am-dropdown-header">所有消息都在这里</li>



						<li><a href="#">未激活会员 <span
								class="am-badge am-badge-danger am-round">556</span></a></li>
						<li><a href="#">未激活代理 <span
								class="am-badge am-badge-danger am-round">69</span></a></a></li>
						<li><a href="#">未处理汇款</a></li>
						<li><a href="#">未发放提现</a></li>
						<li><a href="#">未发货订单</a></li>
						<li><a href="#">低库存产品</a></li>
						<li><a href="#">信息反馈</a></li>



					</ul>
				</li>

				<li class="kuanjie"><a href="#">订单管理</a> <a href="#">产品管理</a> <a
					href="#">评价管理</a> <a href="#">个人中心</a></li>

				<li class="soso">

					<p>

						<select
							data-am-selected="{btnWidth: 70, btnSize: 'sm', btnStyle: 'default'}">
							<option value="b">全部</option>
							<option value="o">产品</option>
							<option value="o">会员</option>

						</select>

					</p>

					<p class="ycfg">
						<input type="text" class="am-form-field am-input-sm"
							placeholder="圆角表单域" />
					</p>
					<p>
						<button class="am-btn am-btn-xs am-btn-default am-xiao">
							<i class="am-icon-search"></i>
						</button>
					</p>
				</li>
				<li class="am-hide-sm-only" style="float: right;"><a
					href="javascript:;" id="admin-fullscreen"><span
						class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
			</ul>
		</div>
	</header>

	<div class="am-cf admin-main">

		<div class="nav-navicon admin-main admin-sidebar">


			<div class="sideMenu am-icon-dashboard"
				style="color:#aeb2b7; margin: 10px 0 0 0;">欢迎系统管理员：清风抚雪</div>
			<div class="sideMenu">
				<h3 class="am-icon-flag">
					<em></em> <a href="#">商品管理</a>
				</h3>
				<ul>
					<li><a href="">商品列表</a></li>
					<li class="func" dataType='html' dataLink='msn.htm'
						iconImg='images/msn.gif'>添加新商品</li>
					<li>商品分类</li>
					<li>用户评论</li>
					<li>商品回收站</li>
					<li>库存管理</li>
				</ul>
				<h3 class="am-icon-cart-plus">
					<em></em> <a href="#"> 订单管理</a>
				</h3>
				<ul>
					<li>订单列表</li>
					<li>合并订单</li>
					<li>订单打印</li>
					<li>添加订单</li>
					<li>发货单列表</li>
					<li>换货单列表</li>
				</ul>
				<h3 class="am-icon-users">
					<em></em> <a href="#">会员管理</a>
				</h3>
				<ul>
					<li>会员列表</li>
					<li>未激活会员</li>
					<li>团队系谱图</li>
					<li>会员推荐图</li>
					<li>推荐列表</li>
				</ul>
				<h3 class="am-icon-volume-up">
					<em></em> <a href="#">信息通知</a>
				</h3>
				<ul>
					<li>站内消息 /留言</li>
					<li>短信</li>
					<li>邮件</li>
					<li>微信</li>
					<li>客服</li>
				</ul>
				<h3 class="am-icon-gears">
					<em></em> <a href="#">系统设置</a>
				</h3>
				<ul>
					<li>数据备份</li>
					<li>邮件/短信管理</li>
					<li>上传/下载</li>
					<li>权限</li>
					<li>网站设置</li>
					<li>第三方支付</li>
					<li>提现 /转账 出入账汇率</li>
					<li>平台设置</li>
					<li>声音文件</li>
				</ul>
			</div>
			<!-- sideMenu End -->

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

		</div>

		<div class=" admin-content">

			<div class="daohang">
				<ul>
					<li><button type="button"
							class="am-btn am-btn-default am-radius am-btn-xs">首页</li>
					<li><button type="button"
							class="am-btn am-btn-default am-radius am-btn-xs">
							帮助中心<a href="javascript: void(0)" class="am-close am-close-spin"
								data-am-modal-close="">×</a>
						</button></li>
					<li><button type="button"
							class="am-btn am-btn-default am-radius am-btn-xs">
							奖金管理<a href="javascript: void(0)" class="am-close am-close-spin"
								data-am-modal-close="">×</a>
						</button></li>
					<li><button type="button"
							class="am-btn am-btn-default am-radius am-btn-xs">
							产品管理<a href="javascript: void(0)" class="am-close am-close-spin"
								data-am-modal-close="">×</a>
						</button></li>


				</ul>

			</div>

			<div class="admin-biaogelist">

				<div class="listbiaoti am-cf">
					<ul class="am-icon-flag on">栏目名称
					</ul>

					<dl class="am-icon-home" style="float: right;">
						当前位置： 首页 >
						<a href="#">商品列表</a>
					</dl>

				</div>

				<div class="fbneirong">
					<form class="am-form" action="<%=path%>/product/add.action"
						method="post" enctype="multipart/form-data">
						<div class="am-form-group am-cf">
							<div class="zuo">标题：</div>
							<div class="you">
								<input type="text" name="proName"
									value="${productParam.proName} " class="am-input-sm"
									id="doc-ipt-email-1" placeholder="请输入标题">
							</div>
							<span>${productParam.errors.proName}</span>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">价格：</div>
							<div class="you">
								<input type="text" name="price" value="${productParam.price}"
									class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入价格">
							</div>
							<span>${productParam.errors.price}</span>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">规格：</div>
							<div class="you">
								<input type="text" name="specification"
									value="${productParam. specification}" class="am-input-sm"
									id="doc-ipt-email-1" placeholder="请输入规格，例如：个、箱、袋等">
							</div>
							<span>${productParam.errors.specification}</span>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">库存：</div>
							<div class="you">
								<input type="text" name="stock" value="${productParam.stock}"
									class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入库存">
							</div>
							<span>${productParam.errors.stock}</span>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">关键词：</div>
							<div class="you">
								<input type="text" name="keyword"
									value="${productParam.keyword}" class="am-input-sm"
									id="doc-ipt-pwd-1" placeholder="请输入关键词,多个用逗号隔开">
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">类别：</div>
							<div class="you">
								<select id="cateId" name="cateId">
									<option value="">--请选择--</option>
									<c:forEach var="category" items="${proInitDto.categoryList }">
										<c:choose>
											<c:when test="${category.cateId eq productParam.cateId }">
												<option value="${category.cateId }" selected="selected">${category.cateName
													}</option>
											</c:when>
											<c:otherwise>
												<option value="${category.cateId }">${category.cateName
													}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>
							<span>${productParam.errors.cateId}</span>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">产地：</div>
							<div class="you">
								<select id="cityId" name="cityId">
									<option value="">--请选择--</option>
									<c:forEach var="city" items="${proInitDto.cityList }">
										<c:choose>
											<c:when test="${city.cityId eq productParam.cityId }">
												<option value="${city.cityId }" selected="selected">${city.cityName
													}</option>
											</c:when>
											<c:otherwise>
												<option value="${city.cityId }">${city.cityName }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>
							<span>${productParam.errors.cityId}</span>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">简介：</div>
							<div class="you">
								<textarea name="introduction" rows="2" id="doc-ta-1">${productParam.introduction}</textarea>
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">上下架：</div>
							<div class="you">
								<input type="radio" name="status" value="1" >上架
								<input type="radio" name="status" value="0" >下架
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">封面图：</div>
							<div class="you">
								<input type="file" name="head" id="doc-ipt-file-1">
							</div>
							<span>${productParam.errors.proImage}</span>
						</div>

						<div class="am-form-group am-cf">
							<div class="zuo">产品细节图：</div>
							<div class="you" style="height: 45px;">
								<input type="file" name="pic" id="doc-ipt-file-1">
								<p class="am-form-help">请选择要上传的文件...</p>
							</div>
						</div>

						<div class="am-form-group am-cf">
							<div class="zuo">产品细节图：</div>
							<div class="you" style="height: 45px;">
								<input type="file" name="pic" id="doc-ipt-file-1">
								<p class="am-form-help">请选择要上传的文件...</p>
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">产品细节图：</div>
							<div class="you" style="height: 45px;">
								<input type="file" name="pic" id="doc-ipt-file-1">
								<p class="am-form-help">请选择要上传的文件...</p>
							</div>
						</div>

						<div class="am-form-group am-cf">
							<div class="you" style="margin-left: 11%;">
								<button type="submit" class="am-btn am-btn-success am-radius">发布并关闭窗口</button>
								&nbsp; &raquo; &nbsp;
								<button type="submit" class="am-btn am-btn-secondary am-radius">发布并继续发布</button>

							</div>
						</div>
					</form>
				</div>



				<div class="foods">
					<ul>版权所有@2015
					</ul>
					<dl>
						<a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a>
					</dl>
				</div>




			</div>

		</div>




	</div>

	<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]-->

	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="assets/js/amazeui.min.js"></script>
	<!--<![endif]-->



</body>
</html>