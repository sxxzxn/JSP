<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String uid = request.getParameter("uid");
String pwd = request.getParameter("pwd");
String result = "";
if ("user0".equals(uid) && "1234".equals(pwd)) {
	result = "로그인 성공";
} else {
	result = "로그인 실패";
}

System.out.println(request.getParameter("hidden_data"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	결과 = <%=result%>
</body>
</html>
