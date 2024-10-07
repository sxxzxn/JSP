<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>EL - form 값 전송 </h2>


<form name="frm" id="frm" action="form_ok.jsp" method="post">
<span for="memberId"> 아이디 : </span>
<input type="text" name="memberId" id="memberId" value=""/>
<br>
<span for="name"> 이름 : </span>
<input type="text" name="name" id="name" value=""/>
<br>
<span for="gender_0"> 성별 : </span>
<input type="radio" name="gender" id="gender_0" value="여자" /> 여자
<input type="radio" name="gender" id="gender_1" value="남자" /> 남자
<br>
<span for="school">학력</span>
<select name="school" id="school">
	<option value="초등학교">초등학교</option>
	<option value="중학교">중학교</option>
	<option value="고등학교">고등학교</option>
	<option value="대학교">대학교</option>
</select>
<br>
<span for="hobby_0">취미</span>
<input type="checkbox" name="hobby" id="hobby_0" value="축구" /> 축구
<input type="checkbox" name="hobby" id="hobby_1" value="농구" /> 농구
<input type="checkbox" name="hobby" id="hobby_2" value="배구" /> 배구
<input type="checkbox" name="hobby" id="hobby_3" value="야구" /> 야구
<br><br>

<input type="submit" value="전송" /> 
</form>

</body>
</html>