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
	<link href="/project2/css/memberstyle.css" rel="stylesheet" />
	<div id="bottomMenu">
		<ul>
			<li><a href="member">개인정보확인</a></li>
			<li><a href="updateMemberForm">개인정보수정</a></li>
			<li><a href="remove" onclick="confirmWithdrawal()">회원탈퇴</a></li>
			<li><a href="memberList">전체회원정보</a></li>
		</ul>
	</div>

	<div id="form_warp">

		<h2>MY PAGE</h2>
		<h3>${loginMember.name }님 원하시는 버튼을 눌러주세요.</h3>
	</div>




	<%@ include file="../../other.jsp"%>
</body>

<script>
	function confirmWithdrawal() {
		if (confirm('정말로 회원 탈퇴하시겠습니까?')) {

			window.location.href = "remove.jsp";
		} else {

		}
	}
</script>
</html>
