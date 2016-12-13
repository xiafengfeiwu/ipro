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
	href="<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"%>" />
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
				<p>权限列表</p>
				<div class="table-responsive">
					<table class="table table-striped">
						<tbody>
							<tr>
								<td>项目管理</td>
								<td>
									<p><label class=""><input type="checkbox" class="i-checks" style="position: absolute; opacity: 0;"> 新增项目</label></p>
									<p><label class=""><input type="checkbox" class="i-checks" style="position: absolute; opacity: 0;"> 修改项目</label></p>
									<p><label class=""><input type="checkbox" class="i-checks" style="position: absolute; opacity: 0;"> 删除项目</label></p>
								</td>
							</tr>
							<tr>
								<td>用户管理</td>
								<td>
									<p><label class=""><input type="checkbox" class="i-checks" style="position: absolute; opacity: 0;"> 新增用户</label></p>
									<p><label class=""><input type="checkbox" class="i-checks" style="position: absolute; opacity: 0;"> 修改用户</label></p>
									<p><label class=""><input type="checkbox" class="i-checks" style="position: absolute; opacity: 0;"> 删除用户</label></p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resources/js/content.min.js?v=1.0.0"></script>
	<script src="resources/js/plugins/iCheck/icheck.min.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
	<script>
        $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
    </script>
</body>
</html>
