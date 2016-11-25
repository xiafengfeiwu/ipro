<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WebSocket</title>
</head>
<body>
	<script type="text/javascript">
		var socket = new WebSocket('ws://127.0.0.1/ipro/websocket');
		//打开Socket 
		socket.onopen = function(event) {
			// 发送一个初始化消息
			socket.send('I am the client and I\'m listening!');
			// 监听消息
			socket.onmessage = function(event) {
				console.log('Client received a message', event);
			};
			// 监听Socket的关闭
			socket.onclose = function(event) {
				console.log('Client notified socket has closed', event);
			};
			// 关闭Socket.... 
			//socket.close()
		};
	</script>
</body>
</html>