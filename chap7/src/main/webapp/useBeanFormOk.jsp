<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>폼으로 전달된 속성값 조회</h2>
<jsp:useBean id="member" class="fullstack7.member.MemberDTO" />
<jsp:setProperty property="*" name="member" />


<ul>
	<li>아이디 : <jsp:getProperty name ="member" property="memberId" /></li>
	<li>이름 : <jsp:getProperty name ="member" property="name" /></li>
	<li>비밀번호 : <jsp:getProperty name ="member" property="pwd" /></li>
</ul>

</body>
</html>