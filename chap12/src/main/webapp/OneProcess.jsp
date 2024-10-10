<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OneProsess</title>
</head>
<body>
<h2> 하나의 서블릿에서 매핑으로 여려가지 요청 처리하기 </h2>
<h3>${menu_kind}</h3>

	<ol>
		<li> URI : ${uri}</li>
		<li> 요청구분 : ${menu_kind}</li>
	</ol>
	
	<ul>
		<li><a href="regist.mem">회원가입</a></li>
		<li><a href="login.mem">로그인</a></li>
		<li><a href="bbs.mem">회원게시판</a></li>
	</ul>


</body>
</html>