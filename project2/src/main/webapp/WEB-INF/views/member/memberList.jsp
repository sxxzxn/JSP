<%@ page import="java.util.List" %>
<%@ page import="project.dto.Member" %>
<%@ page import="project.services.MemberService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MEMBER</title>
</head>
<body id="fixed">
<%@ include file ="../../navbar.jsp" %>
<link href="/project2/css/memberstyle.css" rel="stylesheet" />
<div id="bottomMenu">
  <ul>
    <li><a href="member">개인정보확인</a></li>
			<li><a href="updateMemberForm">개인정보수정</a></li>
			<li><a href="remove">회원탈퇴</a></li>
			<li><a href="memberList">전체회원정보</a></li>
  </ul>
</div>
<h2>MY PAGE</h2>
  <h3>TOTAL MEMBER LIST</h3>
   <h4 id="memberCount">현재 회원수는 총 ${memberList.size()}명입니다.</h4>
  
  
<div class="form_wrap" >

  <!-- 전체회원출력 -->
        <c:forEach var="member" items="${memberList}">
            <p>아이디: ${member.uid}</p>
            <p>이름: ${member.name}</p>
            <p>비밀번호: ${member.pwd}</p>
            <p>주소: ${member.address}</p>
            <p>전화번호: ${member.phone}</p>
            <p>나이: ${member.age}</p>
            <p>성별: ${member.gender}</p>
            <br>
        </c:forEach>
</div>

<!-- <script>
  function confirmWithdrawal() {
    if (confirm('정말로 회원 탈퇴하시겠습니까?')) {
      window.location.href = "remove.jsp";
    } else {
      // 탈퇴 취소
    }
  }
</script> -->

<%@ include file ="../../other.jsp" %>
</body>
</html>
