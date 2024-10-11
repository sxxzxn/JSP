<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Studio_Hani_login</title>
<link href="/project2/css/loginstyles.css" rel="stylesheet" />
</head>
<body>

	<%@ include file="../../navbar.jsp"%>

	<header>
		<h3>Login</h3>
	</header>
	<div id="form_wrap">
		<form action="login" method="post" autocomplete="off">
			<div class="input-box">
				<input id="username" type="text" name="uid" placeholder="아이디">
				<label for="username">ID</label>
			</div>

			<div class="input-box">
				<input id="password" type="password" name="pwd" placeholder="비밀번호">
				<label for="password">PWD</label>
			</div>
			<div id="forgot">
				<a href="findUidForm">FORGOT ID / </a> <a href="findPwdForm">FORGOT
					PASSWORD</a>
			</div>
			<input type="submit" value="LOGIN">
		</form>


		<div class="membership-benefits">
			<h2>스튜디오 하니 멤버쉽 혜택</h2>
			<p>등급별 혜택과 적립금을 받아보세요!</p>
		</div>


		<div class="sign-up-box">
			<h3 style="margin-bottom: 0px;">Join</h3>
			<form action="insertTerms" name="form" method="post">
				<div class="sign-up-box.input-box">
					<input type="submit" value="JOINN US">
				</div>
			</form>
		</div>
		<%@ include file="../../other.jsp"%>
</body>
</html>