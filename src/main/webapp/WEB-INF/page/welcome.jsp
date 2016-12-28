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
	<div style="width: 261px; height: 100%; float: right;">
		sadasdasdasdasdas</div>
	<div id="m-map"
		style="width: 100%; height: 100%; padding-right: 261px;"></div>
	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resources/js/content.min.js?v=1.0.0"></script>
	<script src="resources/js/plugins/echarts/echarts-all-3.js"></script>
	<script
		src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
	<script src="resources/js/plugins/echarts/bmap.js"></script>
	<script src="resources/js/plugins/iCheck/icheck.min.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('m-map'));

		var data = [ {
			name : '热泵1'
		}, {
			name : '热泵2'
		}, {
			name : '热泵3'
		}, {
			name : '热泵4'
		}, {
			name : '热泵5'
		}, {
			name : '热泵6'
		} ];
		var geoCoordMap = {
			'热泵1' : [ 116.46, 39.92 ],
			'热泵2' : [ 116.26, 39.42 ],
			'热泵3' : [ 116.66, 39.62 ],
			'热泵4' : [ 116.86, 39.32 ],
			'热泵5' : [ 116.66, 39.82 ],
			'热泵6' : [ 116.56, 39.72 ]

		};

		var convertData = function(data) {
			var res = [];
			for (var i = 0; i < data.length; i++) {
				var geoCoord = geoCoordMap[data[i].name];
				if (geoCoord) {
					res.push({
						name : data[i].name,
						value : geoCoord
					});
				}
			}
			return res;
		};

		var option = {
			title : {
				text : '项目（热泵）分布图',
				left : 'left'
			},
			tooltip : {
				trigger : 'item'
			},
			bmap : {
				center : [ 116.40, 39.92 ],
				zoom : 11,
				roam : true,
				mapStyle : {
					styleJson : [ {
						'featureType' : 'water',
						'elementType' : 'all',
						'stylers' : {
							'color' : '#000'
						}
					}, {
						'featureType' : 'land',
						'elementType' : 'all',
						'stylers' : {
							'color' : '#000'
						}
					}, {
						'featureType' : 'railway',
						'elementType' : 'all',
						'stylers' : {
							'visibility' : 'off'
						}
					}, {
						'featureType' : 'highway',
						'elementType' : 'all',
						'stylers' : {
							'visibility' : 'off'
						}
					}, {
						'featureType' : 'highway',
						'elementType' : 'labels',
						'stylers' : {
							'visibility' : 'off'
						}
					}, {
						'featureType' : 'arterial',
						'elementType' : 'geometry',
						'stylers' : {
							'color' : '#000'
						}
					}, {
						'featureType' : 'arterial',
						'elementType' : 'geometry.fill',
						'stylers' : {
							'color' : '#000'
						}
					}, {
						'featureType' : 'poi',
						'elementType' : 'all',
						'stylers' : {
							'visibility' : 'off'
						}
					}, {
						'featureType' : 'green',
						'elementType' : 'all',
						'stylers' : {
							'visibility' : 'off'
						}
					}, {
						'featureType' : 'subway',
						'elementType' : 'all',
						'stylers' : {
							'visibility' : 'off'
						}
					}, {
						'featureType' : 'manmade',
						'elementType' : 'all',
						'stylers' : {
							'color' : '#ddd'
						}
					}, {
						'featureType' : 'local',
						'elementType' : 'all',
						'stylers' : {
							'visibility' : 'off'
						}
					}, {
						'featureType' : 'arterial',
						'elementType' : 'labels',
						'stylers' : {
							'visibility' : 'off'
						}
					}, {
						'featureType' : 'boundary',
						'elementType' : 'all',
						'stylers' : {
							'color' : '#ddd'
						}
					}, {
						'featureType' : 'building',
						'elementType' : 'all',
						'stylers' : {
							'color' : '#ddd'
						}
					}, {
						'featureType' : 'label',
						'elementType' : 'labels.text.fill',
						'stylers' : {
							'color' : '#ddd'
						}
					} ]
				}
			},
			series : [ {
				type : 'effectScatter',
				coordinateSystem : 'bmap',
				data : convertData(data),
				symbolSize : function(val) {
					return 8;
				},
				showEffectOn : 'render',
				rippleEffect : {
					brushType : 'stroke'
				},
				hoverAnimation : true,
				label : {
					normal : {
						formatter : '{a}',
						position : 'right',
						show : true
					}
				},
				itemStyle : {
					normal : {
						color : 'green'
					}
				},
				zlevel : 1
			} ]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);

		myChart.on('click', function(params) {
			if (params.componentType === 'series') {
				console.info(params.value)
			}
		});
	</script>
</body>
</html>
