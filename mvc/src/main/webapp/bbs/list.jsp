<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../default/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bbsStyles.css">
</head>
<body>

<h2> 게시판 리스트 </h2>
<form>
<table>
<tr>
	<td>번호</td>
	<td>제목</td>
	<td>작성자</td>
	<td>작성일</td>
	<td>조회수</td>
</tr>
<c:forEach var="dto" items="${bbsList}"> 
<tr>
    <td>${dto.idx}</td>
    <td><a href="view.do?idx=${dto.idx}">${dto.title}</a></td></td>
    <td>${dto.memberId}</td>
    <td>${dto.regDate}</td>
    <td>${dto.readCnt}</td>
</tr>
</c:forEach>
<tr>
	<td colspan ="2">
	<input type="button" value="글등록" onclick="location.href='/regist.do';"/>
	<input type="button" value="글삭제" onclick="location.href='/delete.do';"/>
	</td>
</tr>
<tr>
	<td colspan ="4" >
		페이징영역
	</td>
</tr>

</table>

</form>

</body>
</html>