<%@page import="java.util.Enumeration"%>
<%@page import="java.lang.reflect.Method"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인완료</title>
</head>
<body>

<%
String user_id = request.getParameter("user_id");
String pwd = request.getParameter("pwd");
if(user_id.equals("user_1") && pwd.equalsIgnoreCase("1234")){
	response.sendRedirect("login_Complete.jsp");
// 	URL변경됨
}else{
	request.getRequestDispatcher("login.jsp?loginErr=1").forward(request, response);
// 	화면 바뀌고 URL변경x Dispatcher가 Request를 담당 
}

%>
</body>
</html>