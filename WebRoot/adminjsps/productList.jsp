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
		var one = document.getElementsByName('proIds');
		for ( var i = 0; i < one.length; i++) {
			one[i].checked = all.checked;
		}
	}
	
	function sub(val){
		//判断参数  
	    if(val==1){
			//提交form
			document.form1.action='<%=path%>/product/deleted.action';
			document.form1.submit();
	    }
		if(val==2){
			//提交form
			document.form1.action='<%=path%>/product/changeStatusTrue.action';
			document.form1.submit();
	    }
		if(val==3){
			//提交form
			document.form1.action='<%=path%>/product/changeStatusFalse.action';
			document.form1.submit();
	    }
	}
</script>
</head>

<body>
	<header class="am-topbar admin-header">

		<div class="am-collapse am-topbar-collapse" id="topbar-collapse">
			<jsp:include page="/adminjsps/include/topbar.jsp" />
		</div>
	</header>
	<div class="am-cf admin-main">
		<div class="nav-navicon admin-main admin-sidebar">
			<jsp:include page="/adminjsps/include/left.jsp" />
		</div>
		<div class=" admin-content">
			<jsp:include page="/adminjsps/include/daohang.jsp" />
			<div class="admin-biaogelist">
				<div class="listbiaoti am-cf">
					<ul class="am-icon-flag on">栏目名称
					</ul>
					<dl class="am-icon-home" style="float: right;">
						当前位置： 首页 >
						<a href="#">商品列表</a>
					</dl>
					<dl>
						<a href="<%=path %>/adminjsps/addPro.jsp"
							class="am-btn am-btn-danger am-round am-btn-xs am-icon-plus">
							添加产品</a>
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
										<c:choose>
											<c:when test="${empty proInitDto.proPageParam.status}">
												<option value="1">上架</option>
												<option value="0">下架</option>
											</c:when>
											<c:when test="${proInitDto.proPageParam.status eq 0}">
												<option value="1">上架</option>
												<option value="0" selected="selected">下架</option>
											</c:when>
											<c:when test="${proInitDto.proPageParam.status eq 1}">
												<option value="1" selected="selected">上架</option>
												<option value="0">下架</option>
											</c:when>
											<c:otherwise>
												<option value="1">上架</option>
												<option value="0">下架</option>
											</c:otherwise>
										</c:choose>

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

							<li><input type="text"
								class="am-form-field am-input-sm am-input-xm"
								placeholder="关键词搜索" name="keyword"
								value="${proInitDto.proPageParam.keyword}" /></li>
							<li><button type="submit"
									class="am-btn am-radius am-btn-xs am-btn-success"
									style="margin-top: -1px;">搜索</button></li>
						</ul>
					</form>
				</div>
				<c:choose>
					<c:when test="${empty proInitDto.productList }">
						<p align="center">暂无商品~</p><br><br><br><br>
					</c:when>
					<c:otherwise>
						<form name="form1" class="am-form am-g" method="post" action="<%=path%>/product/getAdminPagingList.action" >
							<input type="hidden" name="keyword" value="${proInitDto.proPageParam.keyword}" />
							 <input type="hidden" name="cateId" value="${proInitDto.proPageParam.cateId}" /> 
							<input type="hidden" name="status" value="${proInitDto.proPageParam.status}" /> 
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
											<td><input type="checkbox" name="proIds"
												value="${product.proId}" /></td>
											<td>${product.stock }</td>
											<td>${product.price }</td>
											<td><a href="<%=path%>/product/getProById.action?id=${product.proId}" >${product.proName }</a></td>
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
															class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" title="修改商品">
															<a href="<%=path%>/product/editProduct.action?id=${product.proId}"  class="am-icon-pencil-square-o"></a>
														</button>
														<button
															class="am-btn am-btn-default am-btn-xs am-text-danger am-round" title="删除">
															<a href="<%=path%>/product/deleted.action?proIds=${product.proId}" class="am-icon-trash-o"></a>
														</button>
													</div>
												</div></td>
										</tr>

									</c:forEach>

								</tbody>
							</table>

							<div class="am-btn-group am-btn-group-xs">
								<button type="button" class="am-btn am-btn-default" onclick="sub(1)">
									<span class="am-icon-plus"></span>删除 
								</button>
								<button type="button" class="am-btn am-btn-default" onclick="sub(2)">
									<span class="am-icon-save"></span> 上架
								</button>
								<button type="button" class="am-btn am-btn-default" onclick="sub(3)">
									<span class="am-icon-save"></span> 下架
								</button>
								
							</div>

							<ul class="am-pagination am-fr">
								<c:choose>
									<c:when test="${proInitDto.proPageParam.current eq 1}">
										<li>«</li>
									</c:when>
									<c:otherwise>
										<li><a
											href="<%=path%>/product/getAdminPagingList.action?status=${proInitDto.proPageParam.status}&cateId=${proInitDto.proPageParam.cateId}
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
										<li><a href="<%=path%>/product/getAdminPagingList.action?status=${proInitDto.proPageParam.status}&cateId=${proInitDto.proPageParam.cateId}
								&beginTime=${proInitDto.proPageParam.beginTime}
								&endTime=${proInitDto.proPageParam.endTime}
								&keyword=${proInitDto.proPageParam.keyword}
								&queryPage=${proInitDto.proPageParam.current+1}">»</a></li>
									</c:otherwise>
								</c:choose>

								<li>共${proInitDto.proPageParam.totalPage }页</li>
								<li>到第</li>
								<li><input type="text" name="queryPage"
									style=" height:10px; width: 60px"></li>
								<li>页</li>
								<li><input type="submit" value="确定" /></li>
							</ul>

							<hr />

						</form>
					</c:otherwise>
				</c:choose>



				<div class="foods" style="margin-top:50px;">
					<jsp:include page="/adminjsps/include/footer.jsp" />
				</div>

			</div>

		</div>

	</div>

	<script src="<%=path%>/adminjsps/assets/js/amazeui.min.js"></script>
</body>
</html>