<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Studio_Hani 회원가입</title>

<link href="css/loginstyles.css" rel="stylesheet" />
<%request.setCharacterEncoding("UTF-8");%>

<script>
	function validateForm() {
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		var confirmPassword = document.getElementById("confirmPassword").value;
		var name = document.getElementById("name").value;
		var address = document.getElementById("address").value;
		var phoneNumber = document.getElementById("phoneNumber").value;
		var gender = document.getElementById("gender").value;
		var age = document.getElementById("age").value;

		// 아이디 유효성 검사: 영어와 숫자로만 구성된 문자열인지 확인
		var usernameRegex = /^[a-zA-Z0-9]+$/;
		if (!usernameRegex.test(username)) {
			alert("아이디는 영어와 숫자로만 입력해야 합니다.");
			return false;
		}

		// 비밀번호 유효성 검사: 숫자, 영어, 특수문자 포함, 최소 8자 이상
		var passwordRegex = /^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[\!\@\#\$\%\^\&\*])[a-zA-Z0-9\!\@\#\$\%\^\&\*]{8,}$/;
		if (!passwordRegex.test(password)) {
			alert("비밀번호는 숫자, 영어, 특수문자를 포함하고 8자 이상이어야 합니다.");
			return false;
		}

		//비밀번호확인
		if (password !== confirmPassword) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			return false;
		}

		// 번호 유효성 검사: 숫자만 입력, 10자리 이상 11자리 이하
		var phoneNumberRegex = /^\d{10,11}$/;
		if (!phoneNumberRegex.test(phoneNumber)) {
			alert("전화번호는 10자리 이상 11자리 이하의 숫자로 입력해야 합니다.");
			return false;
		}
		// 빈칸이 있을경우 넘어가지 않게
		if (username === "" || password === "" || confirmPassword === ""
				|| name === "" || address === "" || phoneNumber === ""
				|| gender === "" || age === "") {
			alert("빈칸을 모두 채워주세요.");
			return false;
		}

		return true;
	}
</script>
</head>
<body>

	<header>
		<%@ include file="../../navbar.jsp"%>
		<h3 style="margin-bottom: 0px;">JOIN</h3>

	</header>
	<div id="form_wrap">
		<form action="insert" method="post" >
			<div class="input-box">
				<input id="username" type="text" name="uid" placeholder="아이디">
				<label for="username">ID</label>
			</div>

			<div class="input-box">
				<input id="password" type="password" name="pwd" placeholder="비밀번호">
				<label for="password">PWD</label>
			</div>

			<div class="input-box">
				<input id="confirmPassword" type="password" name="pwd2"
					placeholder="비밀번호 확인"> <label for="confirmPassword">PWD
					CHECK</label>
			</div>

			<div class="input-box">
				<input id="name" type="text" name="name" placeholder="이름"> <label
					for="name">NAME</label>
			</div>

			<div class="input-box">
				<input id="address" type="text" name="address" placeholder="주소">
				<label for="address">ADDRESS</label>
			</div>

			<div class="input-box">
				<input id="phoneNumber" type="text" name="phone" placeholder="전화번호">
				<label for="phoneNumber">NUMBER</label>
			</div>

			<div class="input-box">
				<input id="age" type="text" name="age" placeholder="나이"> <label
					for="age">AGE</label>
			</div>

			<div class="input-box">
				<input id="gender" type="text" name="gender" placeholder="성별">
				<label for="gender">GENDER</label>
			</div>


			<input type="submit" value="가입하기" class="input-box">
			<div id="forgot">
				<input type="reset" value="다시입력" class="input-box"
					style="background: none; border: none; color: #000; text-decoration: underline; cursor: pointer;">
			</div>
		</form>
	</div>
	<%@ include file="../../other.jsp"%>
</body>
</html>
