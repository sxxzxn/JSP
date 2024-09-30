<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페어런트창타틀</title>
</head>
<body>

<%
String param1 = "페어런트에서 설정한 변수1";
String param2 = "페어런트에서 설정한 변수2";
String param3 = "페어런트에서 설정한 변수3";

pageContext.setAttribute("param1", param1);
request.setAttribute("param1", param1);

%>

<h2> 액션 태그의 포워딩 </h2>
<!-- 쿼리 스트링 인식 안됌 -->
<jsp:forward page="forward2.jsp?param2=<%=param2 %>"> 
	<jsp:param name = "param3" value= "<%=param3 %>"/>
</jsp:forward>

<br>
<a href = "forward2.jsp?param2=<%=param2 %>&param3=<%=param3 %>">링크로 이동 </a>

</body>
</html>