<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MEMBER</title>
</head>
<body id="fixed">
	<%@ include file="../../navbar.jsp"%>
	<link href="css/update.css" rel="stylesheet" />
	<div id="bottomMenu">
		<ul>
			<li><a href="member">개인정보확인</a></li>
			<li><a href="updateMemberForm">개인정보수정</a></li>
			<li><a href="remove">회원탈퇴</a></li>
			<li><a href="memberList">전체회원정보</a></li>
		</ul>
	</div>

	<h2>MY PAGE</h2>
	<h3>${loginMember.name}님 최근 정보로 업데이트 해주세요.</h3>

	<form method="post" action="updateMember"
		style="text-align: center;">

		<div id="form_member">
			
				<div class="input-box">
					<input id="username" type="text" name="uid"
						value="${loginMember.uid}" placeholder="아이디" readonly> <label
						for="username">ID</label>
				</div>

				<div class="input-box">
					<input id="name" type="text" name="name"
						value="${loginMember.name}" placeholder="이름"> <label
						for="name">NAME</label>
				</div>

				<div class="input-box">
					<input id="password" type="text" name="pwd"
						value="${loginMember.pwd}" placeholder="비밀번호"> <label
						for="password">PWD</label>
				</div>

				<div class="input-box">
					<input id="address" type="text" name="address"
						value="${loginMember.address}" placeholder="주소"> <label
						for="address">ADDRESS</label>
				</div>

				<div class="input-box">
					<input id="phoneNumber" type="text" name="phone"
						value="${loginMember.phone}" placeholder="전화번호"> <label
						for="phoneNumber">PHONE</label>
				</div>

				<div class="input-box">
					<input id="age" type="text" name="age" value="${loginMember.age}"
						placeholder="나이"> <label for="age">AGE</label>
				</div>

				<div class="input-box">
					<input id="gender" type="text" name="gender"
						value="${loginMember.gender}" placeholder="성별"> <label
						for="gender">GENDER</label>
				</div>

				<button type="submit" onclick="showAlert()" class="submit-button">수정</button>
			
		</div>
	</form>


	<%@ include file="../../other.jsp"%>
</body>
</html>
