<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="project.services.NoticeService"%>
<%@ page import="project.dto.Notice"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공지사항 보기</title>
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
	<h3>공지사항 확인</h3>
	<div class="custom-form-wrap">
		<c:set var="noticeId" value="${param.noticeId}" />
		<c:set var="title" value="${param.title}" />
		<c:set var="contents" value="${param.contents}" />

		<c:set var="notice" value="${NoticeService.getNoticeById(noticeId)}" />

		<form class="form-btn" action="updateNoticeForm" method="post">
			<input type="hidden" name="noticeId" value="${notice.noticeId}">
			<table>
				<tr>
					<td><label for="title">Title</label></td>
					<td><input type="text" name="title" id="title"
						value="${notice.title}" readonly></td>
				</tr>
				<tr>
					<td><label for="contents">Contents</label></td>
					<td><textarea name="contents" id="contents" cols="30"
							rows="10" readonly>${notice.contents}</textarea></td>
				</tr>
			</table>
			<br>


			<c:if test="${loginMember.uid eq 'admin'}">
				<form class="form-btn" action="updateNoticeForm" method="post">
					<input type="hidden" name="noticeId" value="${notice.noticeId}">
					<input type="hidden" name="title" value="${notice.title}">
					<input type="hidden" name="contents" value="${notice.contents}">
					<input type="submit" value="수정" >
				</form>
				<form class="form-btn" action="deleteNotice" method="post">
					<input type="hidden" name="noticeIds" value="${notice.noticeId}">
					<input type="submit" value="삭제" style="margin: 0 20px;">
				</form>
				<form class="form-btn" action="fixNotice" method="post">
					<input type="hidden" name="noticeIds" value="${notice.noticeId}">
					<input type="submit" value="고정">
				</form>
				<form class="form-btn" action="unFixNotice" method="post">
					<input type="hidden" name="noticeIds" value="${notice.noticeId}">
					<input type="submit" value="고정해제" style="margin: 0 20px;">
				</form>
				

			</c:if>
	</div>
	<%@ include file="../../other.jsp"%>

</body>
</html>
