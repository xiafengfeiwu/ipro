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
	<base href="<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"%>" />
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
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>项目</h5>
                    </div>
                    <div class="ibox-content">
                        <div class="dd" id="nestable">
                            <ol class="dd-list">
                                <li class="dd-item" data-id="1">
                                    <div class="dd-handle"><a href="javascript:;" onclick="openWindow()">项目1</a> <span class="pull-right">2016-12-13</span></div>
                                </li>
                                <li class="dd-item" data-id="2">
                                    <div class="dd-handle"><a href="javascript:;" onclick="openWindow()">项目2</a> <span class="pull-right">2016-12-13</span></div>
                                    <ol class="dd-list">
                                        <li class="dd-item" data-id="3">
                                            <div class="dd-handle"><a href="javascript:;" onclick="openWindow()">项目3</a> <span class="pull-right">2016-12-13</span></div>
                                              <ol class="dd-list">
		                                        <li class="dd-item" data-id="4">
		                                            <div class="dd-handle"><a href="javascript:;" onclick="openWindow()">项目4</a> <span class="pull-right">2016-12-13</span></div>
		                                        </li>
			                                  </ol>
                                        </li>
                                    </ol>
                                </li>
                            </ol>
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
    <script src="resources/js/plugins/iCheck/icheck.min.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
	<script type="text/javascript">
	function openWindow(){
    	parent.layer.open({
            type: 2,
            title: '项目',
            closeBtn: true,
            shade: [0.23],
            area: ['90%', '90%'],
            content: ['develop/subject/detail.jspx', 'yes']
        });
    }
	</script>
</body>
</html>