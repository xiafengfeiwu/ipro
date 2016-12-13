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
			<div class="col-sm-3">
				<input type="text" placeholder="变量组" class="input-sm form-control"> 
			</div>
			<div class="col-sm-3">
				<input type="text" placeholder="起始时间" class="input-sm form-control">
			</div>
			<div class="col-sm-3">
				<input type="text" placeholder="结束时间" class="input-sm form-control">
			</div>
			<div class="col-sm-3">
				<button class="btn">查询</button>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-2">
				<div class="ibox float-e-margins">
                    <div class="ibox-content mailbox-content">
                        <div class="file-manager">
                            <h5>告警级别</h5>
                            <ul class="folder-list m-b-md" style="padding: 4px">
                                <li style="border-left: 2px solid #d9534f;padding-left: 6px;background-color: #fff">
                                    <a href="javascript:;"> 全部告警</a>
                                </li>
                                <li>
                                    <a href="javascript:;"> 一级 <span class="label label-primary pull-right">1</span></a>
                                </li>
                                <li>
                                    <a href="javascript:;"> 二级 <span class="label label-info pull-right">2</span></a>
                                </li>
                                <li>
                                    <a href="javascript:;"> 三级 <span class="label label-warning pull-right">0</span></a>
                                </li>
                                <li>
                                    <a href="javascript:;"> 四级 <span class="label label-danger pull-right">0</span></a>
                                </li>
                                <li>
                                    <a href="javascript:;"> 通知 <span class="label label-default pull-right">0</span></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
			</div>
			<div class="col-sm-10">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>变量组</th>
								<th>设备名称</th>
								<th>告警名称</th>
								<th>级别</th>
								<th>告警内容</th>
								<th>时间</th>
								<th>数据项名称</th>
								<th>数据项别名</th>
								<th>规则名称</th>
								<th>操作符</th>
								<th>操作数</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Moni</td>
								<td>Moni353</td>
								<td>alarm</td>
								<td><span class="label label-primary">一级</span></td>
								<td>A_brake</td>
								<td>2016-12-13 11:17:02</td>
								<td>moin_A</td>
								<td>a</td>
								<td>A_brake</td>
								<td>&gt;</td>
								<td>1000</td>
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
</body>
</html>
