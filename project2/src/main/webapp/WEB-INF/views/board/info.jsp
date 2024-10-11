<%@ page import="java.util.List"%>
<%@ page import="project.dto.Board"%>
<%@ page import="project.dto.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>INFO</title>
</head>
<body id="fixed">
	<style>
.custom-table {
	width: 100%;
	border-collapse: collapse;
}

.custom-table th, .custom-table td {
	padding: 10px;
	text-align: center;
}

.custom-table th {
	border-bottom: 1px solid #ccc;
}

.custom-table .center-divider {
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	width: 20px;
}

.custom-table ul {
	list-style: none;
	padding: 0;
	margin: 0;
	text-align: left;
}

.custom-table ul li {
	margin-bottom: 10px;
}

.list_ul li:first-child {
	text-align: right;
	margin-bottom: 30px;
	text-decoration: underline;
	font-size: 12px;
	color: gray;
}

.list_ul li {
	text-align: center;
}
</style>
	<%@ include file="../../navbar.jsp"%>
	<link href="/project2/css/memberstyle.css" rel="stylesheet" />
	<div id="bottomMenu">
		<ul>
			<li><a href="info">INFO</a></li>
			<li><a href="noticeList">NOTICE</a></li>
			<li><a href="boardList">Q&A</a></li>
		</ul>
	</div>
	<div class="form_wrap">
		<h2>INFO</h2>
		<table class="custom-table">

			<table class="custom-table">
				<thead>
					<tr>
						<th>공지사항</th>
						<th class="center-divider"></th>
						<th>게시판</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="align-center">
							<ul class="list_ul">
								<li><a href="noticeList">전체보기</a></li>
								<c:forEach items="${notices}" var="notice">
									<li><a href="viewNotice?noticeId=${notice.noticeId}">${notice.title}</a></li>
								</c:forEach>
							</ul>
						</td>
						<td class="center-divider"></td>
						<td class="align-center">
							<ul class="list_ul">
								<li><a href="boardList">전체보기</a></li>
								<c:forEach items="${boards}" var="board">
									<li><a href="viewBoard?boardId=${board.boardId}">${board.title}</a></li>
								</c:forEach>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
</body>
</html>
