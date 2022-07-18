<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Testing websockets</title>
</head>
<body>
	${userid}님 로그인
	<span id="eventDiv"></span>
	<fieldset>
		<textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
		<br /> <input id="inputMessage" type="text" /> <input type="submit"
			value="send" onclick="send()" />
	</fieldset>
</body>
<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket(
			'ws://192.168.0.15/myserver/BroadcastingServer.do');
	var inputMessage = document.getElementById('inputMessage');
	webSocket.onerror = function(event) {
		onError(event)
	};

	webSocket.onopen = function(event) {
		onOpen(event)
	};

	webSocket.onmessage = function(event) {
		onMessage(event)
	};

	function onMessage(event) {
		msgvo = JSON.parse(event.data);
		if (msgvo.cmd == "event") {
			eventDiv.innerHTML = msgvo.msg;
		} else if (msgvo.cmd == "msg") {
			textarea.value += msgvo.id + ": " + msgvo.msg + "\n";
		}
	}

	function onOpen(event) {
		textarea.value += "연결 성공\n";
	}

	function onError(event) {
		alert(event.data);
	}

	function send() {
		textarea.value += "나 : " + inputMessage.value + "\n";
		var obj = {};
		obj.id = "${userid}";
		obj.cmd = "msg";
		obj.msg = inputMessage.value;

		webSocket.send(JSON.stringify(obj));
		inputMessage.value = "";
	}
</script>
</html>