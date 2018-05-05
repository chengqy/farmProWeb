<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	if (request.getSession().getAttribute("sellerSession") == null) {
%>
<jsp:forward page="/adminjsps/login.jsp"></jsp:forward>
<%
	}
%>
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>后台管理首页</title>
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
<script src="<%=path%>/adminjsps/assets/js/echarts.js"></script>
<style type="text/css">
<!--
#main {
margin-top:20px;
	height: 1000px;
	width: 100%;
}

#left {
	float: left;
	height: 450px;
	width: 50%;
}

#right {
	float: left;
	height: 450px;
	width: 50%;
}
#uleft {
	float: left;
	height: 450px;
	width: 98%;
}
-->
</style>
<script type="text/javascript">
	function chart1(data) {
		legends=[];
		for(i in data){
			legends.push(data[i].name);
		}
		var myChart = echarts.init(document.getElementById('left'));
		option = {
			title : {
				text : '最近七日销量分析',
				subtext : '',
				x : 'center'
			},
			tooltip : {
				trigger : 'item',
				formatter : "{a} <br/>{b} : {c} ({d}%)"
			},
			legend : {
				orient : 'vertical',
				left : 'left',
				data : legends
			},
			series : [ {
				name : '商品',
				type : 'pie',
				radius : '55%',
				center : [ '50%', '60%' ],
				data :data,
				itemStyle : {
					emphasis : {
						shadowBlur : 10,
						shadowOffsetX : 0,
						shadowColor : 'rgba(0, 0, 0, 0.5)'
					}
				}
			} ]
		};
		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	}

	function chart2(data) {
		category=[]
		series=[]
		for(i in data){
			category.push(data[i].day)
			series.push(data[i].income)
		}
		var myChart = echarts.init(document.getElementById('right'));

		option = {
			title : {
				text : '最近七日收入分析',
				subtext : '',
				x : 'center'
			},
			xAxis : {
				type : 'category',
				data : category
			},
			yAxis : {
				type : 'value'
			},
			series : [ {
				data : series,
				type : 'line'
			} ]
		};
		myChart.setOption(option);

	}
	function chart3(data) {
		months=[]
		for(i in data.months){
			months.push(data.months[i])
		}
		series=[]
		pro=[]
		for(i in data.salesInfos){
			pro.push(data.salesInfos[i].pro)
			da=[]
			for(j in data.salesInfos[i].sales){
				da.push(data.salesInfos[i].sales[j])
			}
			series.push({
				name:data.salesInfos[i].pro,
	            type:'line',
	            stack: '总量',
	            data:da
		       })
		}
		var myChart = echarts.init(document.getElementById('uleft'));
		option = {
			    title: {
			        text: '销量分析'
			    },
			    tooltip : {
			        trigger: 'axis',
			    },
			    legend: {
			        data:pro
			    },
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '3%',
			        containLabel: true
			    },
			    toolbox: {
			        feature: {
			            saveAsImage: {}
			        }
			    },
			    xAxis : [
			        {
			            type : 'category',
			            boundaryGap : false,
			            data : months
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series :series 
			};
		myChart.setOption(option);
	}	
	function getReportData(){
		 $.ajax({
			 url:"<%=path%>/report/report.action"
			 ,success:function(json){
			 $("#todayIncome").html(json.todayIncome);
			 $("#totalIncome").html(json.totalIncome);
			 $("#todayOrders").html(json.todayOrders);
			 $("#totalOrders").html(json.totalOrders);
			 chart1(json.sales);
			 chart2(json.income);
			 chart3(json.monthSales);
		 }
		 }); 
	}
</script>
</head>

<body>
	<header class="am-topbar admin-header">
		<jsp:include page="/adminjsps/include/topbar.jsp"></jsp:include>
	</header>

	<div class="am-cf admin-main">

		<div class="nav-navicon admin-main admin-sidebar">
			<jsp:include page="/adminjsps/include/left.jsp" />
		</div>

		<div class=" admin-content">

			<jsp:include page="/adminjsps/include/daohang.jsp"></jsp:include>
			<div class="admin">

				<div class="admin-index">
					<dl data-am-scrollspy="{animation: 'slide-right', delay: 100}">
						<dt class="qs">
							<i class="am-icon-shopping-cart"></i>
						</dt>
						<dd id="todayOrders">0</dd>
						<dd class="f12">今日订单</dd>
					</dl>
					<dl data-am-scrollspy="{animation: 'slide-right', delay: 300}">
						<dt class="cs">
							<i class="am-icon-cny"></i>
						</dt>
						<dd id="todayIncome">0</dd>
						<dd class="f12">今日收入</dd>
					</dl>
					<dl data-am-scrollspy="{animation: 'slide-right', delay: 600}">
						<dt class="hs">
							<i class="am-icon-shopping-cart"></i>
						</dt>
						<dd id="totalOrders">0</dd>
						<dd class="f12">全部订单</dd>
					</dl>
					<dl data-am-scrollspy="{animation: 'slide-right', delay: 900}">
						<dt class="ls">
							<i class="am-icon-cny"></i>
						</dt>
						<dd id="totalIncome">0</dd>
						<dd class="f12">全部收入</dd>
					</dl>
				</div>
				<div id="main" class="admin-biaoge">
					<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
					<div id="left"></div>
					<div id="right"></div>
					<div id="uleft"></div>
					
					<script type="text/javascript">
					getReportData();
					</script>
				</div>

				<div class="foods" style="margin-top:50px;">
					<jsp:include page="/adminjsps/include/footer.jsp" />
				</div>

			</div>

		</div>

	</div>

	<script src="assets/js/amazeui.min.js"></script>

</body>
</html>