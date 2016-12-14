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
	<style>
		.autocomplete-suggestions { -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; border: 1px solid #999; background: #FFF; cursor: default; overflow: auto; -webkit-box-shadow: 1px 4px 3px rgba(50, 50, 50, 0.64); -moz-box-shadow: 1px 4px 3px rgba(50, 50, 50, 0.64); box-shadow: 1px 4px 3px rgba(50, 50, 50, 0.64); }
		.autocomplete-suggestion { padding: 2px 5px; white-space: nowrap; overflow: hidden; }
		.autocomplete-no-suggestion { padding: 2px 5px;}
		.autocomplete-selected { background: #F0F0F0; }
		.autocomplete-suggestions strong { font-weight: bold; color: #000; }
		.autocomplete-group { padding: 2px 5px; }
		.autocomplete-group strong { font-weight: bold; font-size: 16px; color: #000; display: block; border-bottom: 1px solid #000; }
	</style>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeIn">
    	
            <input type="text" name="country" id="autocomplete-ajax"/>
    	
    </div>
    <script src="resources/js/jquery.min.js?v=2.1.4"></script>
    <script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="resources/js/content.min.js?v=1.0.0"></script>
	<script src="resources/js/jquery.autocomplete.min.js"></script>
    <script src="resources/js/plugins/iCheck/icheck.min.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
	<script>
		$('#autocomplete-ajax').autocomplete({
	        serviceUrl: 'data/findUserTop5.jspx',
	        onSelect: function(suggestion) {
	            console.info('You selected: ' + suggestion.value + ', ' + suggestion.data);
	        },
	        onInvalidateSelection: function() {
	           	$(this).val("");
	        }
	    });
	</script>
</body>
</html>
