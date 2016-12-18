<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<base href="<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"%>" />
    <link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resources/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="resources/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="resources/css/animate.min.css" rel="stylesheet">
    <link href="resources/css/style.min.css?v=4.1.0" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
	    <div class="row">
	        <div class="col-sm-10 col-sm-offset-1">
	            <div class="wrapper wrapper-content animated fadeInUp">
	                <div class="ibox">
	                    <div class="ibox-content">
	                    	<div class="row">
	                            <div class="col-sm-12">
	                                <div class="m-b-md">
	                                	<div class="btn-group pull-right">
		                                    <a href="JavaScript:;" class="btn btn-white btn-xs" onclick="openChangeSelfInfoWindow()">更新信息</a>
		                                    <a href="JavaScript:;" class="btn btn-white btn-xs" onclick="openChangeSelfPwdWindow()">更新密码</a>
		                                    <a href="JavaScript:;" class="btn btn-white btn-xs" onclick="openChangeSelfHeadPicWindow()">上传头像</a>
	                                    </div>
	                                    <img id="parentHeadImageBox" class="img-circle"  src="${user.userPortraitPath }">
	                                </div>
	                            </div>
	                        </div>
	                        
	                        <div class="row">
	                            <div class="col-sm-6">
                                    <p>用户名称：${user.userName}</p>
                                    <p>联系方式：${user.userPhone}</p>
                                    <p>登录账号：${user.userLoginName}</p>
                                    <p>用户角色：${userRole}</p>
	                            </div>
	                            <div class="col-sm-6">
                                    <p>注册于：<fmt:formatDate value="${user.userRegistTime}" pattern="yyyy年MM月dd日 HH:mm" /></p>
                                    <p>更新于：<fmt:formatDate value="${user.userModifyTime}" pattern="yyyy年MM月dd日 HH:mm" /></p>
	                            </div>
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
	<script src="resources/js/plugins/pace/pace.min.js"></script>
	<script type="text/javascript">
	function openChangeSelfInfoWindow(){
    	parent.layer.open({
            type: 2,
            title: '修改个人信息',
            closeBtn: true,
            shade: [0.23],
            area: ['348px', '452px'],
            content: ['user/changeSelf.jspx', 'yes']
        });
    }
	function openChangeSelfPwdWindow(){
		parent.layer.open({
            type: 2,
            title: '修改个人密码',
            closeBtn: true,
            shade: [0.23],
            area: ['348px', '452px'],
            content: ['user/changeSelfPwd.jspx', 'yes']
        });
	}
	function openChangeSelfHeadPicWindow(){
		parent.layer.open({
            type: 2,
            title: '上传个人头像',
            closeBtn: true,
            shade: [0.23],
            area: ['348px', '452px'],
            content: ['user/changeSelfHeadPic.jspx', 'yes']
        });
	}
	</script>
</body>
</html>
