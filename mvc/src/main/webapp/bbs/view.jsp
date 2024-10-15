<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../default/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>상세보기 </h2>
<form id ="frmView" method="POST">
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
			<td>${dto.content}</td>
		</tr>
		<tr>
			<th>파일: </th>
       		<td>
	           <c:choose>
				    <c:when test="${not empty dto.fileName}">
				        <p>${dto.fileName}</p>
				    </c:when>
				    <c:otherwise>
				       <p> 첨부파일이 없습니다.</p>
				    </c:otherwise>
				</c:choose>
       		</td>
		</tr>
		 <c:if test="${sessionScope.memberId == dto.memberId}">
		<tr>
			<td><input type="button" id ="btnModify" value="수정" onclick="goToModify();" /></td>        
	        <td><input type="button" id ="btnDelete" value="삭제" onclick="goToDelete();" /></td>
		</tr>
		</c:if>
	</table>
</form>

<form id="frmCommentList" method="POST">
	<table>
	    <thead>
	        <tr>
	            <th>작성자</th>
	            <th>댓글 내용</th>
	            <th>작성일</th>
	            <th></th>
	        </tr>
	    </thead>
	    <tbody>
	        <c:if test="${empty commentList}">
	            <tr>
	                <td colspan="4">작성된 댓글이 없습니다.</td>
	            </tr>
	        </c:if>
	        <c:if test="${not empty commentList}">
				<c:forEach var="comment" items="${commentList}">
				    <tr>
				        <td>${comment.writerId}</td>
				        <td>
				            <c:if test="${comment.pId == null || comment.pId == 0}">
				                ${comment.contents} <!-- 일반 댓글 -->
				            </c:if>
				            <c:if test="${comment.pId != null && comment.pId != 0}">
				                &nbsp;&nbsp;&nbsp;&nbsp;↳ ${comment.contents} <!-- 대댓글 -->
				            </c:if>
				        </td>
				        <td>${comment.regDate}</td>
				        <td>
				            <c:if test="${sessionScope.memberId == comment.writerId}">
				                <input type="button" value="X" onclick="deleteComment(${comment.commentId});" />
				            </c:if>
				            <input type="button" value="+" onclick="openReplyForm(${comment.commentId});" />
				        </td>
				    </tr>
				    <!-- 대댓글 작성 폼 -->
				   <tr id="replyForm${comment.commentId}">
				        <td colspan="4">
				            <form id="frmReply" action="../comment/regist.do" method="POST">
				                <input type="hidden" name="writerId" value="${sessionScope.memberId}" />
				                <input type="hidden" name="boardId" value="${dto.idx}" />
				                <input type="hidden" name="pId" value="${comment.commentId}" /> <!-- 부모 댓글 ID -->
				                <input type="text" name="reContents" placeholder="대댓글을 입력하세요." required style="width: 200px;" />
				                <input type="button"value="등록" onclick="registReple();"/>
				            </form>
				        </td>
				    </tr>
				</c:forEach>
	        </c:if>
	    </tbody>
	</table>
</form>

<form id="frmComment" method="POST">
    <input type="hidden" name="boardId" value="${dto.idx}" />
    <input type="hidden" name="writerId" value="${sessionScope.memberId}" />
    <input type="text" name="contents" placeholder="댓글을 입력하세요" required />
    <input type="button" value="댓글 작성" onclick="registComment();" />
</form>

<script>
    function goToModify() {
        const frm = document.getElementById('frmView');
        frm.action = './modify.do';
        frm.method = 'get';  
        frm.submit();
    }

    function goToDelete() {
        const frm = document.getElementById('frmView');
        
        if (confirm('선택한 글을 삭제하시겠습니까?')) {
        	frm.action = './delete.do';
        	frm.method = 'POST';  
        	frm.submit();
        }
    }
    
    function deleteComment(commentId) {
        const frm = document.getElementById('frmCommentList');
        
        if (confirm('댓글을 삭제하시겠습니까?')) {
        	frm.action = '../comment/delete.do';
        	frm.method = 'POST';  
        	frm.submit();
        }
    }
    
//     function deleteComment(commentId) {
//       	 if (confirm("이 댓글을 정말 삭제하시겠습니까?")) {
//       	        const frm = document.getElementById("frmCommentList");
      	        
//       	        const input = document.createElement("input");
//       	        input.type = "hidden";
//       	        input.name = "commentId"; // 서버에서 받는 파라미터
//       	        input.value = commentId;  // 삭제할 댓글 id
      	        
//       	        frm.appendChild(input); 
//       	        frm.action = "deleteComment"; 
//       	        frm.submit(); 
//       	    }
//        }
      function registComment() {
          const frm = document.getElementById('frmComment');
          
          frm.action = '../comment/regist.do';
          frm.method = 'POST';  
          frm.submit();
      }
      
      function registReple() {
          const frm = document.getElementById('frmReply');
          
          frm.action = '../comment/regist.do';
          frm.method = 'POST';  
          frm.submit();
      }
//       function openReplyForm(commentId) {
//     	    const replyForm = document.getElementById(`replyForm${commentId}`);
    	    
//     	    if (replyForm) {
//     	        if (replyForm.style.display === "none" || replyForm.style.display === "") {
//     	            replyForm.style.display = "table-row"; 
//     	        } else {
//     	            replyForm.style.display = "none"; 
//     	        }
//     	    } else {
//     	        console.error(`대댓글 입력 폼을 찾을 수 없습니다. commentId: ${commentId}`);
//     	    }
//     	}
      
      
   
</script>
</body>
</html>