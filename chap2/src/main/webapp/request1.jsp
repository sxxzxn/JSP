<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 1. 클라이언트 / 서버 환경 정보 조회</h2>
<ul>
<li>데이터 전송 방식 : <%= request.getMethod() %></li>
<li>URL : <%= request.getRequestURL() %></li>
<li>URI : <%= request.getRequestURI() %></li>
<li>프로토콜 : <%= request.getProtocol() %></li>
<li>서버명 : <%= request.getServerName() %></li>
<li>서버포트 : <%= request.getServerPort() %></li>
<li>접속 클라이언트 IP : <%= request.getRemoteAddr() %></li>
<li>쿼리 스트링 : <%= request.getQueryString() %></li>
<li>아이디 : <%= request.getParameter("user_id") %></li>
<li>비밀번호 : <%= request.getParameter("pwd") %></li>

</ul>

</body>
</html>