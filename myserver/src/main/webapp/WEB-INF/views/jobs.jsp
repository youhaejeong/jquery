<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
	$(function(){
		$("#accr").accordion({
			collapsible:true
		});
	})
</script>
<title>jobs.jsp</title>
</head>
<body>
<div id="accr">
<c:forEach items="${jobs}" var="list">
	<h3>${list.job_title }</h3>
	<div>
		<c:forEach items="${emp }" var="emp">
			<div>${emp.employee_id } : ${emp.first_name }</div>
		</c:forEach>
	</div>
</c:forEach>
</div>
</body>
</html>