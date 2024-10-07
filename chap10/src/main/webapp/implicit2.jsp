<%@page import="net.fullstack7.common.CommonUtils"%>
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
CommonUtils cUtil = new CommonUtils();
cUtil.setCookiesInfo(request, response, "/", 60, "", "EL","EL테스트");


%>

<h2> 표현언어(EL) - 내장 객체</h2>
<h3> 쿠키 조회 </h3>
<ul>
	<li>EL로 쿠키 조회 : ${cookie.EL.value }</li>
</ul>
<hr>
<h3> HTTP 헤더 조회 </h3>
<ul>
	<li>host : ${header.host }</li>
	<li>user-agent : ${header["user-agent"] }</li>
	<li>cookie : ${header.cookie }</li>
	
	<li>host : <%=request.getHeader("host") %></li>
	<li>user-agent : <%=request.getHeader("user-agent") %></li>
	<li>cookie : <%=request.getHeader("cookie") %></li>
</ul>
<h3>컨텐스트 초기 값 조회</h3>
<ul>
	<li>Database Driver : ${initParam.MariaDriver }</li>
</ul>
<h3>컨텐스트 루트 경로 조회</h3>
<ul>
	<li>Context Root : ${pageContext.request.contextPath }</li>
</ul>
</body>
</html>