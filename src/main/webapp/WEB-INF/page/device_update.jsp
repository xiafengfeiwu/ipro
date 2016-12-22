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
        <c:if test="${'success'.equals(status) }">
        	<script>parent['device_list'].location.reload();</script>
        </c:if>
        <div class="row">
            <div class="col-sm-12">
                <form method="post" action="device/updateAction.jspx" class="form-horizontal">
                	<input type="hidden" name="deviceId" value="${device.deviceId }">
                	<div class="row">
	                    <div class="form-group col-xs-6">
	                        <label class="col-sm-2 control-label">设备供应商</label>
	                        <div class="col-sm-10">
	                            <select class="form-control" name="deviceVenderCode">
	                            	<option value="">选择一个供应商</option>
	                            	<c:forEach items="${venders }" var="vender">
	                            		<option value="${vender.venderCode }" <c:if test="${vender.venderCode.equals(device.deviceVenderCode) }">selected</c:if>>${vender.venderName } （${vender.venderCode }）</option>
	                            	</c:forEach>
	                            </select>
	                            <span class="help-block m-b-none pull-right">未找到？请先创建供应商。</span>
	                        </div>
	                    </div>
	                    <div class="form-group col-xs-6">
	                        <label class="col-sm-2 control-label">设备类型</label>
	                        <div class="col-sm-10">
	                            <select class="form-control" name="deviceType">
	                            	<option value="">选择一个类型</option>
	                            	<option value="AL-CJ" <c:if test="${'AL-CJ'.equals(device.deviceType) }">selected</c:if>>AL-采集器</option>
	                            	<option value="AL-D-CJ" <c:if test="${'AL-D-CJ'.equals(device.deviceType) }">selected</c:if>>AL-单点采集器</option>
	                            	<option value="AL-JZ" <c:if test="${'AL-JZ'.equals(device.deviceType) }">selected</c:if>>AL-集中器</option>
	                            </select>
	                            <span class="help-block m-b-none pull-right">&nbsp;</span>
	                        </div>
	                    </div>
	                    <div class="form-group col-xs-6">
	                        <label class="col-sm-2 control-label">设备名称</label>
	                        <div class="col-sm-10">
	                            <input type="text" name="deviceName" class="form-control" value="${device.deviceName }">
	                        </div>
	                    </div>
	                    <div class="form-group col-xs-6">
	                        <label class="col-sm-2 control-label">设备序列号</label>
	                        <div class="col-sm-10">
	                            <input type="text" name="deviceSn" class="form-control" value="${device.deviceSn }">
	                        </div>
	                    </div>
	                    <div class="form-group col-xs-6">
	                        <label class="col-sm-2 control-label">设备规格型号</label>
	                        <div class="col-sm-10">
	                            <input type="text" name="deviceModel" class="form-control" value="${device.deviceModel }">
	                        </div>
	                    </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12 text-center">
                        	<button class="btn btn-primary" type="submit">修改</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="resources/js/jquery.min.js?v=2.1.4"></script>
    <script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="resources/js/content.min.js?v=1.0.0"></script>
	<script src="resources/js/masonry.pkgd.min.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
	<script>
        $(document).ready(function(){
        	$('.row').masonry({itemSelector: '.col-xs-6'});
        });
    </script>
</body>
</html>
