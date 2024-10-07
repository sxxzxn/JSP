<%@page import="net.fullstack7.member.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>core2.jsp</title>
</head>
<body>
<h1>core2</h1>
<h2>JSTL - core - remove </h2>

<c:set var="str1" value="Page Scope" />
<c:set var="str1" value="Request Scope" scope ="request" />
<c:set var="str1" value="Session Scope" scope ="session" />
<c:set var="str1" value="Application Scope" scope ="application" />

<h3>출력</h3>
<ul>
	<li>str1 : ${str1 }</li>
	<li>requestScope.str1 : ${requestScope.str1 }</li>
	<li>sessionScope.str1 : ${sessionScope.str1 }</li>
	<li>applicationScope.str1 : ${applicationScope.str1 }</li>
<!-- 	<li> -->
<!-- 	requestScope -->
<!-- 		<ul> -->
<%-- 			<li>member.memberId : ${requestScope.member.memberId }</li> --%>
<%-- 			<li>member.name : ${requestScope.member.name }</li> --%>
<%-- 			<li>member.gender : ${requestScope.member.gender }</li> --%>
<!-- 		</ul> -->
<!-- 	</li> -->
</ul>
<hr>
<h3>session scope 삭제하기</h3>
<c:remove var="str1" scope="session" />
<ul>
	<li> pagescope.str1 : ${pageScope.str1}</li>
	<li> requestScope.str1 : ${requestScope.str1 }</li>
	<li> sessionScope.str1 : ${sessionScope.str1 }</li>
	<li> applicationScope.str1 : ${applicationScope.str1 }</li>
</ul>
<hr>
<h3> scope 지정 없이 삭제</h3>
<c:remove var="str1"  />
<ul>
	<li> pagescope.str1 : ${pageScope.str1}</li>
	<li> requestScope.str1 : ${requestScope.str1 }</li>
	<li> sessionScope.str1 : ${sessionScope.str1 }</li>
	<li> applicationScope.str1 : ${applicationScope.str1 }</li>
</ul>
<hr>



</body>
</html>