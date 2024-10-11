<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="project.services.BoardService"%>
<%@ page import="project.dto.Board"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>

</head>
<body id="fixed">
	<%@ include file="../../navbar.jsp"%>
	<link href="/project2/css/memberstyle.css" rel="stylesheet" />
	<div id="bottomMenu">
		<ul>
			<li><a href="info">INFO</a></li>
			<li><a href="noticeList">NOTICE</a></li>
			<li><a href="boardList">Q&A</a></li>
		</ul>
	</div>
	<h2>Q&A</h2>
	<h3>게시글 수정</h3>
	<h4></h4>

	<div class="custom-form-wrap">
		<c:set var="boardId" value="${param.boardId}" />
		<c:set var="title" value="${param.title}" />
		<c:set var="contents" value="${param.contents}" />

		<c:set var="board" value="${BoardService.getBoardById(boardId)}" />

		<form class="form-btn" action="updateBoard" method="post">
			<input type="hidden" name="boardId" value="${board.boardId}">
			<table>
				<tr>
					<td><label for="title">Title</label></td>
					<td><input type="text" name="title" id="title"
						value="${board.title}"><br></td>
				</tr>
				<tr>
					<td><label for="contents">Contents</label><br></td>
					<td><textarea name="contents" id="contents" cols="30"
							rows="10">${board.contents}</textarea></td>
				</tr>
			</table>

			<form class="form-btn" action="updateBoard" method="get">
			<input type="submit" value="수정" style="margin: 0 20px;">
		</form>

		<form class="form-btn" action="boardList" method="get">
			<input type="submit" value="뒤로가기" class="button-new">
		</form>

		<%-- 	<form action="deleteBoard" method="post">
		<input type="hidden" name="boardId" value="${board.boardId}">
		<input type="submit" value="삭제" class="button-new">
	</form> --%>
	</div>

	<%@ include file="../../other.jsp"%>
</body>
</html>
