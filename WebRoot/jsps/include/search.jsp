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
</head>
<body>
	<div class="nav white">
		<div class="logoBig">
			<a href="<%=path%>/jsps/main.jsp"><img src="<%=path%>/images/logobig.PNG" /></a>
		</div>

		<div class="search-bar pr">
			<a name="index_none_header_sysc" href="#"></a>
			<form action="<%=path%>/product/getPagingList.action" method="post">
				<input id="searchInput" name="keyword" type="text" placeholder="搜索"
					autocomplete="off" value="${proInitDto.proPageParam.keyword}">
				<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
					type="submit">
			</form>
		</div>
	</div>
</body>
</html>