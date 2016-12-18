<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
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
								<li><a href="javascript:;" onclick="openCreateRoleWindow()">新增角色</a></li>
								<li><a href="javascript:;" onclick="window.location.reload()">刷新列表</a></li>
							</ul>
						</div>
					</div>
					<div class="ibox-content">
						<table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
									<th>角色名称</th>
									<th>系统角色</th>
									<th>创建时间</th>
									<th>修改时间</th>
									<th>操作</th>
                                </tr>
                            </thead>
							<tbody>
								<c:forEach items="${roles}" varStatus="vs" var="role">
									<tr>
										<td>${vs.index+1 }</td>
										<td>${role.roleName }</td>
										<td><c:if test="${role.systemRole }"><i class="glyphicon glyphicon-ok"></i></c:if></td>
										<td><fmt:formatDate value="${role.roleCreateTime}" pattern="yyyy-MM-dd HH:mm" /></td>
										<td><fmt:formatDate value="${role.roleModifyTime}" pattern="yyyy-MM-dd HH:mm" /></td>
										<td><a href="javascript:;" onclick="openRoleAuthWindow()">授权</a><c:if test="${!role.systemRole }"> | <a href="javascript:;" onclick="openChangeRoleWindow('${role.roleId }')">修改</a> | <a href="javascript:;" onclick="openDeleteRoleWindow('${role.roleId }')">删除</a></c:if></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resources/js/content.min.js?v=1.0.0"></script>
    <script src="resources/js/plugins/layer/layer.min.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
	<script>
		function openCreateRoleWindow(){
			parent.layer.open({
                type: 2,
                title: '新增角色',
                closeBtn: true,
                shade: [0.23],
                area: ['348px', '312px'],
                content: ['role/create.jspx', 'yes']
            });
		}
		function openChangeRoleWindow(roleId){
			parent.layer.open({
                type: 2,
                title: '修改角色',
                closeBtn: true,
                shade: [0.23],
                area: ['348px', '312px'],
                content: ['role/change.jspx?roleId=' + roleId, 'yes']
            });
		}
		function openDeleteRoleWindow(roleId){
			parent.layer.open({
                type: 2,
                title: '确认删除角色',
                closeBtn: true,
                shade: [0.23],
                area: ['348px', '312px'],
                content: ['role/delete.jspx?roleId=' + roleId, 'yes']
            });
		}
        function openRoleAuthWindow(){
        	parent.layer.open({
                type: 2,
                title: '角色授权',
                closeBtn: true,
                shade: [0.23],
                area: ['90%', '90%'],
                content: ['develop/role/authorize.jspx', 'no'], //iframe的url，no代表不显示滚动条
            });
        }
    </script>
</body>
</html>