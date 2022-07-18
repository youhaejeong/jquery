<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>el</h4>
<fmt:parseDate value="2020-07-07 10:25" pattern="yyyy-MM-dd hh:mm" var="dt"/>
<fmt:formatDate value="${dt}" pattern="MM-dd"/>
<c:set var="arr" value="<%=Arrays.asList(\"바나나\",\"사과\") %>"/>

배엵크기:${fn:length(arr) }<br>
포함여부:${fn:contains(arr,"바나나") }<br>

<ul>
<li><%=request.getParameter("id") %></li>
<li>${param.id }</li>
<li><%=request.getHeader("user-agent") %></li>
<li>${header["user-agent"] }</li>
<li><%=request.getHeader("referer") %></li>
<li>${header["referer"] }</li>
<li><%=request.getAttribute("userid") %></li>
<li>${requestScope.userid }</li>
<li><%=session.getAttribute("userid") %></li>
<li>${sessionScope.userid }</li>
<li><%=request.getRequestURI() %></li>
<li>${pageContext.request.requestURI }</li>
<li>${pageContext.request.getRequestURI() }</li>
</ul>




</body>
</html>