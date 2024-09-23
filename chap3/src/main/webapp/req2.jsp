<%@page import="dto.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>request forward 로 전달영역</h2>
<%
String reqType = request.getParameter("reqType");
%>

<h2><%=( reqType != null && reqType.equals("req") ? "reguest forward" : "send" ) %>로 전달</h2>

<h2><%=( reqType != null && reqType.equals("req") ? "reguest forward" : "send" ) %>로 전달</h2>

<%	
Object req1 = request.getAttribute("req1");
Object reqStudent = request.getAttribute("reqStudent");
 %>
 <ul> 
 <li>req1 문자열 정보: <%=(req1 != null ? req1.toString() : "") %></li>
 </ul>
<% 
 if (reqStudent != null) {
			StudentDTO pageStudent2 = (StudentDTO) reqStudent;
%>
	<ul>
		<li>번호 : <%=pageStudent2.getNo()%></li>
		<li>이름 : <%=pageStudent2.getName()%></li>
		<li>나이 : <%=pageStudent2.getAge()%></li>
		<li>등급 : <%=pageStudent2.getDept()%></li>
		<li>학년 : <%=pageStudent2.getGrade()%></li>
<%-- 		<li>request user_id: <%=request.getParameter("user_id") %></li> --%>
<%-- 		<li>request user_id: <%=request.getParameter("pwd") %></li> --%>
 </ul>
	</ul> 
	<%}%>


</body>
</html>