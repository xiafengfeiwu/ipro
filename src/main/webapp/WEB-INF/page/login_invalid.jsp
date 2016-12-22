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
<title>正在跳入登录页面...</title>
<base
	href="<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath() + "/"%>" />
	<link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resources/css/animate.min.css" rel="stylesheet">
    <link href="resources/css/style.min.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content">
	<p>未登录或登录超时，请登陆。 [<span id="miao" class="feadIn">3</span>s 后<a href="javascript:;" id="skip">跳转</a>]</p>
	</div>
	<script>
	var s=3;var miao=window.document.getElementById("miao");var skip=window.document.getElementById("skip");var si=setInterval(function(){s--;miao.innerHTML=s;if(s==0){window.clearInterval(si);window.parent.location.href="login.jspx"}},1000);skip.onclick=function(){window.clearInterval(si);window.parent.location.href="login.jspx"};history.pushState(null,null,document.URL);window.addEventListener("popstate",function(){history.pushState(null,null,document.URL)});
	</script>
</body>
</html>