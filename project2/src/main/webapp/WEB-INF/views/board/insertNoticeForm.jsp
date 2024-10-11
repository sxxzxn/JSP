<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE</title>
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

	<div class="custom-form-wrap">
		<form action="insertNotice" method="post">
			<table>
				<tr>
					<td><label for="title">Title</label></td>
					<td><input type="text" id="title" name="title" required></td>
				</tr>
				<tr>
					<td><label for="contents">Contents</label></td>
					<td><textarea id="contents" name="contents" rows="6" required></textarea></td>
				</tr>
			</table>
			<input type="hidden" id="writerUid" name="writerUid"
				value="<c:out value='${loginMember.uid}' />"> <input
				type="submit" value="글 등록">
		</form>
	</div>

	<%@ include file="../../other.jsp"%>

</body>
</html>
