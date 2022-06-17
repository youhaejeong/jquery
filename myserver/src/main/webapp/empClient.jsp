<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>empClient.jsp</title>
</head>
<body>
	<div id="divList"></div>
	
	<script>
		$.ajax({
			url: "req",
			method: "post",
			async: false, 
			data : JSON.stringify({first_name:"gildong", last_name:"kim"}), // async 옵션을 통해 동기방식과 비동기방식 결정
			contentType : "json", // 보내는 파라미터가 json String임을 알려줌
			dataType : "json",
			success: function(result){
				console.log("결과는");
				console.log(result);
			}
		})
		console.log("요청");
	</script>
</body>
</html>