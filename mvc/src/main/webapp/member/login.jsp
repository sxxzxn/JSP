<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="../default/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
</head>
<body>
    <h2>로그인</h2>
    <form id ="frmLogin" method="post">
        <label for="memberId">아이디: </label>
        <input type="text" name="memberId" id="memberId" required><br>
        <label for="password">비밀번호: </label>
        <input type="password" name="pwd" id="pwd" required><br>
        <input type="button" value="로그인" onclick="goLogin();">
    </form>
    <p style="color: red;"><c:out value="${errMsg}"/></p>
    
    
<script>
    function goLogin() {
        const frm = document.getElementById('frmLogin');
        frm.action = './login.do';
        frm.method = 'POST';  
        frm.submit();
    }
</script>

</body>
</html>