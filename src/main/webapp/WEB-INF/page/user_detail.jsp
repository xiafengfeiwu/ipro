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
	 <div class="wrapper wrapper-content animated fadeIn">
        <c:if test="${user==null }">
        	<p>无效的用户</p>
        </c:if>
        <c:if test="${user!=null }">
	        <div class="row">
	            <div class="col-sm-12">
	            	<img class="img-circle" style="float: right;" alt="用户头像" src="${user.userPortraitPath }"/>
	            	<p><label class="control-label">用户名称：</label> ${user.userName }</p>
	            	<p><label class="control-label">用户角色：</label> ${roleName }</p>
	            	<p><label class="control-label">登录帐号：</label> ${user.userLoginName }</p>
	            	<p><label class="control-label">帐号状态：</label> <c:if test="${user.userDisableStatus }"><span class="label label-danger">禁用</span></c:if><c:if test="${!user.userDisableStatus }"><span class="label label-success">正常</span></c:if></p>
	            	<p><label class="control-label">手机号码：</label> ${user.userPhone }</p>
	            	<p><label class="control-label">微信绑定：</label> <c:if test="${user.userWxOpenId==null }">未绑定</c:if><c:if test="${user.userWxOpenId!=null }">已绑定</c:if></p>
	            	<p><label class="control-label">注册时间：</label> <fmt:formatDate value="${user.userRegistTime}" pattern="yyyy年MM月dd日 HH:mm" /></p>
	            	<p><label class="control-label">修改时间：</label> <fmt:formatDate value="${user.userModifyTime}" pattern="yyyy年MM月dd日 HH:mm" /></p>
	            	<shiro:hasPermission name="DeleteUser">
		            	<c:if test="${showDelBtn }">
	            			<form action="user/delete.jspx" method="post"><input type="hidden" name="userId" value="${user.userId }"/><p><button type="submit" class="btn btn-danger btn-block">删除用户</button></p></form>
		            	</c:if>
		            	<c:if test="${!showDelBtn }">
		            		<p class="text-center"><i class="fa fa-info-circle"></i> 暂不允许删除管理员角色的用户</p>
		            	</c:if>
	            	</shiro:hasPermission>
	            </div>
	        </div>
        </c:if>
    </div>
    <script src="resources/js/jquery.min.js?v=2.1.4"></script>
    <script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="resources/js/content.min.js?v=1.0.0"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
</body>
</html>
