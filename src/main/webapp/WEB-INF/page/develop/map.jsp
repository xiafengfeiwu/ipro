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
<style type="text/css">
body, html, #allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
	padding:0;
	font-family: "微软雅黑";
}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=GNW79l0oE1e19AxGjhPrBc8OGfjDOvQo&s=1"></script>
</head>
<body>
	<div id="allmap"></div>
	<script type="text/javascript">
		// 百度地图API功能
		var map = new BMap.Map("allmap"); // 创建Map实例
		var point = new BMap.Point(116.404017, 39.915073);
		map.centerAndZoom(point, 11); // 初始化地图,设置中心点坐标和地图级别
		map.addControl(new BMap.MapTypeControl()); //添加地图类型控件
		map.setCurrentCity("北京"); // 设置地图显示的城市 此项是必须设置的
		map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
		var loadSuccess = true;
		map.addEventListener("tilesloaded", function() {
			if (loadSuccess) {
				var marker = new BMap.Marker(point); // 创建点
				map.addOverlay(marker);
				map.setCenter(point);
			}
			loadSuccess = false;
		});
	</script>
</body>
</html>