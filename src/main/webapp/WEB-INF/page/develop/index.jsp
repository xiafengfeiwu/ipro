<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="title" content="HTML侧边栏Tab选项卡-彭亚欧个人博客代码中心" />
<meta name="keywords" content="HTML侧边栏Tab选项卡,HTML选项卡实现,Jq选项卡,CSS选项卡" />
<meta name="description" content="HTML+CSS+JQ实现的简单侧边啦选项卡。" />
<title>HTML侧边栏Tab选项卡-彭亚欧个人博客代码中心</title>
<style type="text/css">
body {
	background-color: #efefef;
}
#TabMain {
	width: 800px;
	height: 500px;
	margin: 0 auto;
	margin-top: 100px;
}
.tabItemContainer {
	width: 100px;
	height: 500px;
	float: left;
}
.tabBodyContainer {
	width: 677px;
	height: 500px;
	float: left;
	background-color: #fff;
	border: 1px solid #ccc;
	-webkit-border-radius: 0 5px 5px 0;
	-moz-border-radius: 0 5px 5px 0;
	border-radius: 0 5px 5px 0;
	margin-left: 1px;
}
.tabItemContainer>li {
	list-style: none;
	text-align: center;
}
.tabItemContainer>li>a {
	float: left;
	width: 100%;
	padding: 30px 0 30px 0;
	font: 16px "微软雅黑", Arial, Helvetica, sans-serif;
	color: #808080;
	cursor: pointer;
	text-decoration: none;
	border:1px solid transparent;
}
.tabItemCurrent {
	background-color: #fff;
	border: 1px solid #ccc !important;
	border-right: 1px solid #fff !important;
	position: relative;
	-webkit-border-radius: 5px 0 0 5px;
	-moz-border-radius: 5px 0 0 5px;
	border-radius: 5px 0 0 5px;
}
.tabItemContainer>li>a:hover {
	color: #333;
}
.tabBodyItem {
	position: absolute;
	width: 677px;
	height: 500px;
	display: none;
}
.tabBodyItem>p {
	font: 13px "微软雅黑", Arial, Helvetica, sans-serif;
	text-align: center;
	margin-top: 30px;
}
.tabBodyItem>p>a {
	text-decoration: none;
	color: #0F3;
}
.tabBodyCurrent{
	display:block;
}
</style>
</head>

<body>
<div id="TabMain">
	<div class="tabItemContainer">
		<li><a class="tabItemCurrent">选项卡1</a></li>
		<li><a>选项卡2</a></li>
		<li><a>选项卡3</a></li>
		<li><a>选项卡4</a></li>
		<li><a>选项卡5</a></li>
	</div>
	<div class="tabBodyContainer">
		<div class="tabBodyItem tabBodyCurrent">
			<p>我是Tab选项卡1的内容</p>
			<p>使用简单，引入css和Jq代码即可</p>
		</div>
		<div class="tabBodyItem">
			<p>我是Tab选项卡2的内容</p>
			<p></p>
		</div>
		<div class="tabBodyItem">
			<p>我是Tab选项卡3的内容</p>
			<p></p>
		</div>
		<div class="tabBodyItem">
			<p>我是Tab选项卡4的内容</p>
			<p></p>
		</div>
		<div class="tabBodyItem">
			<p>我是Tab选项卡5的内容</p>
			<p></p>
		</div>
	</div>
</div>

</body>
<script type="text/javascript" src="//cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
	SidebarTabHandler.Init();
});
var SidebarTabHandler={
	Init:function(){
		$(".tabItemContainer>li").click(function(){
			$(".tabItemContainer>li>a").removeClass("tabItemCurrent");
			$(".tabBodyItem").removeClass("tabBodyCurrent");
			$(this).find("a").addClass("tabItemCurrent");
			$($(".tabBodyItem")[$(this).index()]).addClass("tabBodyCurrent");
		});
	}
}
</script>
</html>