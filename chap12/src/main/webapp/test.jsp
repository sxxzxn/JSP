<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test.jsp</title>
</head>
<body>
	<h2> web.xml에 URL 매핑 후 출력</h2>
	<p>
		<b>메세지를 리턴받아서 전달합니다</b>
		<br><b><strong><%=request.getAttribute("msg") %></strong></b>
		<br><b><a href="./HelloServlet.do">바로가기</a></b>
	</p>
</body>
</html>