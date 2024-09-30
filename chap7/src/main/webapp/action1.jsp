<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>include 액션 태그</h2>

<%
String param1 = "페어런트에서 확인";
pageContext.setAttribute("param1", param1);
request.setAttribute("param1", param1);

String pageUrl = "includeAction1.jsp";
%>


<h3>include 지시어로 포함</h3>
<%@ include file ="includeDriective.jsp" %>
<p>지시어 자식 페이지에서 선언한 변수<%=pageContext.getAttribute("param2") %></p>

<hr>

<h3>include 액션태그로 포함</h3>
<jsp:include page = "includeAction1.jsp">
	<jsp:param name = "param3" value= "부모창에서 보낸 파라미터3"/>
</jsp:include>
<jsp:include page="<%=pageUrl %>">
	<jsp:param name = "param3" value= "부모창에서 보낸 파라미터33"/>
</jsp:include>

<p>지시어 자식 페이지에서 선언한 변수 : <%=pageContext.getAttribute("param2") %></p>

</body>
</html>