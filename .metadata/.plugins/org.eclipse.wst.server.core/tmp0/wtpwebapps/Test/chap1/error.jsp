<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page errorPage ="error2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>
page 지시어 = errorPage, isErrorPage 속성
</h2>

<% 
int age= Integer.parseInt(request.getParameter("age"));
out.print("현재나이는 "+ age +"입니다.");
%>

</body>
</html>