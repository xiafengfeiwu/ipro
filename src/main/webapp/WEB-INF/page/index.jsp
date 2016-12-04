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
<title>${systemInfo.systemTitle }</title>
<meta name="keywords" content="${systemInfo.systemKeywords }">
<meta name="description" content="${systemInfo.systemDescription }">
<link rel="shortcut icon" href="favicon.ico">
<link href="resources/css/bootstrap.min.css?v=3.3.6"
	rel="stylesheet">
<link href="resources/css/font-awesome.min.css?v=4.4.0"
	rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/style.min.css?v=4.1.0" rel="stylesheet">
</head>
<body class="fixed-sidebar full-height-layout gray-bg"
	style="overflow: hidden">
	<div id="wrapper">
		<!--左侧导航开始-->
		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="nav-close">
				<i class="fa fa-times-circle"></i>
			</div>
			<div class="sidebar-collapse">
				<ul class="nav" id="side-menu">
					<li class="nav-header">
						<div class="dropdown profile-element">
							<span>
								<img alt="image" class="img-circle" src="upload/20161204/805316298304126976.jpg" />
							</span> 
							<a data-toggle="dropdown" class="dropdown-toggle" href="javascript:;">
								<span class="clear">
									<span class="block m-t-xs"><strong class="font-bold">Si ZhongXia</strong></span>
									<span class="text-muted text-xs block">司仲夏<b class="caret"></b></span>
								</span>
							</a>
							<ul class="dropdown-menu animated fadeIn">
								<li onclick="layer.alert('修改头像')"><a href="javascript:;">修改头像</a></li>
								<li><a class="J_menuItem" href="javascript:;">联系我们</a></li>
								<li><a class="J_menuItem" href="javascript:;">信箱</a></li>
								<li class="divider"></li>
								<li><a href="javascript:;">安全退出</a></li>
							</ul>
						</div>
						<div class="logo-element">TX</div>
					</li>
					<jsp:include page="components/menus.jsp"></jsp:include>
				</ul>
			</div>
		</nav>
		<!--左侧导航结束-->
		<!--右侧部分开始-->
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
					<div class="navbar-header">
						<a class="navbar-minimalize minimalize-styl-2 btn btn-primary" href="javascript:;"><i class="fa fa-bars"></i></a>
					</div>
					<ul class="nav navbar-top-links navbar-right">
						<li class="dropdown"><a class="J_menuItem" href="develop/index"><i class="fa fa-cog"></i>开发</a></li>
						<li class="dropdown hidden-xs"><a class="right-sidebar-toggle" aria-expanded="false"><i class="fa fa-tasks"></i>主题</a></li>
					</ul>
				</nav>
			</div>
			<div class="row content-tabs">
				<button class="roll-nav roll-left J_tabLeft">
					<i class="fa fa-backward"></i>
				</button>
				<nav class="page-tabs J_menuTabs">
					<div class="page-tabs-content">
						<a href="javascript:;" class="active J_menuTab" data-id="resume">主页面</a>
					</div>
				</nav>
				<button class="roll-nav roll-right J_tabRight">
					<i class="fa fa-forward"></i>
				</button>
				<div class="btn-group roll-nav roll-right">
					<button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span></button>
					<ul role="menu" class="dropdown-menu dropdown-menu-right">
						<li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
						<li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
					</ul>
				</div>
				<a href="javascript:;" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
			</div>
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" data-id="resume" name="resume" width="100%" height="100%" src="resume" frameborder="0" data-id="default" seamless></iframe>
			</div>
			<div class="footer">
				<div class="pull-right">${systemInfo.systemCopyright }</div>
			</div>
		</div>
		<!--右侧部分结束-->
		<div id="right-sidebar">
			<div class="sidebar-container">
				<ul class="nav nav-tabs navs-3">
					<li class="active"><a data-toggle="tab" href="#tab-theme"><i
							class="fa fa-gear"></i> 主题</a></li>
				</ul>
				<div class="tab-content">
					<div id="tab-theme" class="tab-pane active">
						<div class="sidebar-title">
							<small>你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
						</div>
						<div class="skin-setttings">
							<div class="title">主题设置</div>
							<div class="setings-item">
								<span>收起左侧菜单</span>
								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="collapsemenu"
											class="onoffswitch-checkbox" id="collapsemenu" /> <label
											class="onoffswitch-label" for="collapsemenu"> <span
											class="onoffswitch-inner"></span> <span
											class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="setings-item">
								<span>固定顶部</span>
								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="fixednavbar"
											class="onoffswitch-checkbox" id="fixednavbar" /> <label
											class="onoffswitch-label" for="fixednavbar"> <span
											class="onoffswitch-inner"></span> <span
											class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="setings-item">
								<span> 固定宽度</span>
								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="boxedlayout"
											class="onoffswitch-checkbox" id="boxedlayout" /> <label
											class="onoffswitch-label" for="boxedlayout"> <span
											class="onoffswitch-inner"></span> <span
											class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="title">皮肤选择</div>
							<div class="setings-item default-skin nb">
								<span class="skin-name "><a href="javascript:;"
									class="s-skin-0"> 默认皮肤</a></span>
							</div>
							<div class="setings-item blue-skin nb">
								<span class="skin-name "><a href="javascript:;"
									class="s-skin-1">蓝色 主题</a></span>
							</div>
							<div class="setings-item yellow-skin nb">
								<span class="skin-name "> <a href="javascript:;"
									class="s-skin-3">黄/紫色 主题</a>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/js/plugins/layer/layer.min.js"></script>
	<script src="resources/js/hplus.min.js?v=4.1.0"></script>
	<script src="resources/js/contabs.min.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
</body>
</html>
