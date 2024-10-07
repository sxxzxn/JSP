<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.fullstack7.member.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>core3.jsp</title>
</head>
<body>
<h1>core3</h1>
<h2>JSTL - core - .객체할당 </h2>
<c:set var = "num1" value="10" />
<c:set var = "num2" value="${ num1 mod 5 }" />
<c:set var = "date1" value="<%= new Date() %>" />
<c:set var = "str1">문자열값 지정</c:set>

<h3>List 컬렉션 사용</h3>
<%
ArrayList<MemberDTO> mList = new ArrayList<MemberDTO>();
mList.add(new MemberDTO("user1", "몽그리1","남"));
mList.add(new MemberDTO("user2", "몽그리2","남"));
mList.add(new MemberDTO("user3", "몽그리3","남"));
%>

<c:set var="mList" value="<%=mList %>" scope="request" />

<ul>
	<li>아이디 : ${requestScope.mList[0].memberId}</li>
	<li>이름 : ${mList[0].name}</li>
	<li>성별 : ${mList[0].gender}</li>
</ul>
<ul>
	<li>아이디 : ${requestScope.mList[1].memberId}</li>
	<li>이름 : ${mList[1].name}</li>
	<li>성별 : ${mList[1].gender}</li>
</ul>
<ul>
	<li>아이디 : ${requestScope.mList[2].memberId}</li>
	<li>이름 : ${mList[2].name}</li>
	<li>성별 : ${mList[2].gender}</li>
</ul>

<hr>

<h3>Map 컬렉션 사용</h3>
<%
Map<String, MemberDTO> map = new HashMap<String, MemberDTO>();
map.put("member1", new MemberDTO("user1", "몽그리1","남"));
map.put("member2", new MemberDTO("user2", "몽그리2","남"));
map.put("member3", new MemberDTO("user3", "몽그리3","남"));
%>

<c:set var="mMap" value="<%=map %>" scope="request" />

<ul>
	<li>아이디 : ${requestScope.mMap.member1.memberId}</li>
	<li>이름 : ${mMap.member1.name}</li>
	<li>성별 : ${mMap.member1.gender}</li>
</ul>
<ul>
	<li>아이디 : ${requestScope.mMap.member2.memberId}</li>
	<li>이름 : ${mMap.member2.name}</li>
	<li>성별 : ${mMap.member2.gender}</li>
</ul>
<ul>
	<li>아이디 : ${requestScope.mMap.member3.memberId}</li>
	<li>이름 : ${mMap.member3.name}</li>
	<li>성별 : ${mMap.member3.gender}</li>
</ul>

<hr>

<h3> 자바 객체 - 생성자 사용</h3>
<c:set var="member" value='<%= new MemberDTO("hani", "하니", "여") %>' scope="request" />
<ul>
	<li>아이디 : ${member.memberId}</li>
	<li>이름 : ${member.name}</li>
	<li>성별 : ${member.gender}</li>
</ul>
<hr>

<h3> 자바 객체 - 자바빈즈 사용</h3>
<c:set var="member2" value='<%= new MemberDTO() %>' scope="request" />
<c:set property="memberId" value='coco' target="${member2 }" />
<c:set property="name" value='코코' target="${member2 }" />
<c:set property="gender" value='여' target="${member2 }" />
<ul>
	<li>아이디 : ${requestScope.member2.memberId}</li>
	<li>이름 : ${member2.name}</li>
	<li>성별 : ${member2.gender}</li>
</ul>

</body>
</html>