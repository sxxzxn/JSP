<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포워드된타이틀</title>
</head>
<body>


<h2>forward  결과 페이지</h2>

<ul>
	<li>페이지 영역 : <%=pageContext.getAttribute("param1")  %></li>
	<li>request 영역 : <%=request.getAttribute("param1")  %></li>
	<li>변수2 : <%=request.getParameter("param2")  %></li>
	<li>변수3 : <%=request.getParameter("param3")  %></li>
</ul>


</body>
</html>