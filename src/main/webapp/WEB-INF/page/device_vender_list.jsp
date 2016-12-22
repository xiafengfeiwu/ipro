<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
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
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>设备供应商列表</h5>
						<div class="ibox-tools">
							<a class="dropdown-toggle" data-toggle="dropdown"
								href="javascript:;"> <i class="fa fa-bars"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<shiro:hasPermission name="CreateDeviceVender">
									<li><a href="javascript:;" onclick="openCreateDeviceVenderWindow()">
											<i class="fa fa-plus-square-o"></i> &nbsp; 新增供应商
									</a></li>
								</shiro:hasPermission>
								<li><a href="javascript:;"
									onclick="window.location.reload()"> <i
										class="fa fa-refresh"></i> &nbsp; 刷新列表
								</a></li>
							</ul>
						</div>
					</div>
					<div class="ibox-content">
						<div class="full-height-scroll">
							<div class="table-responsive">
								<table class="table table-striped table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>供应商名称</th>
											<th>供应商代码</th>
											<th>厂家联系人</th>
											<th></th>
											<th>厂家联系方式</th>
											<th>厂家地址</th>
											<th>创建时间</th>
											<th class="text-center">操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${venders}" varStatus="vs" var="vender">
											<tr>
												<td>${vs.index+1 }</td>
												<td>${vender.venderName }</td>
												<td>${vender.venderCode }</td>
												<td>${vender.venderContacts }</td>
												<td class="contact-type"><i class="fa fa-phone"></i></td>
												<td>${vender.venderContactsTel }</td>
												<td>${vender.venderAddress }</td>
												<td><fmt:formatDate value="${vender.createTime}" pattern="yyyy-MM-dd HH:mm" /></td>
												<td class="text-center">
													<shiro:hasPermission name="UpdateDeviceVender">
														<a class="label label-primary" href="javascript:;" onclick="openChangeDeviceVenderWindow('${vender.venderId }')">修改</a>
													</shiro:hasPermission>
													<shiro:hasPermission name="DeleteDeviceVender">
														<a class="label label-danger" href="javascript:;" onclick="openDeleteDeviceVenderWindow('${vender.venderId }')">删除</a>
													</shiro:hasPermission>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
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
	<script src="resources/js/plugins/art-template/template.js"></script>
	<script src="resources/js/plugins/padding/bootstrap-paginator.min.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
	<script>
		function openCreateDeviceVenderWindow(){
			parent.layer.open({
                type: 2,
                title: '创建供应商',
                closeBtn: true,
                shade: [0.23],
                area: ['688px', '382px'],
                content: ['device/createVender.jspx', 'yes']
            });
		}
		function openChangeDeviceVenderWindow(venderId){
			parent.layer.open({
                type: 2,
                title: '修改供应商',
                closeBtn: true,
                shade: [0.23],
                area: ['688px', '382px'],
                content: ['device/updateVender.jspx?venderId='+venderId, 'yes']
            });
		}
		function openDeleteDeviceVenderWindow(venderId){
			parent.layer.open({
                type: 2,
                title: '删除供应商',
                closeBtn: true,
                shade: [0.23],
                area: ['348px', '312px'],
                content: ['device/deleteVender.jspx?venderId='+venderId, 'yes']
            });
		}
	</script>
</body>
</html>
