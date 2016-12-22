<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<h5>用户列表</h5>
						<div class="ibox-tools">
							<a class="dropdown-toggle" data-toggle="dropdown"
								href="javascript:;"> <i class="fa fa-bars"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<shiro:hasPermission name="CreateUser">
									<li><a href="javascript:;" onclick="openCreateUserWindow()">
											<i class="fa fa-plus-square-o"></i> &nbsp; 新增用户
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
						<div class="row">
							<div class="col-sm-3">
								<div class="input-group">
									<input type="text" id="searchWord" placeholder="请输入关键词"
										class="input-sm form-control"> <span
										class="input-group-btn">
										<button type="button" id="searchBtn"
											class="btn btn-sm btn-primary">搜索</button>
									</span>
								</div>
							</div>
						</div>
						<div class="full-height-scroll">
							<div class="table-responsive">
								<table class="table table-striped table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>登录名</th>
											<th>显示名称</th>
											<th></th>
											<th>手机号</th>
											<th>禁用状态</th>
											<th>注册时间</th>
											<th class="text-center">操作</th>
										</tr>
									</thead>
									<tbody id="userListBox"></tbody>
									<tfoot>
										<tr>
											<td colspan="8" align="center"><ul id="pageTool"></ul></td>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script id="userTemp" type="text/html">
		{{each data as user i}}
			<tr>
				<td class="client-avatar"><img alt="image" src="{{user.userHeadPic}}"></td>
				<td>{{user.userLoginName}}</td>
				<td>{{user.userName}}</td>
				<td class="contact-type"><i class="fa fa-phone"></i></td>
				<td>{{user.userPhone}}</td>
				<td class="client-status">{{if user.userDisableStatus}}<span class="label label-danger">禁用</span> {{else}}<span class="label label-success">正常</span>{{/if}}</td>
				<td>{{user.userRegistTime | dateFormat:'yyyy-MM-dd hh:mm:ss'}}</td>
				<td class="text-center">
					<a class="label label-primary" href="javascript:;" onclick="openUserDetailWindow('{{user.userId}}')">详情</a> 
					<shiro:hasPermission name="ReSetUserPwd">
						<a class="label label-warning" href="javascript:;" onclick="resetUserPwWindow('{{user.userId}}')">重设密码</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="UpdateUser">
						<a class="label label-warning" href="javascript:;" onclick="resetUserStatusWindow('{{user.userId}}')">禁用/启用</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="UserRoleAuth">
						<a class="label label-warning" href="javascript:;" onclick="resetUserRoleWindow('{{user.userId}}')">更改角色</a>
					</shiro:hasPermission>
				</td>
			</tr>
		{{/each}}
	</script>
	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resources/js/content.min.js?v=1.0.0"></script>
    <script src="resources/js/plugins/layer/layer.min.js"></script>
	<script src="resources/js/plugins/art-template/template.js"></script>
	<script src="resources/js/plugins/padding/bootstrap-paginator.min.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
	<script>
		$(document).ready(function() {
			var currentPage = 1;
			var config = {
				reqUrl : "user/listData.jspx",
				listBoxId : "userListBox",
				tempId : "userTemp",
				tdColspan : 8
			}
			function loadData(page) {
				var layerLoadDialog = layer.load(0, {shade: false});
				$.ajax({
					type : "post",
					url : config.reqUrl,
					data : {
						page : page,
						searchWord : $("#searchWord").val(),
						length : 20,
						field : 'user_regist_time',
						order : 'desc'
					},
					success : function(data) {
						layer.close(layerLoadDialog);
						currentPage = data.reqPage.page;
						if (!data.success) {
							document.getElementById(config.listBoxId).innerHTML = '<tr><td colspan="' + config.tdColspan + '" align="center">无数据</td></tr>';
							document.getElementById('pageTool').innerHTML = '';
							return;
						}
						$('#pageTool').bootstrapPaginator({
							bootstrapMajorVersion : 3,
							currentPage : page,
							totalPages : data.totalPages,
							numberOfPages : 5,
							onPageClicked : function(e, originalEvent, type, page) {
							},
							onPageChanged : function(e, oldPage, newPage) {
								if (currentPage != newPage) {
									loadData(newPage);
								}
							}
						});
						template.helper("dateFormat", dateFormat);
						document.getElementById(config.listBoxId).innerHTML = template(config.tempId, data);
					}
				});
			}
			loadData(currentPage);
			$("#searchBtn").on("click", function() {
				loadData(1);
			})
		});
		function openCreateUserWindow() {
			parent.layer.open({
				type : 2,
				title : '新增用户',
				closeBtn : true,
				resize : true,
				shade : [ 0.23 ],
				area : [ '368px', '442px' ],
				content : [ 'user/create.jspx', 'yes' ]
			});
		}
		function openUserDetailWindow(userId) {
			parent.layer.open({
				type : 2,
				title : '用户详情',
				closeBtn : true,
				resize : true,
				shade : [ 0.23 ],
				area : [ '368px', '420px' ],
				content : [ 'user/detail.jspx?userId=' + userId, 'yes' ]
			});
		}
		function resetUserPwWindow(userId) {
			parent.layer.open({
				type : 2,
				title : '重设用户密码',
				closeBtn : true,
				resize : true,
				shade : [ 0.23 ],
				area : [ '368px', '262px' ],
				content : [ 'user/resetUserPw.jspx?userId=' + userId, 'yes' ]
			});
		}
		function resetUserStatusWindow(userId) {
			parent.layer.open({
				type : 2,
				title : '重设用户账号状态',
				closeBtn : true,
				resize : true,
				shade : [ 0.23 ],
				area : [ '368px', '262px' ],
				content : [ 'user/resetUserStatus.jspx?userId=' + userId, 'yes' ]
			});
		}
		function resetUserRoleWindow(userId) {
			parent.layer.open({
				type : 2,
				title : '重设用户角色',
				closeBtn : true,
				resize : true,
				shade : [ 0.23 ],
				area : [ '368px', '262px' ],
				content : [ 'user/resetUserRole.jspx?userId=' + userId, 'yes' ]
			});
		}
	</script>
</body>
</html>
