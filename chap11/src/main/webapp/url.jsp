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

<h2>JSTL - URL 태그</h2>
<c:set var="param1" value="request 파라미터" scope="request" />
<c:url var = "url" value="in_page.jsp">
	<c:param name="p1" value="내부변서" />
	<c:param name="p2" value="내부변서2" />
</c:url>
<a href="${url}">링크</a>
</body>
</html>