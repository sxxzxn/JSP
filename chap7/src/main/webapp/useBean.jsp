<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2> useBean 액션태그</h2>
<h3>자바빈즈생성</h3>
<jsp:useBean id="member" class="fullstack7.member.MemberDTO" scope="request" />
<br>
<br>==>MemberDTO dto = new MemberDTO()

<h3>프로퍼티 설정</h3>
<br>
<br>=> member.setMemberId("user1");
<br>=> member.setMembername("조수진");
<br>=> member.setMemberPwd("1234");

<jsp:setProperty name="member" property="memberId" value="user1" />
<jsp:setProperty name="member" property="name" value="조수진" />
<jsp:setProperty name="member" property="pwd" value="1234" />

<h3>프로퍼티 조회</h3>
<br>
<br>=> member.getMemberId();
<br>=> member.getMembername();
<br>=> member.getMemberPwd();
<ul>
	<li>아이디 : <jsp:getProperty name ="member" property="memberId" /></li>
	<li>이름 : <jsp:getProperty name ="member" property="name" /></li>
	<li>비밀번호 : <jsp:getProperty name ="member" property="pwd" /></li>
</ul>

<hr>

<!-- <h2>속성값 한번에 가져오기</h2> -->
<%-- <jsp:setProperty property="*" name = "member" /> --%>

</body>
</html>