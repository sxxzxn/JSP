<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="false" %>
<!-- 	지시어 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<%
	String str1 = "JSP";
	String str2 = "Hello";
	%>
<!-- 스크립틀릿 스크립트 요소 (선언부)-->
	
	<h2>
		<%=str1%>테스트페이지입니다
	</h2>
	<!-- 	스크립틀릿 표현식   <% %>-->

	<p>
		<%
		out.print(str2 + " " + str1);
		%>
	</p>
<!-- 	스크립틀릿   <% %>-->

</body>
</html>