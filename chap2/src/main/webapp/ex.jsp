<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 error</title>
</head>
<body>

<%
int sts = response.getStatus();
if (sts == 404){
	out.print("404에러 발생");
	out.print("<br> 경로를 확인해주세요");
}


%>

</body>
</html>