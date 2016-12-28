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
    <link href="resources/css/plugins/switchery/switchery.css" rel="stylesheet">
    <link href="resources/css/style.min.css?v=4.1.0" rel="stylesheet">
	<style type="text/css">.switchery{margin-left: 14px;}</style>
</head>

<body class="gray-bg">
	 <div class="wrapper wrapper-content animated fadeIn">
	 	<c:if test="${message!=null && !''.equals(message) }">
	    	<div id="alertMsgBox" class="alert alert-${status} alert-dismissable">
	            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
	            ${message }
	        </div>
			<script>setTimeout(function(){$("#alertMsgBox").alert('close')}, 1500);</script>
        </c:if>
        <c:if test="${'success'.equals(status) }">
        	<script>parent['warn_list'].location.reload();</script>
        </c:if>
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">
                <form method="post" action="warn/saveWarnItemAction.jspx" class="form-horizontal">
                	<input type="hidden" name="warnGroupId" value="${warnGroupId }"/>
                    <div class="form-group">
                   		<label class="col-sm-12 control-label">告警项</label>
                   </div>
                    <div class="form-group">
                        <div class="col-xs-4">
                        	<select class="form-control" name="itemName">
	                        	<option value="">选择监控项</option>
                            	<c:forEach items="${warnMonitorItems }" var="mItem">
                            		<option value="${mItem.itemName }" <c:if test="${mItem.itemName.equals(warnItem.itemName) }">selected</c:if>>${mItem.itemName }</option>
                           		</c:forEach>
                            </select>
                        </div>
                        <div class="col-xs-4">
                        	<select class="form-control" name="itemOperators">
	                        	<option value="">选择操作符</option>
                            	<option value="GT" <c:if test="${'GT'.equals(warnItem.itemOperators) }">selected</c:if>>当大于阀值</option>
                            	<option value="EQ" <c:if test="${'EQ'.equals(warnItem.itemOperators) }">selected</c:if>>当等于阀值</option>
                            	<option value="LT" <c:if test="${'LT'.equals(warnItem.itemOperators) }">selected</c:if>>当小于阀值</option>
                            </select>
                        </div>
                        <div class="col-xs-4">
                            <input type="text" name="itemThreshold" class="form-control" value="${warnItem.itemThreshold }" placeholder="输入监控阀值">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-2 control-label" style="margin-top:10px">告警编码</label>
                        <div class="col-xs-6">
                            <input type="text" name="warnCode" class="form-control" value="${warnItem.warnCode }">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-2 control-label" style="margin-top:10px">告警级别</label>
                        <div class="col-xs-6">
                        	<select class="form-control" name="warnLevel">
                            	<option value="">选择一个告警级别</option>
                            	<option value="一级" <c:if test="${'一级'.equals(warnItem.warnLevel) }">selected</c:if>>一级</option>
                            	<option value="二级" <c:if test="${'二级'.equals(warnItem.warnLevel) }">selected</c:if>>二级</option>
                            	<option value="三级" <c:if test="${'三级'.equals(warnItem.warnLevel) }">selected</c:if>>三级</option>
                            	<option value="四级" <c:if test="${'四级'.equals(warnItem.warnLevel) }">selected</c:if>>四级</option>
                            	<option value="通知" <c:if test="${'通知'.equals(warnItem.warnLevel) }">selected</c:if>>通知</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">短信通知</label>
                        <input type="checkbox" name="smsNotice" class="js-switch" <c:if test="${warnItem.smsNotice }">checked</c:if> />
                    </div>
                    <div class="form-group">
                        <div class="col-xs-6 text-center col-xs-offset-3">
                        	<button class="btn btn-primary btn-block" type="submit">新增</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="resources/js/jquery.min.js?v=2.1.4"></script>
    <script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="resources/js/content.min.js?v=1.0.0"></script>
    <script src="resources/js/plugins/switchery/switchery.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
	<script type="text/javascript">
		$(function(){
			new Switchery(document.querySelector(".js-switch"),{color:"#1AB394"});
		})
	</script>
</body>
</html>
