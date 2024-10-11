<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="project.dao.MemberDAO"%>
<%@ page import="project.services.MemberService"%>
<%@ page import="project.dto.Member"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>    



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>로그인 결과</title>
    <script>
        function showFailureAlert() {
            alert("아이디 또는 비밀번호가 잘못되었습니다");
            window.history.back();
        }
    </script>
</head>
<body>
    <%-- 로그인 성공 시에만 해당 블록을 실행 --%>
    <c:if test="${not empty loginMember}">
        <%
        // loginMember 객체를 서블릿에서 받아옴
        Member loginMember = (Member) request.getAttribute("loginMember");
        session.setAttribute("loginMember", loginMember);
        String name = loginMember.getName();     
        String message = name + " 님 로그인이 되었습니다.";
        %>
        <script>
            alert("<%= message %>");
            window.location.href = "../../index.jsp";
        </script>
    </c:if>

    <%-- 로그인 실패 시에만 해당 블록을 실행 --%>
    <c:if test="${empty loginMember}">
        <script>
            showFailureAlert();
        </script>
    </c:if>
</body>
</html>
