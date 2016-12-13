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
<link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="resources/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/style.min.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content  animated fadeIn">
		<div class="row">
			<div class="col-sm-2">
				<div class="ibox float-e-margins">
					<div class="ibox-content mailbox-content">
						<div class="file-manager">
							<ul class="folder-list m-b-md" style="padding: 4px">
								<li><a href="javascript:;"><i class="fa fa-cogs"></i>数据设置</a>
								</li>
								<li  style="border-left: 2px solid #d9534f;padding-left: 6px;background-color: #fff"><a href="javascript:;"><i
										class="fa fa-line-chart"></i>趋势曲线</a></li>
							</ul>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-10">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>趋势图</h5>
					</div>
					<div class="ibox-content">
						<div style="height: 100%;" id="container"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resources/js/content.min.js?v=1.0.0"></script>

	<script src="//cdn.bootcss.com/highcharts/4.2.0/highcharts.js"></script>

	<script src="resources/js/plugins/iCheck/icheck.min.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>

	<script type="text/javascript">
		$(function() {
			Highcharts.setOptions({
				timezoneOffset : -8
			});
			$.getJSON('http://datas.org.cn/jsonp?filename=json/usdeur.json&callback=?', function(data) {
				$('#container').highcharts({
					chart : {
						zoomType : 'x'
					},
					credits: {
					     enabled: false
					},
					title : {
						text : '趋势曲线'
					},
					subtitle : {
						text : document.ontouchstart === undefined ? '鼠标拖动可以进行缩放' : '手势操作进行缩放'
					},
					xAxis : {
						type : 'datetime',
						dateTimeLabelFormats : {
							millisecond : '%H:%M:%S.%L',
							second : '%H:%M:%S',
							minute : '%H:%M',
							hour : '%H:%M',
							day : '%m-%d',
							week : '%m-%d',
							month : '%Y-%m',
							year : '%Y'
						}
					},
					tooltip : {
						dateTimeLabelFormats : {
							millisecond : '%H:%M:%S.%L',
							second : '%H:%M:%S',
							minute : '%H:%M',
							hour : '%H:%M',
							day : '%Y-%m-%d',
							week : '%m-%d',
							month : '%Y-%m',
							year : '%Y'
						}
					},
					yAxis : {
						title : {
							text : 'Exchange rate'
						}
					},
					legend : {
						enabled : false
					},
					plotOptions : {
						area : {
							fillColor : {
								linearGradient : {
									x1 : 0,
									y1 : 0,
									x2 : 0,
									y2 : 1
								},
								stops : [ [ 0, Highcharts.getOptions().colors[0] ], [ 1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba') ] ]
							},
							marker : {
								radius : 2
							},
							lineWidth : 1,
							states : {
								hover : {
									lineWidth : 1
								}
							},
							threshold : null
						}
					},
					series : [ {
						type : 'area',
						name : '趋势',
						data : data
					} ]
				});
			});
		});
	</script>
</body>
</html>
