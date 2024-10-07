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
pageContext.setAttribute("param1", "pageContext 영역");
request.setAttribute("param1", "request 영역");
session.setAttribute("param1", "session 영역");
application.setAttribute("param1", "application 영역");

%>

<h2>표현연어 (EL)- 내장객체</h2>

<ul>
	<li>pageContext 영역 : ${pageScope.param1 }</li>
	<li>request 영역 : ${requestScope.param1 }</li>
	<li>session 영역 : ${sessionScope.param1 }</li>
	<li>application 영역 : ${applicationScope.param1 }</li>
</ul>
<h2>영역 지정 없이 속성값 조회</h2>
<ul>
	<li>${ param1 }</li>
</ul>

<jsp:forward page="inc_forward.jsp" />
</body>
</html>