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
	 <div class="wrapper wrapper-content animated fadeIn">
        <c:if test="${device==null }">
        	<p>无效的设备</p>
        </c:if>
        <c:if test="${device!=null }">
	        <div class="row">
	            <div class="col-xs-6">
	            	<p><label class="control-label" style="display:-moz-inline-box;display:inline-block;width:120px;text-align: right; ">设备名称：</label> ${device.deviceName }</p>
	            	<p><label class="control-label" style="display:-moz-inline-box;display:inline-block;width:120px;text-align: right; ">设备SN：</label> ${device.deviceSn }</p>
	            	<p><label class="control-label" style="display:-moz-inline-box;display:inline-block;width:120px;text-align: right; ">设备类型：</label> ${device.deviceType }</p>
	            	<p><label class="control-label" style="display:-moz-inline-box;display:inline-block;width:120px;text-align: right; ">设备规格型号：</label> ${device.deviceModel }</p>
	            </div>
	            <div class="col-xs-6">
	            	<p><label class="control-label" style="display:-moz-inline-box;display:inline-block;width:120px;text-align: right; ">设备供应商：</label> ${deviceVender.venderName} (${device.deviceVenderCode })</p>
	            	<p><label class="control-label" style="display:-moz-inline-box;display:inline-block;width:120px;text-align: right; ">供应商联系人：</label> ${deviceVender.venderContacts }</p>
	            	<p><label class="control-label" style="display:-moz-inline-box;display:inline-block;width:120px;text-align: right; ">供应商联系电话：</label> ${deviceVender.venderContactsTel }</p>
	            	<p><label class="control-label" style="display:-moz-inline-box;display:inline-block;width:120px;text-align: right; ">设备创建时间：</label> <fmt:formatDate value="${device.createTime}" pattern="yyyy年MM月dd日 HH:mm" /></p>
	            	<p><label class="control-label" style="display:-moz-inline-box;display:inline-block;width:120px;text-align: right; ">设备最后修改时间：</label> <fmt:formatDate value="${device.modifyTime}" pattern="yyyy年MM月dd日 HH:mm" /></p>
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
