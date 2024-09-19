<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@	page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>import 속성</title>
</head>
<body>
<%
Date  today = new Date();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
String today2 = dateFormat.format(today);
out.println("오늘날짜 : "+ today+"</br>"); 
out.println("오늘날짜 : "+ today2);
%>
<!-- <span>오늘날짜 :</span><span id="today"> Thu Sep 19 15:47:03 KST 2024</span></br> -->
<!-- <span>오늘날짜 :</span><span id="today"> 2024-09-19</span> -->

</body>
</html>