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
	<div class="wrapper wrapper-content animated fadeIn">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox-content">
					<ul class="nav nav-tabs" id="avatar-tab">
						<li class="active" id="item1"><a href="javascript:;">画面</a></li>
						<li id="item2"><a href="javascript:;">地图</a></li>
						<li id="item3"><a href="javascript:;">数据</a></li>
						<li id="item4"><a href="javascript:;">告警</a></li>
						<li id="item5"><a href="javascript:;">趋势</a></li>
						<li id="item6"><a href="javascript:;">设置</a></li>
					</ul>
					<div class="m-t m-b">
						<div id="item1_content" class="itemContent">content1</div>
						<div id="item2_content" class="itemContent">
							<iframe class="J_iframe" data-id="map" name="map" width="100%" height="100%" src="develop/map.jspx" frameborder="0" seamless></iframe>
						</div>
						<div id="item3_content" class="itemContent" style="display:none">
							<iframe class="J_iframe" data-id="data" name="data" width="100%" height="100%" src="develop/data.jspx" frameborder="0" seamless></iframe>
						</div>
						<div id="item4_content" class="itemContent" style="display:none">
							<iframe class="J_iframe" data-id="warn" name="warn" width="100%" height="100%" src="develop/warn.jspx" frameborder="0" seamless></iframe>
						</div>
						<div id="item5_content" class="itemContent" style="display:none">
							<iframe class="J_iframe" data-id="trend" name="trend" width="100%" height="100%" src="develop/trend.jspx" frameborder="0" seamless></iframe>
						</div>
						<div id="item6_content" class="itemContent" style="display:none">
							<iframe class="J_iframe" data-id="setup" name="setup" width="100%" height="100%" src="develop/setup.jspx" frameborder="0" seamless></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resources/js/content.min.js?v=1.0.0"></script>
	<script src="resources/js/plugins/iCheck/icheck.min.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
	<script type="text/javascript">
	var currentTab = "item1";
	var currentContent = "#item1_content";
	setTimeout(function(){
		$("#item2_content").hide();
	}, 200)
	//选项卡点击事件
	$('#avatar-tab li').click(function() {
		if (currentTab != this.id) {
			currentTab = this.id;
			currentContent = "#" + currentTab + "_content";
			$(this).addClass('active');
			$(this).siblings().removeClass('active');
			$(currentContent).show();
			$(currentContent).siblings().hide();
		}
	});

	$(".itemContent").height($(window).height() - 146);
	$(window).resize(function(){
		$(".itemContent").height($(window).height() - 146);
	});
	</script>
</body>
</html>