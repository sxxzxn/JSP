<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="../default/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bbsStyles.css">
</head>
<body>
<h2> 게시글 수정 </h2>
<form name ="frmModify" id="frmModify" method="POST" action="./modify.do" enctype="multipart/form-data">
	<table>
		<tr>
			<th>제목 : </th>
			<td><input type="text" name="title" id="title" value="글제목" /></td>
		</tr>
		<tr>
			<th>작성자 : </th>
			<td><input type="text" name="memberid" id="memberid" value="user1" /></td>
		</tr>
		<tr>
			<th>노출일 : </th>
			<td><input type="date" name="displaydate" id="displaydate" value="2024-10-14" /></td>
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
			<td>
				<input type="submit" value="수정" />
			</td>
			<td>
				<input type="submit" value="삭제" />
			</td>
		</tr>
	</table>
</form>
</body>
</html>