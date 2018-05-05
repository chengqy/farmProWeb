<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	if (request.getAttribute("cartItemList") == null) {
%>
<jsp:forward page="/cartItem/getList.action"></jsp:forward>
<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>购物车页面</title>

<link href="<%=path%>/css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/demo.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/cartstyle.css" rel="stylesheet"
	type="text/css" />
<link href="<%=path%>/css/optstyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-1.min.js"></script>
<script type="text/javascript">
	function checkAll() {
		var all = document.getElementById('all');
		var one = document.getElementsByName('proIds');
		for ( var i = 0; i < one.length; i++) {
			one[i].checked = all.checked;
		}
	}
	function putInCollection(){
		//提交form
		document.cartForm.action='<%=path%>/cartItem/moveCollect.action';
		document.cartForm.submit();
	}
	function deleted() {
		//提交form
		document.cartForm.action='<%=path%>/cartItem/deleted.action';
		document.cartForm.submit();
	}
	$(function () {
	       
        $('.J_ItemSum number');
		$("input[type='checkbox']").on('change',function () {
            var parent=$("input[type='checkbox']:checked").parent().parent().parent().find('.number');  var sum=0;for(var i=0;i<parent.length;i++){ sum+=parseFloat(parent.eq(i).html());}
           
             console.log(sum)
            $('#J_Total').html(sum);
        })

    })
</script>

</head>

<body>

	<!--顶部导航条 -->
	<div class="am-container header">
		<jsp:include page="/jsps/include/header.jsp" />
	</div>
	<!-- 搜索框 -->
	<jsp:include page="/jsps/include/search.jsp" />

	<div class="clear"></div>

	<!--购物车 -->
	<div class="concent">
		<div id="cartTable">
			<div class="cart-table-th">
				<div class="wp">
					<div class="th th-chk">
						<div id="J_SelectAll1" class="select-all J_SelectAll"></div>
					</div>
					<div class="th th-item">
						<div class="td-inner">商品信息</div>
					</div>
					<div class="th th-price">
						<div class="td-inner">单价</div>
					</div>
					<div class="th th-amount">
						<div class="td-inner">数量</div>
					</div>
					<div class="th th-sum">
						<div class="td-inner">金额</div>
					</div>
					<div class="th th-op">
						<div class="td-inner">操作</div>
					</div>
				</div>
			</div>

			<form name="cartForm" action="<%=path %>/order/settle.action" method="post">
				<c:choose>
					<c:when test="${empty cartItemList }">
						<p align="center">暂无商品~快去加购吧~</p>
					</c:when>
					<c:otherwise>
						<div class="bundle-main">
							<div class="clear"></div>

							<tr class="item-list">
								<div class="bundle  bundle-last ">

									<div class="clear"></div>
									<div class="bundle-main">
										<c:forEach var="item" items="${cartItemList }"
											varStatus="index">
											<ul class="item-content clearfix">
												<li class="td td-chk">
													<div class="cart-checkbox ">
														<input class="check" name="proIds" value="${item.proId}"
															type="checkbox" />
													</div>
												</li>
												<li class="td td-item">
													<div class="item-pic">
														<a
															href="<%=path%>/product/getProById.action?id=${item.proId}"
															target="_blank" class="J_MakePoint"
															data-point="tbcart.8.12"> <img
															src="<%=path%>/${item.proImage}"
															class="itempic J_ItemImg" /></a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a
																href="<%=path%>/product/getProById.action?id=${item.proId}"
																target="_blank" class="item-title J_MakePoint"
																data-point="tbcart.8.11">${item.proName}</a>
														</div>
													</div>
												</li>
												<li class="td td-info">
													<div class="item-props item-props-can">
														<span class="sku-line">规格：${item.specification}</span>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price price-promo-promo">
														<div class="price-content">
															<div class="price-line">
																<em class="J_Price price-now" tabindex="0">${item.price}</em>
															</div>
														</div>
													</div>
												</li>
												<li class="td td-amount">
													<div class="amount-wrapper ">
														<div class="item-amount ">
															<div class="sl">
																<span class="text_box" name="" >${item.amount}</span>
																
															</div>
														</div>
													</div>
												</li>
												<li class="td td-sum">
													<div class="td-inner">
														<em tabindex="0" class="J_ItemSum number">${item.total}</em>
													</div>
												</li>
												<li class="td td-op">
													<div class="td-inner">
														<a title="移入收藏夹" class="btn-fav"
															href="<%=path%>/cartItem/moveCollect.action?proIds=${item.proId}">
															移入收藏夹</a> <a
															href="<%=path%>/cartItem/deleted.action?proIds=${item.proId}"
															data-point-url="#" class="delete"> 删除</a>
													</div>
												</li>
											</ul>
										</c:forEach>
									</div>
								</div>
							</tr>
						</div>
						<div class="clear"></div>

						<div class="float-bar-wrapper">
							<div id="J_SelectAll2" class="select-all J_SelectAll">
								<div class="cart-checkbox">
									<input class="check-all check" id="all" name="all"
										type="checkbox" onclick="checkAll()"> <label
										for="J_SelectAllCbx2"></label>
								</div>
								<span>全选</span>
							</div>
							<div class="operations">
								<a href="javascript:void(0);" onclick="deleted()"
									class="deleteAll">删除</a> <a href="javascript:void(0);"
									onclick="putInCollection()" class="J_BatchFav">移入收藏夹</a>
							</div>
							<div class="float-bar-right">
								<div class="amount-sum">
									<div class="arrow-box">
										<span class="selected-items-arrow"></span> <span class="arrow"></span>
									</div>
								</div>
								<div class="price-sum">
									<span class="txt">合计:</span> <strong class="price">¥<em
										id="J_Total">0.00</em></strong>
								</div>
								<div class="btn-area">
									<a href="javascript:document.cartForm.submit();" id="J_Go"
										class="submit-btn submit-btn-disabled"
										aria-label="请注意如果没有选择宝贝，将无法结算"> <span>结&nbsp;算</span></a>
								</div>
							</div>

						</div>
					</c:otherwise>
				</c:choose>

			</form>

			<div class="footer">
				<jsp:include page="/jsps/include/footer.jsp" />
			</div>

		</div>
</body>

</html>