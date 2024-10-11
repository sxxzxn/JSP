<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="project.services.NoticeService"%>
<%@ page import="project.dto.Notice"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
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
	<h2>NOTICE</h2>
	<h3>공지사항 수정</h3>
	<h4></h4>

	<div class="custom-form-wrap">
		<c:set var="noticeId" value="${param.noticeId}" />
		<c:set var="title" value="${param.title}" />
		<c:set var="contents" value="${param.contents}" />

		<c:set var="notice" value="${NoticeService.getNoticeById(noticeId)}" />

		<form class="form-btn" action="updateNotice" method="post">
			<input type="hidden" name="noticeId" value="${notice.noticeId}">
			<table>
				<tr>
					<td><label for="title">Title</label></td>
					<td><input type="text" name="title" id="title"
						value="${notice.title}"><br></td>
				</tr>
				<tr>
					<td><label for="contents">Contents</label></td>
					<td><textarea name="contents" id="contents" cols="30"
							rows="5">${notice.contents}</textarea></td>
					</tr>
        </table>
					<input  type="submit" value="수정" style="margin: 0 20px;">
					</form>
					<form class="form-btn" action="noticeList" method="get">
						<input type="submit" value="뒤로가기">
					</form>

					<%-- <form class="form-btn" action="deleteNotice" method="post">
						<input type="hidden" name="noticeId" value="${notice.noticeId}">
						<input type="submit" value="삭제">
					</form> --%>
					</div>
					<%@ include file="../../other.jsp"%>
</body>
</html>
