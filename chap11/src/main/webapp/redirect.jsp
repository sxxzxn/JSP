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
<h2> JSTL - redirect </h2>

<c:set var="param1" value="파라미터2" scope="request" />
<c:redirect url="in_page.jsp">
	<c:param name="p1" value="내부파라미터1"/>
	<c:param name="p2" value="내부파라미터2"/>
</c:redirect>
</body>
</html>