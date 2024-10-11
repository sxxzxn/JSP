<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="project.services.MemberService"%>
<!DOCTYPE html>
<html>
<head>
<title>MEMBER INFO</title>
<script>
function checkPassword() {
    var enteredPassword = document.getElementById('pwd').value;
    var correctPassword = "${loginMember.pwd}"; // loginMember 객체의 비밀번호 변수

    if (enteredPassword === correctPassword) {
        alert("비밀번호가 일치합니다.");
        window.location.href = "memberinfo.jsp"; // 비밀번호가 일치할 경우 memberinfo.jsp로 이동
    } else {
        alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
    }
}
	
</script>
</head>
<body id="fixed">
	<header style="width: 100%;">
		<%@ include file="../../navbar.jsp"%>
	</header>
	<div id="form_member">
		<link href="css/insert.css" rel="stylesheet" />

		<h3>MEMBER INFO</h3>
		<h5>${loginMember.name}님 비밀번호 확인 후 정보 확인 및 수정이 가능합니다.</h5>
		<form>

			<div class="input-box">
				<label for="pwd">비밀번호</label> <input type="password" id="pwd"
					name="pwd">
			</div>
			<div>
				<button type="button" onclick="checkPassword()"
					class="submit-button">확인</button>
			</div>
		</form>
	</div>

</body>
<%@ include file="../../other.jsp"%>
</html>
