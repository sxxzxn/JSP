<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="../default/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 게시글 수정 </h2>
<form id ="frmModify" method="POST">
	<table>
	<input type="hidden" name="idx" value="${dto.idx}" />
		<tr>
			<th>제목 : </th>
			<td>${dto.title}</td>
		</tr>
		<tr>
			<th>작성자 : </th>
			<td>${dto.memberId}</td>
		</tr>
		<tr>
			<th>작성일 : </th>
			<td>${dto.regDate}</td>
		</tr>
		<tr>
			<th>글내용 : </th>
			<td><textarea name="content">${dto.content}</textarea></td>
		</tr>
		<tr>
			<th>파일: </th>
       		<td>
	           <c:choose>
				    <c:when test="${dto.fileName != null}">
				        <a href="${dto.filePath}/${bbs.fileName}">${dto.fileName}</a>
				    </c:when>
				    <c:otherwise>
				       <p> 첨부파일이 없습니다.</p>
				    </c:otherwise>
				</c:choose>
       		</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" id ="btnModify" value="수정완료" onclick="goToModifydo();" /></td>        
<!-- 	        <td><input type="button" id ="btnCanlcel" value="취소" onclick="goCancel();" /></td> -->
		</tr>
	</table>
</form>

<script>
    function goToModifydo() {
        const frm = document.getElementById('frmModify');
        frm.action = './modify.do';
        frm.method = 'POST';  
        frm.submit();
    }

//     function goCancel() {
//         const frm = document.getElementById('frmModify');
        
//         frm.action = './list.do';
//         frm.method = 'POST';  
//         frm.submit();
//     }
</script>
</body>
</html>