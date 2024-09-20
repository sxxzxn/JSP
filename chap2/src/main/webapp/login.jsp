<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그이인</title>
</head>
<body>
<%
String loginErr = request.getParameter("loginErr");
%>

<h2>로그인</h2>
<form name ="frmLogin" method="post" action="Login_ok.jsp">
<span for = "user_id">아이디 : </span>
<input type = "text" name="user_id" id="user_id" value="user_1" />
<br>
<span for = "pwd">비밀번호 : </span>
<input type = "password" name="pwd" id="pwd" value="1234" />
<br>

<%
if( loginErr != null){
	out.println("로그인정보가 올바르지 않습니다.");
}

%>
<br>
<input type ="submit" value="로그인">
</form>
</body>
</html>