<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String param2= "인클루드 지시어 자식창에서 만든 변수";
pageContext.setAttribute("param2", param2);
%>

<h2>include 액션테그에서 포함된 페이지</h2>

<ul>
	<li>페이지 영역 : <%=pageContext.getAttribute("param1")  %></li>
	<li>request 영역 :  <%=request.getAttribute("param1")  %></li>
	<li>변수 :  <%=request.getParameter("param3")  %></li>
</ul>


</body>
</html>