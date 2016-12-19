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
		<div class="row">
			<c:forEach items="${data}" var="map">
				<div class="col-xs-6">
					<h4>${map.key }</h4>
					<c:forEach items="${map.value}" var="val">
						<form action="role/authorizeAction.jspx">
							<input type="hidden" name="roleId" value="${roleId }">
							<input type="hidden" name="jurisdictionId" value="${val.jurisdictionId }"> &nbsp;&nbsp;&nbsp;&nbsp; 
							<button type="submit" class="btn btn-w-m btn-link"><span style="display:-moz-inline-box;display:inline-block;width:24px; "><i class="fa ${val.hasJurisdiction }"></i></span> ${val.jurisdictionName }（${val.jurisdictionDescript }）</button>
						</form>
					</c:forEach>
					<div class="hr-line-dashed"></div>
			</div>
			</c:forEach>
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
