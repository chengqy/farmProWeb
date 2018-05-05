<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	if (request.getAttribute("proInitDto") == null) {
%>
<jsp:forward page="/product/getPagingList.action"></jsp:forward>
<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>搜索页面</title>

<link href="<%=path%>/css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/admin.css" rel="stylesheet" type="text/css" />

<link href="<%=path%>/css/demo.css" rel="stylesheet" type="text/css" />

<link href="<%=path%>/css/seastyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path%>/js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/script.js"></script>
</head>

<body>

	<!--顶部导航条 -->
	<div class="am-container header">
		<jsp:include page="/jsps/include/header.jsp" />
	</div>
	<!--悬浮搜索框-->
	<jsp:include page="/jsps/include/search.jsp" />

	<div class="clear"></div>
	<b class="line"></b>
	<div class="search">
		<div class="search-list">
			<div class="nav-table">
				<jsp:include page="/jsps/include/shopnav.jsp" />
			</div>


			<div class="am-g am-g-fixed">
				<div class="am-u-sm-12 am-u-md-12">
					<div class="theme-popover">

						<ul class="select">

							<div class="clear"></div>
							<li class="select-result">
								<dl>
									<dt>已选</dt>
									<dd class="select-no"></dd>
									<p class="eliminateCriteria">清除</p>
								</dl>
							</li>
							<div class="clear"></div>
							<li class="select-list"><c:if
									test="${! empty proInitDto.proPageParam.keyword}">
								"${proInitDto.proPageParam.keyword}"共搜索到${ proInitDto.proPageParam.totalCount}条相关记录
							</c:if>
								<dl id="select1">
									<dt class="am-badge am-round">分类</dt>

									<div class="dd-conent">
										<c:choose>
											<c:when test="${empty proInitDto.proPageParam.cateId }">
												<dd class="select-all selected">
													<a
														href="<%=path%>/product/getPagingList.action?cityId=${proInitDto.proPageParam.cityId}
															&keyword=${proInitDto.proPageParam.keyword}">全部</a>
												</dd>
												<c:forEach var="category"
													items="${proInitDto.categoryList }">
													<dd>
														<a
															href="<%=path%>/product/getPagingList.action?cityId=${proInitDto.proPageParam.cityId}
															&keyword=${proInitDto.proPageParam.keyword}
															&cateId=${category.cateId}">${category.cateName}</a>
													</dd>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<dd>
													<a
														href="<%=path%>/product/getPagingList.action?cityId=${proInitDto.proPageParam.cityId}
															&keyword=${proInitDto.proPageParam.keyword}">全部</a>
												</dd>
												<c:forEach var="category"
													items="${proInitDto.categoryList }">
													<c:choose>
														<c:when
															test="${category.cateId eq proInitDto.proPageParam.cateId }">
															<dd class="select-all selected">
																<a
																	href="<%=path%>/product/getPagingList.action?cityId=${proInitDto.proPageParam.cityId}
															&keyword=${proInitDto.proPageParam.keyword}
															&cateId=${category.cateId}">${category.cateName}</a>
															</dd>
														</c:when>
														<c:otherwise>
															<dd>
																<a
																	href="<%=path%>/product/getPagingList.action?cityId=${proInitDto.proPageParam.cityId}
															&keyword=${proInitDto.proPageParam.keyword}
															&cateId=${category.cateId}">${category.cateName}</a>
															</dd>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</div>

								</dl></li>

							<li class="select-list">
								<dl id="select3">
									<dt class="am-badge am-round">产地</dt>
									<div class="dd-conent">
										<c:choose>
											<c:when test="${empty proInitDto.proPageParam.cityId }">
												<dd class="select-all selected">
													<a
														href="<%=path%>/product/getPagingList.action?cateId=${proInitDto.proPageParam.cateId}
															&keyword=${proInitDto.proPageParam.keyword}">全部</a>
												</dd>
												<c:forEach var="city" items="${proInitDto.cityList }">
													<dd>
														<a
															href="<%=path%>/product/getPagingList.action?cateId=${proInitDto.proPageParam.cateId}
															&keyword=${proInitDto.proPageParam.keyword}
															&cityId=${city.cityId}">${city.cityName}</a>
													</dd>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<dd>
													<a
														href="<%=path%>/product/getPagingList.action?cateId=${proInitDto.proPageParam.cateId}
															&keyword=${proInitDto.proPageParam.keyword}">全部</a>
												</dd>
												<c:forEach var="city" items="${proInitDto.cityList }">
													<c:choose>
														<c:when
															test="${city.cityId eq proInitDto.proPageParam.cityId }">
															<dd class="select-all selected">
																<a
																	href="<%=path%>/product/getPagingList.action?cateId=${proInitDto.proPageParam.cateId}
															&keyword=${proInitDto.proPageParam.keyword}
															&cityId=${city.cityId}">${city.cityName}</a>
															</dd>
														</c:when>
														<c:otherwise>
															<dd>
																<a href="<%=path%>/product/getPagingList.action?cateId=${proInitDto.proPageParam.cateId}
															&keyword=${proInitDto.proPageParam.keyword}
															&cityId=${city.cityId}">${city.cityName}</a>
															</dd>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</div>
								</dl>
							</li>
						</ul>
						<div class="clear"></div>
					</div>
					<c:choose>
						<c:when test="${empty proInitDto.productList }">
							<p align="center">暂无商品~敬请期待~</p><br/><br/><br/><br/>
						</c:when>
						<c:otherwise>
							<div class="search-content">
								<div class="sort">
									<!-- <li class="first"><a title="综合">综合排序</a></li> -->
									<li><a
										href="<%=path%>/product/getPagingList.action?cityId=${proInitDto.proPageParam.cityId}
								&cateId=${proInitDto.proPageParam.cateId}
								&keyword=${proInitDto.proPageParam.keyword}&order=price
							">价格优先</a></li>
								</div>
								<div class="clear"></div>

								<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes"
									align="center">
									<c:forEach var="product" items="${proInitDto.productList }">
										<li>
											<div class="i-pic limit">
												<a
													href="<%=path%>/product/getProById.action?id=${product.proId}"><img
													style="height: 220px" src="<%=path %>/${product.proImage}" />
													<p class="title fl">${product.proName }</p>
													<p class="price fl">
														<b>¥</b> <strong>${product.price }</strong>
													</p>
													<p class="number fl">
														<!-- 销量<span>1110</span> -->
													</p>
											</div>
										</li>

									</c:forEach>
								</ul>
							</div>
							<div class="clear"></div>
							<form action="<%=path%>/product/getPagingList.action"
								method="post">
								<input type="hidden" name="keyword"
									value="${proInitDto.proPageParam.keyword}" /> <input
									type="hidden" name="cateId"
									value="${proInitDto.proPageParam.cateId}" /> <input
									type="hidden" name="cityId"
									value="${proInitDto.proPageParam.cityId}" /> <input
									type="hidden" name="order"
									value="${proInitDto.proPageParam.order}" />
								<!--分页 -->
								<ul class="am-pagination am-pagination-right">
									<!-- 前一页 -->
									<c:choose>
										<c:when test="${proInitDto.proPageParam.current eq 1}">
											<li class="am-disabled"><a href="#">&laquo;</a></li>
										</c:when>
										<c:otherwise>
											<li><a
												href="<%=path%>/product/getPagingList.action?cityId=${proInitDto.proPageParam.cityId}
								&cateId=${proInitDto.proPageParam.cateId}
								&keyword=${proInitDto.proPageParam.keyword}&order=${proInitDto.proPageParam.order}
								&queryPage=${proInitDto.proPageParam.current-1}">&laquo;</a></li>
										</c:otherwise>
									</c:choose>

									<li class="am-active"><a href="#">${proInitDto.proPageParam.current
											}</a></li>

									<!-- 后一页 -->
									<c:choose>
										<c:when
											test="${proInitDto.proPageParam.current eq proInitDto.proPageParam.totalPage}">
											<li class="am-disabled"><a href="#">&raquo;</a></li>
										</c:when>
										<c:otherwise>
											<li><a
												href="<%=path%>/product/getPagingList.action?cityId=${proInitDto.proPageParam.cityId}
								&cateId=${proInitDto.proPageParam.cateId}
								&keyword=${proInitDto.proPageParam.keyword}&order=${proInitDto.proPageParam.order}
								&queryPage=${proInitDto.proPageParam.current+1}">&raquo;</a></li>
										</c:otherwise>
									</c:choose>

									<li>共${proInitDto.proPageParam.totalPage }页</li>
									<li>到第</li>
									<li><input type="text" style=" height:30px; width: 40px"
										name="queryPage"></li>
									<li>页</li>
									<li><input type="submit" value="确定"></li>

								</ul>
							</form>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="footer">
				<jsp:include page="/jsps/include/footer.jsp" />
			</div>
		</div>

	</div>

	<!--菜单 -->
	<div class=tip>
		<div id="sidebar">
			<jsp:include page="/jsps/include/sidebar.jsp" />

		</div>
	</div>
	<script>
			window.jQuery || document.write('<script src="<%=path%>
		/js/jquery-1.9.min.js"><\/script>');
	</script>
	<script type="text/javascript" src="<%=path%>/js/quick_links.js"></script>

	<div class="theme-popover-mask"></div>

</body>

</html>