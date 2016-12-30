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
<style type="text/css">
	.anchorBL{display:none;}
	.BMap_cpyCtrl{display:none;}
	#m-map{width: 100%; height: 100%;position: absolute;left: 0;top: 0;}
	
	.leftCtrlPanel{width: 261px; height: 100%; position: absolute;right:0;z-index:200; background-color: rgba(255,255,255,.75);display: none;}
	.leftCtrlPanel .close{width:40px;height: 40px;position: absolute;right: 0;font-size: 22px;line-height: 40px;text-align: center;color: #000;cursor: pointer;background-color: rgba(255,255,255,.8);z-index:200; }
	.leftCtrlPanel .htmlContent{width:100%;height: 100%;position: absolute;bottom: 0px;padding: 8px;overflow: auto;}

	.spiner {margin-top: 50%;}
	
	.JPCtrlPanel{width:100%;height: 60px;position: absolute;bottom: 0;z-index:100; background-color: rgb(244,243,239);border-top: 1px solid #ddd}
	.row {padding:0;margin:0;position: absolute;bottom: 0;color:rgb(47,64,80);min-width: 890px;}
	.row .col-xs-12 .title{width:80px;height: 100%;float: left;line-height: 60px;font-size: 14px;text-align: center;border-right: 1px solid #ddd;margin-left: -10px;font-weight: bold;}
	.row .col-xs-12 img{width: 60px;height: 60px;float: left;}
	.row .col-xs-12 .text {float: left;}
	.row .col-xs-12 .text p {height: 60px;padding: 0;margin: 0;line-height: 60px;margin-right: 12px;margin-left: 4px;text-align: center;}
</style>
</head>

<body class="gray-bg">
	<div class="leftCtrlPanel">
		<div class="close" title="关闭面板"><i class="fa fa-close"></i></div>
		<div class="htmlContent"></div>
	</div>
	
	<div class="JPCtrlPanel">
		<div class="row">
			<div class="col-xs-12 tooltip-demo">
				<div class="title">减排量</div>
				<img src="resources/img/icon/BZM.png">
				<div class="text" data-toggle="tooltip" data-placement="top" title="标准煤量减排 2332.2 kg">
					<p><span class="label label-primary">2332.2</span> kg</p>
				</div>
				<img src="resources/img/icon/CO2.png">
				<div class="text" data-toggle="tooltip" data-placement="top" title="二氧化碳减排 2332.2 kg">
					<p><span class="label label-info">2332.2</span> kg</p>
				</div>
				<img src="resources/img/icon/SO2.png">
				<div class="text" data-toggle="tooltip" data-placement="top" title="二氧化硫减排 2332.2 kg">
					<p><span class="label label-success">2332.2</span> kg</p>
				</div>
				<img src="resources/img/icon/FC.png">
				<div class="text" data-toggle="tooltip" data-placement="top" title="粉尘量减排 2332.2 kg">
					<p><span class="label label-warning">2332.2</span> kg</p>
				</div>
				<img src="resources/img/icon/NOx.png">
				<div class="text" data-toggle="tooltip" data-placement="top" title="氮氧化合物减排 2332.2 kg">
					<p><span class="label label-danger">2332.2</span> kg</p>
				</div>
			</div>
		</div>
	</div>
	<div id="m-map">
	</div>
	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resources/js/content.min.js?v=1.0.0"></script>
	<script src="resources/js/plugins/echarts/echarts-all-3.js"></script>
	<script src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
	<script src="resources/js/plugins/echarts/bmap.js"></script>
	<script src="resources/js/plugins/iCheck/icheck.min.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('m-map'));

		var data = [ {
			name : '热泵1',
			value : 150
		}, {
			name : '热泵2',
			value : 250
		}, {
			name : '热泵3',
			value : 350
		}, {
			name : '热泵4',
			value : 450
		}, {
			name : '热泵5',
			value : 550
		}, {
			name : '热泵6',
			value : 650
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
						value : geoCoord.concat(data[i].value)
					});
				}
			}
			return res;
		};

		var option = {
			tooltip : {
				trigger : 'item'
			},
			bmap : {
				center : [ 116.40, 39.92 ],
				zoom : 11,
				roam : true,
				mapStyle : {
					styleJson : [ {
						'featureType' : 'railway',
						'elementType' : 'all',
						'stylers' : {
							'visibility' : 'off'
						}
					}, {
						'featureType' : 'poi',
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
						color : function(val) {
							if (val.value[2] > 500) {
								return 'coral';
							} else if (val.value[2] > 300) {
								return 'red';
							} else {
								return 'gray';
							}
						}
					}
				},
				zlevel : 1
			} ]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
		myChart.on('click', function(params) {
			$(".leftCtrlPanel").show();
			$(".htmlContent").html('<div class="spiner"><div class="sk-spinner sk-spinner-cube-grid"><div class="sk-cube"></div><div class="sk-cube"></div><div class="sk-cube"></div><div class="sk-cube"></div><div class="sk-cube"></div><div class="sk-cube"></div><div class="sk-cube"></div><div class="sk-cube"></div><div class="sk-cube"></div></div><p class="text-center">正在加载数据...<p></div>');
			if (params.componentType === 'series') {
				setTimeout(function(){
					$(".htmlContent").html('<a class="J_menuItem" href="user/me.jspx">个人信息</a>论文格式就是指进行论文写作时的样式要求，以及写作标准。直观地说，论文格式就是论文达到可公之于众的标准样式和内容要求。论文常用来进行科学研究和描述科研成果文章。它既是探讨问题进行科学研究的一种手段，又是描述科研成果进行学术交流的一种工具。它包括学年论文、毕业论文、学位论文、科技论文、成果论文等，总称为论文。论文格式就是指进行论文写作时的样式要求，以及写作标准。直观地说，论文格式就是论文达到可公之于众的标准样式和内容要求。论文常用来进行科学研究和描述科研成果文章。它既是探讨问题进行科学研究的一种手段，又是描述科研成果进行学术交流的一种工具。它包括学年论文、毕业论文、学位论文、科技论文、成果论文等，总称为论文。论文格式就是指进行论文写作时的样式要求，以及写作标准。直观地说，论文格式就是论文达到可公之于众的标准样式和内容要求。论文常用来进行科学研究和描述科研成果文章。它既是探讨问题进行科学研究的一种手段，又是描述科研成果进行学术交流的一种工具。它包括学年论文、毕业论文、学位论文、科技论文、成果论文等，总称为论文。论文格式就是指进行论文写作时的样式要求，以及写作标准。直观地说，论文格式就是论文达到可公之于众的标准样式和内容要求。论文常用来进行科学研究和描述科研成果文章。它既是探讨问题进行科学研究的一种手段，又是描述科研成果进行学术交流的一种工具。它包括学年论文、毕业论文、学位论文、科技论文、成果论文等，总称为论文。论文格式就是指进行论文写作时的样式要求，以及写作标准。直观地说，论文格式就是论文达到可公之于众的标准样式和内容要求。论文常用来进行科学研究和描述科研成果文章。它既是探讨问题进行科学研究的一种手段，又是描述科研成果进行学术交流的一种工具。它包括学年论文、毕业论文、学位论文、科技论文、成果论文等，总称为论文。论文格式就是指进行论文写作时的样式要求，以及写作标准。直观地说，论文格式就是论文达到可公之于众的标准样式和内容要求。论文常用来进行科学研究和描述科研成果文章。它既是探讨问题进行科学研究的一种手段，又是描述科研成果进行学术交流的一种工具。它包括学年论文、毕业论文、学位论文、科技论文、成果论文等，总称为论文。论文格式就是指进行论文写作时的样式要求，以及写作标准。直观地说，论文格式就是论文达到可公之于众的标准样式和内容要求。论文常用来进行科学研究和描述科研成果文章。它既是探讨问题进行科学研究的一种手段，又是描述科研成果进行学术交流的一种工具。它包括学年论文、毕业论文、学位论文、科技论文、成果论文等，总称为论文。论文格式就是指进行论文写作时的样式要求，以及写作标准。直观地说，论文格式就是论文达到可公之于众的标准样式和内容要求。论文常用来进行科学研究和描述科研成果文章。它既是探讨问题进行科学研究的一种手段，又是描述科研成果进行学术交流的一种工具。它包括学年论文、毕业论文、学位论文、科技论文、成果论文等，总称为论文。论文格式就是指进行论文写作时的样式要求，以及写作标准。直观地说，论文格式就是论文达到可公之于众的标准样式和内容要求。论文常用来进行科学研究和描述科研成果文章。它既是探讨问题进行科学研究的一种手段，又是描述科研成果进行学术交流的一种工具。它包括学年论文、毕业论文、学位论文、科技论文、成果论文等，总称为论文。论文格式就是指进行论文写作时的样式要求，以及写作标准。直观地说，论文格式就是论文达到可公之于众的标准样式和内容要求。论文常用来进行科学研究和描述科研成果文章。它既是探讨问题进行科学研究的一种手段，又是描述科研成果进行学术交流的一种工具。它包括学年论文、毕业论文、学位论文、科技论文、成果论文等，总称为论文。论文格式就是指进行论文写作时的样式要求，以及写作标准。直观地说，论文格式就是论文达到可公之于众的标准样式和内容要求。论文常用来进行科学研究和描述科研成果文章。它既是探讨问题进行科学研究的一种手段，又是描述科研成果进行学术交流的一种工具。它包括学年论文、毕业论文、学位论文、科技论文、成果论文等，总称为论文。论文格式就是指进行论文写作时的样式要求，以及写作标准。直观地说，论文格式就是论文达到可公之于众的标准样式和内容要求。论文常用来进行科学研究和描述科研成果文章。它既是探讨问题进行科学研究的一种手段，又是描述科研成果进行学术交流的一种工具。它包括学年论文、毕业论文、学位论文、科技论文、成果论文等，总称为论文。论文格式就是指进行论文写作时的样式要求，以及写作标准。直观地说，论文格式就是论文达到可公之于众的标准样式和内容要求。论文常用来进行科学研究和描述科研成果文章。它既是探讨问题进行科学研究的一种手段，又是描述科研成果进行学术交流的一种工具。它包括学年论文、毕业论文、学位论文、科技论文、成果论文等，总称为论文。');
				}, 1000)
			}
		});
		$(".close").on("click", function(){
			$(".leftCtrlPanel").hide();
			$(".htmlContent").html("");
		})
	</script>
</body>
</html>
