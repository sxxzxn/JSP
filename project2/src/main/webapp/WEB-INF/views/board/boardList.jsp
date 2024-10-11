<%@ page import="java.util.List"%>
<%@ page import="project.dto.Board"%>
<%@ page import="project.services.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Q&A</title>

</style>
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
    <h3>Q&A LIST</h3>
    <div class="btn-group" style="text-align: right; margin-bottom: 10px;">
        <c:if test="${sessionScope.loginMember != null}">
            <!-- 등록 버튼 -->
            <a href="insertBoardForm" class="button-new">등록</a>
        </c:if>
        <c:if test="${loginMember.uid eq 'admin'}">
            <!-- 삭제 버튼 -->
            <input type="button" value="삭제" onclick="deleteAllRows()" class="button-new">
        </c:if>
    </div>
    <div class="form_wrap">
        <form action="deleteBoard" method="post"></form>
        <!-- 게시글 목록 테이블 -->
        <table>
            <tr>
                <th><input type="checkbox" id="selectAllCheckbox" onclick="selectAllRows()"></th>
                <th>글번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
            <c:forEach var="board" items="${boardList}">
                <tr>
                    <td><input type="checkbox" name="selectedBoards" value="${board.boardId}"></td>
                    <td>${board.boardId}</td>
                    <td><a href="viewBoard?boardId=${board.boardId}&title=${board.title}">${board.title}</a></td>
                    <td>${board.writerUid}</td>
                    <td>${board.regDate}</td>
                    <td>${board.viewCount}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <%@ include file="../../other.jsp"%>
    <script>
        // 전체 선택 체크박스를 클릭하면 모든 게시글의 체크박스가 선택되거나 해제됨
        function selectAllRows() {
            var selectAllCheckbox = document.getElementById('selectAllCheckbox');
            var checkboxes = document.getElementsByName('selectedBoards');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = selectAllCheckbox.checked;
            }
        }
        function deleteAllRows() {
            if (confirm('선택한 게시글을 삭제하시겠습니까?')) {
                var checkboxes = document.getElementsByName('selectedBoards');
                var boardIds = "";
                for (var i = 0; i < checkboxes.length; i++) {
                    if (checkboxes[i].checked)
                        boardIds += checkboxes[i].value + ",";
                }
                if (boardIds === "") {

                } else {
                    boardIds = boardIds.substr(0, boardIds.length - 1);
                    location.href = "deleteBoard?boardIds=" + boardIds;
                }
            }
        }
    </script>
</body>
</html>
