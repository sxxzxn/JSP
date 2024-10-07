<%@page import="net.fullstack7.member.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>core4.jsp</title>
</head>
<body>
<h1>core4</h1>
<h2>JSTL - core - if </h2>
<c:set var = "num1" value="11" />
<c:set var = "str1">테스트</c:set>

<h3>JSTL if 태그로 짝수/홀수 판별</h3>
<c:if test="${ num1 mod 2 eq 0 }" var="even">
${num1 }은 짝수
</c:if>
<br>even : ${even }

<c:if test="${not even}">
${num1 }은 홀수
	<br>even : ${even }
</c:if>

<c:if test="${str1 eq '테스트'}" var="str1Result">
	<br>문자열은 ${str1}입니다.
</c:if>


<c:if test="${not str1Result}">
	<br>문자열은'테스트'가 아닙니다.
</c:if>


<c:if test="${true}">
	<br>true
</c:if>


<c:if test="TRUE">
	<br>TRUE
</c:if>

<c:if test="tRuedd" var="tResult">
	<br>tRue
</c:if>

<br>${tResult}



<%-- <c:if test="${ num1 mod 2 ne 0 }" var="odd"> --%>
<%-- ${num1 }은 홀수 --%>
<%-- </c:if> --%>
<%-- <c:if test="${not empty odd }" var="odd_result"> --%>
<%-- <br>odd : ${odd } --%>
<%-- </c:if> --%>




</body>
</html>