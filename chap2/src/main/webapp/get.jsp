<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>1. 클라이언트 / 서버 환경정보 조회</h2>
<a href="request1.jsp?user_id=user1&pwd=1234">GET 전송 방식</a>
<br>

<form action=request1.jsp?param1=1234&amp;param2=abcd method="post">
<span for="user_id">아이디 : </span>
<input type = "text" name="user_id" id="user_id" value="user1" /> 
<span for="pwd">비밀번호 : </span>
<input type = "password" name="pwd" id="pwd" value="1234" />
<br>
<input type="submit" value="POST 전송" />
</form>
<hr>

<h2>2. 클라이언트 요청 매개변수 조회</h2>
<form action=request2.jsp method="post">
<span for="user_id2">아이디 : </span>
<input type = "text" name="user_id2" id="user_id2" value="" /> 
<span for="pwd2">비밀번호 : </span>
<input type = "password" name="pwd2" id="pwd2" value="" />
<br>
<span for="age">나이 : </span>
<input type = "text" name="age" id="age" value="" />
<span for="addr1">주소 : </span>
<input type = "text" name="addr1" id="addr1" value="" /> 
<br>
<span for="addr2">상세주소 : </span>
<input type = "text" name="addr2" id="addr2" value="" /> 
<br>
<span for="favorite">좋아하는 스포츠 : </span>
<input type = "radio" name="favorite" id="favorite_01" value="축구" /> 축구&nbsp;&nbsp;
<input type = "radio" name="favorite" id="favorite_02" value="야구" /> 야구&nbsp;&nbsp;
<input type = "radio" name="favorite" id="favorite_03" value="농구" /> 농구&nbsp;&nbsp;
<input type = "radio" name="favorite" id="favorite_04" value="배구" /> 배구&nbsp;&nbsp;
<br>
<span for="interest">관심사항 : </span>
<input type = "checkbox" name="interest" id="interest_01" value="경제" /> 경제&nbsp;&nbsp;
<input type = "checkbox" name="interest" id="interest_02" value="시사" /> 시사&nbsp;&nbsp;
<input type = "checkbox" name="interest" id="interest_03" value="연예" /> 연예&nbsp;&nbsp;
<input type = "checkbox" name="interest" id="interest_04" value="스포츠" /> 스포츠&nbsp;&nbsp;
<br>
<span for="introduce">상세주소 : </span>
<textarea name="introduce" id="introduce" value=""></textarea> 
<br>
<input type="submit" value="전송" />
</form>

<hr>

<h2>3. HTTP 요청 헤더 정보 읽기</h2>
<a href=request3.jsp>요청 헤더 정보 조회</a>
</body>
</html>