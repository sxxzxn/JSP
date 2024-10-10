<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>MVC 패턴을 활용한 회원 인증</h2>
	<p>
		<b>${msg}</b>
		<br><a href="./Member.mvc?id=admin&pwd=1234">관리자</a>
		<br><a href="./Member.mvc?id=user1&pwd=1234">정회원</a>
		<br><a href="./Member.mvc?id=guest&pwd=1234">비회원</a>
	</p>
</body>
</html>