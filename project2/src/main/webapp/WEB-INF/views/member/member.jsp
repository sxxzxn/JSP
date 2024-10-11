<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="project.dto.Member"%>
<%@ page import="project.services.MemberService"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MEMBER</title>
</head>

<body id="fixed">
	<%@ include file="../../navbar.jsp"%>
	<link href="css/nowmember.css" rel="stylesheet" />
	<div id="bottomMenu">
		<ul>
			<li><a href="member">개인정보확인</a></li>
			<li><a href="updateMemberForm">개인정보수정</a></li>
			<li><a href="remove">회원탈퇴</a></li>
			<li><a href="memberList">전체회원정보</a></li>
		</ul>
	</div>



	<h2>MY PAGE</h2>
	<h3>${loginMember.name}님 현재 정보를 확인하세요.</h3>

	<div class="form_wrap">

		<div class="input-box">
			<input id="username" type="text" name="uid"
				placeholder="ID : ${loginMember.uid }">
		</div>

		<div class="input-box">
			<input id="name" type="text" name="name"
				placeholder="NAME : ${loginMember.name }">
		</div>

		<div class="input-box">
			<input id="password" type="password" name="pwd"
				placeholder="PWD : ${loginMember.pwd}">
		</div>


		<div class="input-box">
			<input id="address" type="text" name="address"
				placeholder="ADDRESS : ${loginMember.address }">
		</div>

		<div class="input-box">
			<input id="phoneNumber" type="text" name="phone"
				placeholder="PHONE : ${loginMember.phone }">
		</div>

		<div class="input-box">
			<input id="age" type="text" name="age"
				placeholder="AGE : ${loginMember.age}">
		</div>

		<div class="input-box">
			<input id="gender" type="text" name="gender"
				placeholder="GENDER : ${loginMember.gender}">
		</div>
	</div>




	<%@ include file="../../other.jsp"%>
</body>

<script>
	function confirmWithdrawal() {
		if (confirm('정말로 회원 탈퇴하시겠습니까?')) {

		} else {

		}
	}
</script>


</body>
</html>