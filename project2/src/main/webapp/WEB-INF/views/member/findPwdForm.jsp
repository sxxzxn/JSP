<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Find Pwd</title>
<link href="/project2/css/loginstyles.css" rel="stylesheet" />
</head>
<body id="fixed">

	<%@ include file="../../navbar.jsp"%>

	<header>
		<h3>Find Pwd</h3>
	</header>
	<div id="form_wrap">
		<form action="findPwd" method="post">
			<div class="input-box">
				<input id="username" type="text" name="uid" placeholder="아이디">
				<label for="username">ID</label>
			</div>
			<div class="input-box">
				<input id="name" type="text" name="name" placeholder="이름"> <label
					for="name">NAME</label>
			</div>
			<div class="input-box">
				<input id="age" type="text" name="age" placeholder="나이"> <label
					for="age">AGE</label>
			</div>
			<input type="submit" value="FIND PWD">
		</form>
		<%@ include file="../../other.jsp"%>
	</div>
</body>
</html>
