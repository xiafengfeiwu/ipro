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
    <div class="wrapper wrapper-content  animated fadeIn">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>角色列表</h5>
						<div class="ibox-tools">
							<a class="dropdown-toggle" data-toggle="dropdown" href="javascript:;"> <i class="fa fa-bars"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="javascript:;">新增角色</a></li>
							</ul>
						</div>
					</div>
					<div class="ibox-content">
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th></th>
										<th>角色名称</th>
										<th>创建时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="checkbox" class="i-checks" name="input[]"></td>
										<td>系统管理员</td>
										<td>2016-12-13 11:17:02</td>
										<td><button type="button" onclick="openWindow()" class="btn btn-primary">授权</button></td>
									</tr>
									<tr>
										<td><input type="checkbox" class="i-checks" name="input[]"></td>
										<td>农户</td>
										<td>2016-12-13 11:17:03</td>
										<td><button type="button" onclick="openWindow()" class="btn btn-primary">授权</button></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resources/js/content.min.js?v=1.0.0"></script>
    <script src="resources/js/plugins/layer/layer.min.js"></script>
	<script src="resources/js/plugins/iCheck/icheck.min.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
	<script>
        $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
        function openWindow(){
        	parent.layer.open({
                type: 2,
                title: '角色授权',
                closeBtn: true,
                shade: [0.23],
                area: ['860px', '415px'],
                content: ['develop/role/authorize.jspx', 'no'], //iframe的url，no代表不显示滚动条
            });
        }
    </script>
</body>
</html>
