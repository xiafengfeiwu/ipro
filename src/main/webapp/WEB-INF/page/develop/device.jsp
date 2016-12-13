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
						<h5>设备列表</h5>
						<div class="ibox-tools">
							<a class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#"> <i class="fa fa-bars"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="javascript:;">新增设备</a></li>
							</ul>
						</div>
					</div>
					<div class="ibox-content">
						<div class="row">
							<div class="col-sm-2 m-b-xs">
								<select class="input-sm form-control input-s-sm inline">
									<option value="0">请选择设备类型</option>
									<option value="1">采集器</option>
									<option value="2">集中器</option>
								</select>
							</div>
							<div class="col-sm-3">
								<div class="input-group">
									<input type="text" placeholder="请输入关键词"
										class="input-sm form-control"> <span
										class="input-group-btn">
										<button type="button" class="btn btn-sm btn-primary">搜索</button>
									</span>
								</div>
							</div>
						</div>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th></th>
										<th>设备名称</th>
										<th>序列号</th>
										<th>规格型号</th>
										<th>状态</th>
										<th>上次联系时间</th>
										<th>注册时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="checkbox" checked class="i-checks" name="input[]"></td>
										<td>modbus</td>
										<td>100501</td>
										<td>modbus</td>
										<td>离线</td>
										<td>2016-12-13 11:17:02</td>
										<td>2016-12-13 11:17:02</td>
										<td>操作</td>
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
	<script src="resources/js/plugins/iCheck/icheck.min.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
	<script>
        $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
    </script>
</body>
</html>
