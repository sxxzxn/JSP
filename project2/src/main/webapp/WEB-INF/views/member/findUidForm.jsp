<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<link href="/project2/css/loginstyles.css" rel="stylesheet" />
</head>
<body id="fixed">

	<%@ include file="../../navbar.jsp"%>
	<%request.setCharacterEncoding("UTF-8");%>
	<header>
		<h3>Find Id</h3>
	</header>
	<div id="form_wrap">
		<form action="findUid" method="get">

			<div class="input-box">
				<input id="name" type="text" name="name" placeholder="이름"> <label
					for="name">NAME</label>
			</div>
			<div class="input-box">
				<input id="age" type="text" name="age" placeholder="나이"> <label
					for="age">AGE</label>
			</div>
			<input type="submit" value="FIND ID">
		</form>
	</div>
	<%@ include file="../../other.jsp"%>
</body>
</html>
