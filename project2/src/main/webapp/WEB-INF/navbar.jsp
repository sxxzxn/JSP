<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/project2/css/navbar_header.css" rel="stylesheet">
</head>
<body>
    <div class="navbar">
        <header>
            <a class="logo" href="main">Studio_Hani</a>
            <ul id="topMenu">
                <li><a href="#">ROOM<span></span></a>
                    <ul>
                        <li><a href="#">A Room</a></li>
                        <li><a href="#">B Room</a></li>
                        <li><a href="#">C Room</a></li>
                    </ul>
                </li>
                <li><a href="#">CONTACT <span></span></a>
                    <ul>
                        <li><a href="#">SCHEDULE</a></li>
                        <li><a href="#">RESERVATION</a></li>
                    </ul>
                </li>
                <li><a href="info">INFO<span></span></a>
                    <ul>
                        <li><a href="noticeList">NOTICE</a></li>
                        <li><a href="boardList">Q&A</a></li>
                        <li><a href="#">GUIDE</a></li>
                    </ul>
                </li>
               <c:choose>
    <c:when test="${sessionScope.loginMember != null}">
        <li>
            <a href="memberInfo">MEMBER<span></span></a>
            <ul>
                <li><a href="logout">LOGOUT</a></li>
                <li><a href="memberInfo">MEMBER INFO</a></li>
                <li><a href="memberList">TOTAL</a></li>
            </ul>
        </li>
    </c:when>
    <c:otherwise>
        <li>
            <a href="loginForm">MEMBER<span></span></a>
            <ul>
                <li><a href="loginForm">LOGIN</a></li>
                <li><a href="insertTerms">JOIN</a></li>
            </ul>
        </li>
    </c:otherwise>
</c:choose>
            </ul>
        </header>
    </div>

    <!-- <script>
        function viewProfile() {
            window.open("/project2/member/checkpwd.jsp");
        }

        function logout() {
            if (confirm("로그아웃 하시겠습니까?")) {
                location.href = "/project2/member/logout.jsp";
            }
        }

        function goToLoginForm() {
            location.href = "loginForm";
            
        function goToInsertTerms() {
           location.href = "insertTerms";
           console.log("확인용");
        }
    </script> -->
</body>
</html>
