<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:setProperty property="*" name = "member" />

<h2>폼으로 속성값 전달</h2>
<form id="frm" name="frm" action="useBeanFormOk.jsp">
<span for="memberId">아이디 : </span>
<input type="text" name="memberId" value="" />
<br><span for="name">이름 : </span>
<input type="text" name="name" value="" />
<br><span for="memberId">비밀번호 : </span>
<input type="password" name="pwd" value="1234" />
<br><input type = "submit" value="전송" />
</form>


</body>
</html>