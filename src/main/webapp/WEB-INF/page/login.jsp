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
<title>登录</title>
<base
	href="<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath() + "/"%>" />
<link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<style>
body {
	background: #ebebeb;
	font-family: "microsoft yahei", arial, sans-serif;
	color: #222;
	font-size: 12px;
	padding: 0;
	margin: 0;
}

.top_div {
	background: rgb(100, 168, 83);
	width: 100%;
	height: 280px;
}

.ipt {
	border: 1px solid #d3d3d3;
	padding: 10px 10px;
	width: 290px;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
}

.ipt:focus {
	border-color: #66afe9;
	outline: 0;
}

.input-icon {
	width: 20px;
	height: 20px;
	display: block;
	position: absolute;
	left: 96px;
	background-repeat: no-repeat;
}

.user {
	top: 21px;
	background-image: url(resources/img/user.png);
}

.lock {
	top: 12px;
	background-image: url(resources/img/locked.png);
}

a {
	text-decoration: none;
}
</style>


</head>
<body>
	<div class="top_div"></div>
	<div
		style="background: rgb(255, 255, 255); margin: -140px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 460px; height: 340px; text-align: center;">
		<p style="padding: 30px 0px 0px; position: relative;">
			<img style="width: 228px; height: 80px; border: none"
				src="${systemInfo.systemLogoUrl }" />
		</p>
		<p style="padding: 10px 0px 10px; position: relative;">
			<span class="input-icon user"></span> <input id="username"
				style="padding-left: 37px;" class="ipt" type="text"
				placeholder="请输入登录名" value="">
		</p>
		<p style="position: relative; margin-bottom: 20px;">
			<span class="input-icon lock"></span> <input
				style="padding-left: 37px;" class="ipt" id="password"
				type="password" placeholder="请输入密码" value="">
		</p>
		<div
			style="height: 40px; line-height: 40px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid; text-align: center; padding-top: 16px">
			<button id="loginBtn" class="btn" style="padding: 7px 127px">
				登 录</button>
		</div>
	</div>
	<div style="width: 100%; text-align: center; padding-top: 10px;">
		<p>${systemInfo.systemTechnicalSupport }</p>
	</div>
	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/plugins/layer/layer.min.js"></script>
	<script>
		$(function() {
			$("#loginBtn").on("click", function() {
				var _this = this;
				$(_this).attr('disabled', "true");
				$.ajax({
					type : "GET",
					url : "loginAction.jspx",
					data : {
						username : $("#username").val(),
						password : $("#password").val()
					},
					success : function(data) {
						if (data.success) {
							loginSuccessCB();
						} else {
							loginFaileCB(data.message);
						}
						$(_this).removeAttr("disabled");
					},
					error : function() {
						layer.msg("登录失败");
					}
				});
			});
			var loginSuccessCB = function() {
				cleanForm();
				window.location.href = "index.jspx";
			}
			var loginFaileCB = function(msg) {
				layer.msg("登录失败：" + msg);
			}
			var cleanForm = function() {
				$("#username").val("");
				$("#password").val("");
			}
		})
		history.pushState(null, null, document.URL);
		window.addEventListener('popstate', function() {
			history.pushState(null, null, document.URL);
		});
	</script>
</body>
</html>