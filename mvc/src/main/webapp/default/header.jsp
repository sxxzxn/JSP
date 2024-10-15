<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../css/styles.css">
</head>
<body>

<ul class = "navbar">
	<li><a href="/mvc/bbs/list.do">게시판</a></li>
	   <c:choose>
        <c:when test="${not empty sessionScope.memberId}">
            <li><a href="/mvc/member/logout.do">로그아웃</a></li>
        </c:when>
        <c:otherwise>
            <li><a href="/mvc/member/login.do">로그인</a></li>
        </c:otherwise>
    </c:choose>
</ul>

</body>
</html>