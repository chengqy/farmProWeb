<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	if (request.getAttribute("proInitDto") == null) {
%>
<jsp:forward page="/product/getAdminPagingList.action"></jsp:forward>
<%
	}
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>商品列表</title>
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
<script type="text/javascript">
	function checkAll() {
		var all = document.getElementById('all');
		var one = document.getElementsByName('proId');
		for ( var i = 0; i < one.length; i++) {
			one[i].checked = all.checked;
		}
	}
</script>
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

				<li class="kuanjie"><a href="#">会员管理</a> <a href="#">奖金管理</a> <a
					href="#">订单管理</a> <a href="#">产品管理</a> <a href="#">个人中心</a> <a
					href="#">系统设置</a></li>
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
				style="color:#aeb2b7; margin: 10px 0 0 0;">欢迎系统管理员：${sellerSession.sellerName
				}</div>
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
					<dl>
						<button type="button"
							class="am-btn am-btn-danger am-round am-btn-xs am-icon-plus">
							添加产品</button>
					</dl>
				</div>
				<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
					<form action="<%=path%>/product/getAdminPagingList.action" method="post">
						<ul>
							<li>
								<div class="am-btn-group am-btn-group-xs">
									<select
										data-am-selected="{btnWidth: 90, btnSize: 'sm', btnStyle: 'default'}"
										name="status">
										<option value="">产品状态</option>
										<option value="1">上架</option>
										<option value="0">下架</option>
									</select>
								</div>
							</li>
							<li>
								<div class="am-btn-group am-btn-group-xs">
									<select
										data-am-selected="{btnWidth: 90, btnSize: 'sm', btnStyle: 'default'}"
										name="cateId">
										<option value="">产品分类</option>
										<c:forEach var="category" items="${proInitDto.categoryList }">
											<c:choose>
												<c:when
													test="${category.cateId eq proInitDto.proPageParam.cateId }">
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
							</li>
							<li style="margin-right: 0;"><span
								class="tubiao am-icon-calendar"></span> <input type="text"
								class="am-form-field am-input-sm am-input-zm  am-icon-calendar"
								placeholder="开始日期" data-am-datepicker="{theme: 'success',}"
								readonly name="beginTime" /></li>
							<li style="margin-left: -4px;"><span
								class="tubiao am-icon-calendar"></span> <input type="text"
								class="am-form-field am-input-sm am-input-zm  am-icon-calendar"
								placeholder="结束日期" data-am-datepicker="{theme: 'success',}"
								readonly name="endTime" /></li>

							<li><input type="text"
								class="am-form-field am-input-sm am-input-xm"
								placeholder="关键词搜索" name="keyword" value="${proInitDto.proPageParam.keyword}"/></li>
							<li><button type="submit"
									class="am-btn am-radius am-btn-xs am-btn-success"
									style="margin-top: -1px;">搜索</button></li>
						</ul>
					</form>
				</div>
				<form class="am-form am-g">

					<table width="100%"
						class="am-table am-table-bordered am-table-radius am-table-striped">
						<thead>
							<tr class="am-success">
								<th class="table-check"><input type="checkbox" name="all"
									id="all" onclick="checkAll()" /></th>
								<th class="table-id">库存</th>
								<th class="table-id">价格</th>
								<th class="table-title">标题</th>
								<th class="table-type">类别</th>
								<th class="table-author am-hide-sm-only">上架/下架 <i
									class="am-icon-check am-text-warning"></i> <i
									class="am-icon-close am-text-primary"></i></th>
								<th class="table-date am-hide-sm-only">修改时间</th>
								<th width="163px" class="table-set">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="product" items="${proInitDto.productList }">
								<tr>
									<td><input type="checkbox" name="proId" /></td>
									<td>${product.stock }</td>
									<td>${product.price }</td>
									<td><a href="#">${product.proName }</a></td>
									<td>${product.cateName }</td>
									<c:choose>
										<c:when test="${product.status eq 1 }">
											<td class="am-hide-sm-only"><i
												class="am-icon-check am-text-warning"></i></td>
										</c:when>
										<c:otherwise>
											<td class="am-hide-sm-only"><i
												class="am-icon-close am-text-primary"></i></td>
										</c:otherwise>
									</c:choose>

									<td class="am-hide-sm-only">${product.updateTime }</td>
									<td><div class="am-btn-toolbar">
											<div class="am-btn-group am-btn-group-xs">
												<button
													class="am-btn am-btn-default am-btn-xs am-text-success am-round">
													<span class="am-icon-search"></span>
												</button>
												<button
													class="am-btn am-btn-default am-btn-xs am-text-secondary am-round">
													<span class="am-icon-pencil-square-o"></span>
												</button>
												<button
													class="am-btn am-btn-default am-btn-xs am-text-warning  am-round">
													<span class="am-icon-copy"></span>
												</button>
												<button
													class="am-btn am-btn-default am-btn-xs am-text-danger am-round">
													<span class="am-icon-trash-o"></span>
												</button>
											</div>
										</div></td>
								</tr>

							</c:forEach>

						</tbody>
					</table>

					<div class="am-btn-group am-btn-group-xs">
						<button type="button" class="am-btn am-btn-default">
							<span class="am-icon-plus"></span> 删除
						</button>
						<button type="button" class="am-btn am-btn-default">
							<span class="am-icon-save"></span> 上架
						</button>
						<button type="button" class="am-btn am-btn-default">
							<span class="am-icon-save"></span> 下架
						</button>
						<button type="button" class="am-btn am-btn-default">
							<span class="am-icon-plus"></span> 新增
						</button>
					</div>

					<ul class="am-pagination am-fr">
						<c:choose>
							<c:when test="${proInitDto.proPageParam.current eq 1}">
								<li>«</li>
							</c:when>
							<c:otherwise>
								<li><a href="<%=path%>/product/getAdminPagingList.action?status=${proInitDto.proPageParam.status}&cityId=${proInitDto.proPageParam.cityId}
								&beginTime=${proInitDto.proPageParam.beginTime}
								&endTime=${proInitDto.proPageParam.endTime}
								&keyword=${proInitDto.proPageParam.keyword}
								&queryPage=${proInitDto.proPageParam.current-1}">«</a></li>
							</c:otherwise>
						</c:choose>
						<li class="am-active"><a href="#">${proInitDto.proPageParam.current
								}</a></li>
						<c:choose>
							<c:when
								test="${proInitDto.proPageParam.current eq proInitDto.proPageParam.totalPage}">
								<li>»</li>
							</c:when>
							<c:otherwise>
								<li><a href="<%=path%>/product/getAdminPagingList.action?status=${proInitDto.proPageParam.status}&cityId=${proInitDto.proPageParam.cityId}
								&beginTime=${proInitDto.proPageParam.beginTime}
								&endTime=${proInitDto.proPageParam.endTime}
								&keyword=${proInitDto.proPageParam.keyword}
								&queryPage=${proInitDto.proPageParam.current+1}">»</a></li>
							</c:otherwise>
						</c:choose>

						<li>共${proInitDto.proPageParam.totalPage }页</li>
						<li>到第</li>
						<li><input type="text" name="queryPage" style=" height:10px; width: 60px"></li>
						<li>页</li>
						<li><input type="button" name="" value="确定"></li>
					</ul>

					<hr />

				</form>

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
	<script src="<%=path%>/adminjsps/assets/js/amazeui.min.js"></script>
	<!--<![endif]-->
</body>
</html>