<%@page import="net.fullstack7.bbs.BbsDTO"%>
<%@page import="net.fullstack7.bbs.BbsDAO"%>
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
<h2> 게시판 등록 페이지 </h2>



<form name ="frmRegist" id="frmRegist" method="POST" enctype="multipart/form-data">
	<table>
		<tr>
			<th>제목 : </th>
			<td><input type="text" name="title" id="title" value="" /></td>
		</tr>
		<tr>
			<th>작성자 : </th>
			<td><input type="text" name="memberid" id="memberid" value="" /></td>
		</tr>
		<tr>
			<th>노출일 : </th>
			<td><input type="date" name="displaydate" id="displaydate" value="" /></td>
		</tr>
		<tr>
			<th>글내용 : </th>
			<td><textarea name="content" id="content"></textarea></td>
		</tr>
		<tr>
			<th>첨부파일 종류 : </th>
			<td>
			<input type="checkbox" name="fileCategory" id="fileCategory_0" value="문서" /> 문서
			<input type="checkbox" name="fileCategory" id="fileCategory_1" value="이미지" /> 이미지
			<input type="checkbox" name="fileCategory" id="fileCategory_2" value="압축파일" /> 압축파일
		</tr>
		<tr>
			<th>첨부파일 : </th>
			<td><input type="file" name="file1" id="file1" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="등록" onclick="goToRegistdo()" />
			</td>
<!-- 			<td colapan="2"> -->
<!-- 				<input type="button" value="취소" onclick="goCancel()" /> -->
<!-- 			</td> -->
		</tr>
	</table>
</form>
<script>
    function goToRegistdo() {
        const frm = document.getElementById('frmRegist');
        frm.action = './regist.do';
        frm.method = 'POST';  
        frm.submit();
    }

//     function goCancel() {
//         const frm = document.getElementById('frmRegist');
//         frm.action = './list.do';
//         frm.method = 'POST';  
//         frm.submit();
//     }
</script>

</body>
</html>