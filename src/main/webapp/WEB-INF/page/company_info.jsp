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
        <div class="row">
            <div class="col-sm-8  col-sm-offset-2">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>系统信息 &nbsp; <small>(最后修改于：<fmt:formatDate value="${webSystem.systemModifyTime }" pattern="yyyy年MM月dd日 HH:mm" />)</small></h5>
                        <div class="ibox-tools">
							<a class="dropdown-toggle" data-toggle="dropdown" href="javascript:;"> <i class="fa fa-bars"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="javascript:;" onclick="window.location.reload()"> <i class="fa fa-refresh"></i> &nbsp; 刷新页面</a></li>
							</ul>
						</div>
                    </div>
                    <div class="ibox-content">
                    	<c:if test="${message!=null && !''.equals(message) }">
					    	<div id="alertMsgBox" class="alert alert-${status} alert-dismissable">
					            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
					            ${message }
					        </div>
							<script>setTimeout(function(){$("#alertMsgBox").alert('close')}, 1500)</script>
				        </c:if>
                        <form action="company/updateAction.jspx" method="post" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">企业LOGO</label>
                                <div class="col-sm-10">
                                    <img alt="系统LOGO" style="width:228px; height:80px;cursor: pointer;" <shiro:hasPermission name="UpdateCompany">onclick="openUpdateSystemLogoWindow()"</shiro:hasPermission> src="${webSystem.systemLogoUrl }" />
                                    <shiro:hasPermission name="UpdateCompany">
                                    	<span class="help-block m-b-none">点击图片，上传新LOGO。（建议图片尺寸：228px × 80px）</span>
                                    </shiro:hasPermission>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">系统名称</label>
                                <div class="col-sm-10">
                                    <input type="text" name="systemTitle" <shiro:lacksPermission name="UpdateCompany">readonly</shiro:lacksPermission> class="form-control" value="${webSystem.systemTitle }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">系统简称</label>
                                <div class="col-sm-10">
                                    <input type="text" name="systemJianPin" <shiro:lacksPermission name="UpdateCompany">readonly</shiro:lacksPermission> class="form-control" value="${webSystem.systemJianPin }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">技术支持</label>
                                <div class="col-sm-10">
                                    <input type="text" name="systemTechnicalSupport" <shiro:lacksPermission name="UpdateCompany">readonly</shiro:lacksPermission> class="form-control" value="${webSystem.systemTechnicalSupport }">
                                </div>
                            </div>
                            <shiro:hasPermission name="UpdateCompany">
	                            <div class="hr-line-dashed"></div>
	                            <div class="form-group">
	                                <div class="col-sm-4 col-sm-offset-2">
	                                    <button class="btn btn-primary" type="submit">修改内容</button>
	                                </div>
	                            </div>
                            </shiro:hasPermission>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="resources/js/jquery.min.js?v=2.1.4"></script>
    <script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="resources/js/content.min.js?v=1.0.0"></script>
    <script src="resources/js/plugins/iCheck/icheck.min.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
	<script>
		function openUpdateSystemLogoWindow(){
			parent.layer.open({
                type: 2,
                title: '更改系统LOGO',
                closeBtn: true,
                resize: true,
                shade: [0.23],
                area: ['348px', '452px'],
                content: ['company/uploadLogo.jspx', 'yes']
            });
		}
	</script>
</body>
</html>
