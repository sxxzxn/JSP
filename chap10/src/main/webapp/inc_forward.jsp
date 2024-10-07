<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - forward</title>
</head>
<body>


<h2>표현연어 (EL)- 내장객체</h2>
<h2>액션 태그 - forward</h2>

<ul>
	<li>pageContext 영역 : ${pageScope.param1 }</li>
	<li>request 영역 : ${requestScope.param1 }</li>
	<li>session 영역 : ${sessionScope.param1 }</li>
	<li>application 영역 : ${applicationScope.param1 }</li>
</ul>
<h2>영역 지정 없이 속성값 조회</h2>
<ul>
	<li>${ param1 }</li>
</ul>

</body>
</html>