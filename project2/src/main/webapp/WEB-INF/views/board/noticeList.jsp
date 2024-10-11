<%@ page import="java.util.List"%>
<%@ page import="project.dto.Notice"%>
<%@ page import="project.services.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공지사항</title>
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
	<h3>NOTICE LIST</h3>

	<div class="btn-group">
		<c:if test="${loginMember.uid eq 'admin'}">
			<!-- 등록 버튼 -->
			<a href="insertNoticeForm" class="button-new"
				style="height: 40px; = display: inline-block; = box-sizing: border-box;">등록</a>

			<!-- 삭제 버튼 -->
			<input style="height: 40px" type="button" value="삭제"
				onclick="deleteAllRows()" class="button-new">
			<input type="button" value="고정" onclick="fixAllRows()"
				class="button-new">
			<input type="button" value="고정 해제" onclick="unfixAllRows()"
				class="button-new">
	</div>
	</c:if>
	<div class="form_wrap">
		<form action="deleteNotice" method="post" style="width: 100%;">
			<!-- 공지사항 목록 테이블 -->
			<table>
				<tr>
					<th><input type="checkbox" id="selectAllCheckbox"
						onclick="selectAllRows()"></th>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>고정</th>
					<!-- "Fix Notice" 버튼을 위한 새로운 열 제목 -->
				</tr>
				<c:forEach var="notice" items="${noticeList}">
					<tr>
						<td><input type="checkbox" name="selectedNotices"
							value="${notice.noticeId}"></td>
						<td><span
							style="font-weight: ${notice.fixedYN eq 'Y' ? 'bold' : 'normal'};">${notice.noticeId}</td>
						<td><span
							style="font-weight: ${notice.fixedYN eq 'Y' ? 'bold' : 'normal'};"><a
								href="viewNotice?noticeId=${notice.noticeId}&title=${notice.title}">
									<span
									style="font-weight: ${notice.fixedYN eq 'Y' ? 'bold' : 'normal'};">${notice.title}</span>
							</a></td>
						<td><span
							style="font-weight: ${notice.fixedYN eq 'Y' ? 'bold' : 'normal'};">${notice.writerUid}</td>
						<td><span
							style="font-weight: ${notice.fixedYN eq 'Y' ? 'bold' : 'normal'};">${notice.regDate}</td>
						<td><span
							style="font-weight: ${notice.fixedYN eq 'Y' ? 'bold' : 'normal'};">${notice.viewCount}</td>
						<td><span
							style="font-weight: ${notice.fixedYN eq 'Y' ? 'bold' : 'normal'};">${notice.fixedYN}</span></td>
					</tr>
				</c:forEach>

			</table>
		</form>
	</div>
	</div>
	<%@ include file="../../other.jsp"%>

	<script>
		// 전체 선택 체크박스를 클릭하면 모든 공지사항의 체크박스가 선택되거나 해제됨
		function selectAllRows() {
			var selectAllCheckbox = document
					.getElementById('selectAllCheckbox');
			var checkboxes = document.getElementsByName('selectedNotices');
			for (var i = 0; i < checkboxes.length; i++) {
				checkboxes[i].checked = selectAllCheckbox.checked;
			}
		}
		// 선택 삭제
		function deleteAllRows() {
			if (confirm('선택한 게시글을 삭제하시겠습니까?')) {
				var checkboxes = document.getElementsByName('selectedNotices');
				var noticeIds = "";
				for (var i = 0; i < checkboxes.length; i++) {
					if (checkboxes[i].checked)
						noticeIds += checkboxes[i].value + ",";
				}
				if (noticeIds == "") {
					alert("삭제할 게시글을 선택해주세요.");
				} else {
					noticeIds = noticeIds.substr(0, noticeIds.length - 1);
					location.href = "deleteNotice?noticeIds=" + noticeIds;
				}
			}
		}

		// 공지사항 고정 함수
		function fixAllRows() {
			if (confirm('해당 공지사항을 고정하시겠습니까?')) {
				var checkboxes = document.getElementsByName('selectedNotices');
				var noticeIds = "";
				for (var i = 0; i < checkboxes.length; i++) {
					if (checkboxes[i].checked)
						noticeIds += checkboxes[i].value + ",";
				}
				if (noticeIds == "") {
					alert("고정할 공지사항을 선택해주세요.");
				} else {
					noticeIds = noticeIds.substr(0, noticeIds.length - 1);
					location.href = "fixNotice?noticeIds=" + noticeIds;
				}
			}
		}
		function unfixAllRows() {
			if (confirm('해당 공지사항을 고정 해제하시겠습니까?')) {
				var checkboxes = document.getElementsByName('selectedNotices');
				var noticeIds = "";
				for (var i = 0; i < checkboxes.length; i++) {
					if (checkboxes[i].checked)
						noticeIds += checkboxes[i].value + ",";
				}
				if (noticeIds == "") {
					alert("고정 해제할 공지사항을 선택해주세요.");
				} else {
					noticeIds = noticeIds.substr(0, noticeIds.length - 1);
					location.href = "unFixNotice?noticeIds=" + noticeIds;
				}
			}
		}
	</script>
</body>
</html>
