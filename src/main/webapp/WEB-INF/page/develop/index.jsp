<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<base
	href="<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath() + "/"%>" />
<title>开发</title>
<link rel="shortcut icon" href="favicon.ico">
<link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="resources/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/style.min.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeIn">
		<div class="row">
			<div class="col-sm-4">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>
							菜单配置 <small>系统自定义菜单控制面板</small>
						</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i></a>
						</div>
					</div>
					<div class="ibox-content">${menuNestableHtml }</div>
				</div>
			</div>
			<div class="col-sm-4">ss</div>
			<div class="col-sm-4">ss</div>
		</div>
	</div>

	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resources/js/content.min.js?v=1.0.0"></script>
	<script src="resources/js/plugins/nestable/jquery.nestable.js"></script>
	<script>
		$(document).ready(function() {
			$("#menu-nestable").nestable({
				maxDepth : 3
			}).on("change", function(e) {
				var list = e.length ? e : $(e.target);
				if (window.JSON) {
					console.info(window.JSON.stringify(list.nestable("serialize")))
				} else {
					alert("浏览器不支持nestable")
				}
			});
		});
	</script>
</body>

</html>
