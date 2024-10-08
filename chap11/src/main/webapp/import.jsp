<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>JSTL - import 태그</h2>

<c:set var="param1" value="문자열1" scope="request" />
<c:import var="im1" url="in_page.jsp">
	<c:param name="p1" value="내부파라미터1" />
	<c:param name="p2" value="내부파라미터2" />
</c:import>

<h3>문서 삽입하기 : ${im1}</h3>
</body>
</html>