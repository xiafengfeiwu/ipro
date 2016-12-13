<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>企业管理</h5>
                    </div>
                    <div class="ibox-content">
                        <form method="get" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">企业LOGO</label>
                                <div class="col-sm-10">
                                    <img alt="image" class="img-circle" src="resources/img/default_head_124x124.png" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">系统名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" value="网站名称">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">系统简称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" value="TX">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">技术支持</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" value="夏风飞舞（司仲夏） 技术支持">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" type="button">保存内容</button>
                                </div>
                            </div>
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
</body>
</html>
