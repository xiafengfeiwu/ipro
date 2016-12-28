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
						<h5>告警组列表</h5>
						<div class="ibox-tools">
							<a class="dropdown-toggle" data-toggle="dropdown" href="javascript:;"> <i class="fa fa-bars"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<shiro:hasPermission name="CreateWarnGroup">
									<li><a href="javascript:;" onclick="openCreateWarnGroupWindow()"> <i class="fa fa-plus-square-o"></i> &nbsp;  新增告警组</a></li>
								</shiro:hasPermission>
								<li><a href="javascript:;" onclick="window.location.reload()"> <i class="fa fa-refresh"></i> &nbsp; 刷新列表</a></li>
							</ul>
						</div>
					</div>
					<div class="ibox-content">
						<table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
									<th>告警组名称</th>
									<th>告警组描述</th>
									<th>创建时间</th>
									<th class="text-center">操作</th>
                                </tr>
                            </thead>
							<tbody>
								<c:forEach items="${warnGroups}" varStatus="vs" var="warnGroup">
									<tr>
										<td>${vs.index+1 }</td>
										<td>${warnGroup.groupName }</td>
										<td>${warnGroup.groupDescript }</td>
										<td><fmt:formatDate value="${warnGroup.createTime}" pattern="yyyy-MM-dd HH:mm" /></td>
										<td class="text-center">
											<a class="label label-info" href="javascript:;" onclick="openWarnGroupItemsWindow('${warnGroup.groupId}')">告警项</a>
											<c:if test="${!role.systemRole }">
												<shiro:hasPermission name="UpdateWarnGroup">
													<a class="label label-warning" href="javascript:;" onclick="openChangeWarnGroupWindow('${warnGroup.groupId}')">修改</a>
												</shiro:hasPermission>
												<shiro:hasPermission name="DeleteWarnGroup">
													<a class="label label-danger" href="javascript:;" onclick="openDeleteWarnGroupWindow('${warnGroup.groupId}')">删除</a>
												</shiro:hasPermission>
											</c:if>
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
	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resources/js/content.min.js?v=1.0.0"></script>
    <script src="resources/js/plugins/layer/layer.min.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
	<script>
		function openCreateWarnGroupWindow(){
			parent.layer.open({
                type: 2,
                title: '新增告警组',
                closeBtn: true,
                shade: [0.23],
                area: ['368px', '342px'],
                content: ['warn/createGroup.jspx', 'yes']
            });
		}
		function openChangeWarnGroupWindow(warnGroupId){
			parent.layer.open({
                type: 2,
                title: '修改告警组',
                closeBtn: true,
                shade: [0.23],
                area: ['368px', '342px'],
                content: ['warn/updateGroup.jspx?warnGroupId=' + warnGroupId, 'yes']
            });
		}
		function openDeleteWarnGroupWindow(warnGroupId){
			parent.layer.open({
                type: 2,
                title: '确认删除告警组',
                closeBtn: true,
                shade: [0.23],
                area: ['348px', '312px'],
                content: ['warn/deleteGroup.jspx?warnGroupId=' + warnGroupId, 'yes']
            });
		}
        function openWarnGroupItemsWindow(warnGroupId){
        	parent.layer.open({
                type: 2,
                title: '告警项列表',
                closeBtn: true,
                resize: true,
                shade: [0.23],
                area: ['828px', '448px'],
                content: ['warn/groupItemList.jspx?warnGroupId=' + warnGroupId, 'yes']
            });
        }
    </script>
</body>
</html>