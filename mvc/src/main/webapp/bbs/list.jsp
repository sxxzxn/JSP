<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../default/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2> 게시판 리스트 </h2>

<form method="GET" action="list.do">
    <select name="searchType">
        <option value="title" <c:if test="${searchType == 'title'}">selected</c:if>>제목</option>
        <option value="memberId" <c:if test="${searchType == 'memberId'}">selected</c:if>>회원아이디</option>
    </select>
    <input type="text" name="searchKeyword" value="${searchKeyword}" placeholder="검색어 입력">
    <input type="submit" value="검색">
</form>
<form action="list.do" method="get" onchange="submitPageSizeForm()">
    <select name="pageSize" id="pageSize">
        <option value="10" <%= request.getParameter("pageSize") != null && request.getParameter("pageSize").equals("10") ? "selected" : "" %>>10</option>
        <option value="20" <%= request.getParameter("pageSize") != null && request.getParameter("pageSize").equals("20") ? "selected" : "" %>>20</option>
        <option value="30" <%= request.getParameter("pageSize") != null && request.getParameter("pageSize").equals("30") ? "selected" : "" %>>30</option>
        <option value="40" <%= request.getParameter("pageSize") != null && request.getParameter("pageSize").equals("40") ? "selected" : "" %>>40</option>
        <option value="50" <%= request.getParameter("pageSize") != null && request.getParameter("pageSize").equals("50") ? "selected" : "" %>>50</option>
    </select>
    <input type="hidden" name="pageNo" value="${pageNo}">
    <input type="hidden" name="searchType" value="${searchType}">
    <input type="hidden" name="searchKeyword" value="${searchKeyword}">
    <input type="submit" value="선택" />
</form>


<form id="frmList" method="POST">
<table>
<tr>
  <c:choose>
  	<c:when test="${sessionScope.memberId == 'admin'}" >
  	<td colspan ="3">
		<input type="button" value="글등록" id="btnRegist"  onclick="goToRegist();" />
	</td>
	<td colspan ="3">
		<input type="button" value="글삭제" id="btnDelete" onclick="goToDelete();" />
	</td>
  	</c:when>
   <c:otherwise>
  <td colspan ="6">
		<input type="button" value="글등록" id="btnRegist"  onclick="goToRegist();" />
	</td>
   </c:otherwise>
  </c:choose>
</tr>
<tr>
  <c:if test="${sessionScope.memberId == 'admin'}">
     <td><input type="checkbox"></td>
   </c:if>
	<td>번호</td>
	<td>제목</td>
	<td>작성자</td>
	<td>작성일</td>
	<td>조회수</td>
</tr>
<c:forEach var="dto" items="${bbsList}"> 
<tr>
  <c:if test="${sessionScope.memberId == 'admin'}">
	<td><input type="checkbox" value="${dto.idx}" name="selectedIdx[]"></td>
  </c:if>
    <td>${dto.idx}</td>
    <td><a href="view.do?idx=${dto.idx}">${dto.title}</a></td>
    <td>${dto.memberId}</td>
    <td>${dto.regDate}</td>
    <td>${dto.readCnt}</td>
</tr>
</c:forEach>
<tr>
    <td colspan="6">
        <c:if test="${pagination.totalPosts > 0}">
            <div class="pagination">
                <!-- 맨앞 버튼 -->
                <c:if test="${pagination.hasFirst()}">
                    <a href="list.do?pageNo=1&pageSize=${pagination.pageSize}&searchType=${searchType}&searchKeyword=${searchKeyword}">&lt;&lt;</a>
                </c:if>

                <!-- 이전 버튼 -->
                <c:if test="${pagination.hasPrev()}">
                    <a href="list.do?pageNo=${pagination.pageNo - 10 > 0 ? pagination.pageNo - 10 : 1}&pageSize=${pagination.pageSize}&searchType=${searchType}&searchKeyword=${searchKeyword}">&lt;</a>
                </c:if>

                <!-- 페이지 번호 표시 -->
                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}">
                    <c:choose>
                        <c:when test="${i == pagination.pageNo}">
                            <strong>${i}</strong>
                        </c:when>
                        <c:otherwise>
                            <a href="list.do?pageNo=${i}&pageSize=${pagination.pageSize}&searchType=${searchType}&searchKeyword=${searchKeyword}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <!-- 다음 버튼 -->
                <c:if test="${pagination.hasNext()}">
                    <a href="list.do?pageNo=${pagination.pageNo + 10 < pagination.totalPages ? pagination.pageNo + 10 : pagination.totalPages}&pageSize=${pagination.pageSize}&searchType=${searchType}&searchKeyword=${searchKeyword}">&gt;</a>
                </c:if>

                <!-- 맨뒤 버튼 -->
                <c:if test="${pagination.hasLast()}">
                    <a href="list.do?pageNo=${pagination.totalPages}&pageSize=${pagination.pageSize}&searchType=${searchType}&searchKeyword=${searchKeyword}">&gt;&gt;</a>
                </c:if>
            </div>
        </c:if>
    </td>
</tr>
</table>
</form>

<script>
    function goToRegist() {
        const frm = document.getElementById('frmList');
        frm.action = './regist.do';
        frm.method = 'get';  
        frm.submit();
    }

    function goToDelete() {
        const frm = document.getElementById('frmList');
        const checkboxes = document.querySelectorAll('input[name="selectedIdx[]"]:checked');
        
        if (checkboxes.length === 0) {
            alert('삭제할 항목을 선택해주세요.');
            return;
        }
        
        if (confirm('선택한 글을 삭제하시겠습니까?')) {
        	frm.action = './delete.do';
        	frm.method = 'post';  
        	frm.submit();
        }
    }
    
    function submitPageSizeForm() {
        const frm = document.getElementById('pageSizeForm');
        frm.submit();
    }
</script>
</body>
</html>