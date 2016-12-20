<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<base
	href="<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath() + "/"%>" />
<title>${systemInfo.systemTitle }</title>
<link rel="shortcut icon" href="favicon.ico">
<link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="resources/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="//cdn.bootcss.com/highcharts/5.0.6/css/highcharts.css"
	rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/style.min.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
	<div id="container"></div>
	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resources/js/plugins/layer/layer.min.js"></script>
	<script src="resources/js/hplus.min.js?v=4.1.0"></script>
	<script src="resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="//cdn.bootcss.com/highcharts/5.0.6/highcharts.js"></script>
	<script src="resources/js/contabs.min.js"></script>
	<script>
		$(function() {
			Highcharts.chart('container', {
				title : {
					text : 'Monthly Average Temperature',
					x : -20
				//center
				},
				subtitle : {
					text : 'Source: WorldClimate.com',
					x : -20
				},
				xAxis : {
					categories : [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' ]
				},
				yAxis : [ { //第一个Y轴，序号为0
					labels : {
						format : '{value}°C',
						style : {
							color : '#89A54E'
						}
					},
					title : {
						text : 'Temperature',
						style : {
							color : '#89A54E'
						}
					}
				}, { //第二个Y轴，序号为1
					title : {
						text : 'Rainfall',
						style : {
							color : '#4572A7'
						}
					},
					labels : {
						format : '{value} mm',
						style : {
							color : '#4572A7'
						}
					},
					opposite : true
				} ],
				tooltip : {
					valueSuffix : '°C'
				},
				legend : {
					layout : 'vertical',
					align : 'right',
					verticalAlign : 'middle',
					borderWidth : 0
				},
				series : [ { //第二个Y轴的数据
					name : 'Rainfall',
					color : '#4572A7',
					type : 'column',
					yAxis : 1,//坐标轴序号
					data : [ 49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4 ],
					tooltip : {
						valueSuffix : ' mm'
					}
				}, { //第一个Y轴的数据
					name : 'Temperature',
					color : '#89A54E',
					type : 'spline',
					data : [ 7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6 ],
					tooltip : {
						valueSuffix : '°C'
					}
				} ]
			});
		});

		history.pushState(null, null, document.URL);
		window.addEventListener('popstate', function() {
			history.pushState(null, null, document.URL);
		});
	</script>
</body>
</html>
