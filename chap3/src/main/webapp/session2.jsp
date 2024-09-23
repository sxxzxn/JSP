<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>session 영역 >> 페이지 이동 후 session 영역 조회</h2>

<%
List<String> lists = (List<String>) session.getAttribute("lists");
if (lists != null) {
	for (String str : lists) {
		out.print("str :" + str + "<br>");
	}
}
%>


</body>
</html>