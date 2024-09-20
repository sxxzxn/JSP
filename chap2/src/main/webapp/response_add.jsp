<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
long add_date = sf.parse(request.getParameter("add_date")).getTime();
int add_int = Integer.parseInt(request.getParameter("add_int"));
String name = request.getParameter("name");

response.addDateHeader("birth_day", add_date);
response.addIntHeader("no", add_int);
response.addHeader("name", name);

response.setHeader("name", "수진");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답 헤더 조회</title>
</head>
<body>
<h2>응답 헤더 조회</h2>
<ul>
<%
Collection<String> hName = response.getHeaderNames();
for (String hN : hName){
	String hValue = response.getHeader(hN);
	out.println("<li>" + hN + " : "+ hValue + "</li>");
}

%>
</ul>

<h2>여러개 출력된 헤더값 출력</h2>
<ul>
<%
Collection<String> hNos = response.getHeaders("no");
for (String hN : hNos){
	String hValue = response.getHeader(hN);
	out.println("<li>" + hN + " : "+ hValue + "</li>");
}

%>
</ul>
</body>
</html>