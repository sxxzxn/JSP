<%@page import="java.util.Enumeration"%>
<%@page import="java.lang.reflect.Method"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 3. 요청 헤더 정보 출력하기</h2>
<%
Enumeration headers = request.getHeaderNames();
%>
<ol>
	<%
		while(headers.hasMoreElements()){
		String hName = (String)headers.nextElement();
		String hValus = request.getHeader(hName);
		out.println("<li> 헤더명 : "+hName+", 헤더값 : "+hValus+"<br> </li>");
		}
	
	%>
</ol>
</body>
</html>