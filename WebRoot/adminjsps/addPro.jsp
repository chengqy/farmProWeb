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
</head>

<body>
	<header class="am-topbar admin-header">

		<div class="am-collapse am-topbar-collapse" id="topbar-collapse">
			<jsp:include page="/adminjsps/include/topbar.jsp" />
		</div>
	</header>

	<div class="am-cf admin-main">
		<!-- 左边菜单栏 -->
		<div class="nav-navicon admin-main admin-sidebar">
			<jsp:include page="/adminjsps/include/left.jsp" />
		</div>

		<div class=" admin-content">
			<!-- 小导航 -->
			<jsp:include page="/adminjsps/include/daohang.jsp" />

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
						<input type="hidden" name="proId" value="${productParam.proId}">
						<div class="am-form-group am-cf">
							<div class="zuo">标题：</div>
							<div class="you">
								<input type="text" name="proName"
									value="${productParam.proName} " class="am-input-sm"
									id="doc-ipt-email-1" placeholder="请输入标题">
							</div>
							<span style=" color:#ff0000;font-size: 10px">${productParam.errors.proName}</span>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">价格：</div>
							<div class="you">
								<input type="text" name="price" value="${productParam.price}"
									class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入价格">
							</div>
							<span style=" color:#ff0000;font-size: 10px">${productParam.errors.price}</span>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">规格：</div>
							<div class="you">
								<input type="text" name="specification"
									value="${productParam. specification}" class="am-input-sm"
									id="doc-ipt-email-1" placeholder="请输入规格，例如：个、箱、袋等">
							</div>
							<span style=" color:#ff0000;font-size: 10px">${productParam.errors.specification}</span>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">库存：</div>
							<div class="you">
								<input type="text" name="stock" value="${productParam.stock}"
									class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入库存">
							</div>
							<span style=" color:#ff0000;font-size: 10px">${productParam.errors.stock}</span>
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
							<span style=" color:#ff0000;font-size: 10px">${productParam.errors.cateId}</span>
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
							<span style=" color:#ff0000;font-size: 10px">${productParam.errors.cityId}</span>
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
							<span style=" color:#ff0000;font-size: 10px">${productParam.errors.proImage}</span>
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
								<button type="submit" class="am-btn am-btn-success am-radius">发布</button>

							</div>
						</div>
					</form>
				</div>

				<div class="foods">
					<jsp:include page="/adminjsps/include/footer.jsp" />
				</div>

			</div>

		</div>

	</div>

	<script src="assets/js/amazeui.min.js"></script>

</body>
</html>