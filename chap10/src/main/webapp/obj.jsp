<%@page import="net.fullstack7.common.TestUtils"%>
<%@page import="net.fullstack7.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>표현언어 (EL) - 객체의 메서드 호출</h2>
<%
MemberDTO dto = new MemberDTO();
dto.setMemberId("user1");
dto.setName("수진");
dto.setGender("여");

pageContext.setAttribute("dto", dto);
%>

<ul>
	<li>객체의 메서드 호출 : 
		<ul>
			<li>아이디 : ${dto.getMemberId()}</li>
			<li>이름 : ${dto.getName()}</li>
			<li>나이 : ${dto.getGender()}</li>
		</ul>
	</li>
</ul>

<hr>
<%
%>

<h3> 정적 메서드 호출</h3>
<ul>
	<li>정적 메서드 : ${TestUtils.isNumeric("3") }</li>
	<li>정적 메서드 : ${TestUtils.isNumeric("abc") }</li>
</ul>

</body>
</html>