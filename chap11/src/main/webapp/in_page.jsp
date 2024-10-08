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

<h3>인클루드 된 페이지 in_page.jsp</h3>

<ul>
	<li>request 파라미터 : ${param1}</li>
	<li>변수1 : ${param.p1}</li>
	<li>변수2 : ${param.p2}</li>
</ul>

<h3>외부 파일 참조</h3>
<iframe src="in_page2.jsp" style="width:100%; heigt:100%; border:1px solid red;">
</iframe>
</body>
</html>