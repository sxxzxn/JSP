<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션</title>
</head>
<body>


<h2> Session 설정 확인 </h2>
<%
SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");

// 최초 요청시간
long reqTime = session.getCreationTime();
String strReqTime = sdf.format(new Date(reqTime));

long lastAccTime = session.getLastAccessedTime();
String strLastAccTime = sdf.format(new Date(lastAccTime));
%>

<ul>
	<li>세션 유지 시간 : <%=session.getMaxInactiveInterval() %></li>
	<li>세션 아이디 : <%=session.getId() %></li>
	<li>세션 최초 요청 시간 : <%=reqTime %>    :    <%=strReqTime %></li>
	<li>세션 마지막 요청 시간 : <%=lastAccTime %>    :    <%=strLastAccTime %></li>
</ul>

</body>
</html>