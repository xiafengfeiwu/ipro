<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	 	<c:if test="${message!=null && !''.equals(message) }">
	    	<div id="alertMsgBox" class="alert alert-${status} alert-dismissable">
	            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
	            ${message }
	        </div>
			<script>setTimeout(function(){$("#alertMsgBox").alert('close')}, 1500)</script>
        </c:if>
        <c:if test="${\"success\".equals(status) }">
        	<script>parent['role_list'].location.reload();</script>
        </c:if>
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">
                <form method="post" action="role/updateAction.jspx" class="form-horizontal">
                	<input type="hidden" name="roleId" class="form-control" value="${role.roleId }">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">角色名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="roleName" class="form-control" value="${role.roleName }">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12 text-center">
                        	<button class="btn btn-primary" type="submit">更改</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="resources/js/jquery.min.js?v=2.1.4"></script>
    <script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="resources/js/content.min.js?v=1.0.0"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
</body>
</html>
