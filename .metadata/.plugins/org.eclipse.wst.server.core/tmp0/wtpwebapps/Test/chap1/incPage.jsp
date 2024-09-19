<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file ="incMain.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>include지시어</h2>
<%
out.println("오늘날짜 : "+today);
out.println("<br> ");
out.println("내일시간 : "+tomorrow);

%>
</body>
</html>