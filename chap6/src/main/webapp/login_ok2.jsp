<%@page import="utils.DBConnPool"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utils.JDBConnect"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="inc_func.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
</head>
<body>
<%
String memberId = request.getParameter("memberId");
String pwd = request.getParameter("pwd");
String saveIdFlag = request.getParameter("save_id_flag");

DBConnPool dbcp = new DBConnPool();
String sql = "SELECT memberId, pwd FROM tbl_member WHERE memberId = ? AND pwd = ?";
PreparedStatement psmt = dbcp.con.prepareStatement(sql);
psmt.setString(1, memberId);
psmt.setString(2, pwd);
ResultSet rs = psmt.executeQuery();

if (rs.next()) {
    session.setAttribute("memberId", memberId);
    response.sendRedirect("login2.jsp");
    
} else {
    out.print("<script>");
    out.print("alert('아이디 또는 비밀번호가 잘못되었습니다.');");
    out.print("window.location.replace('login2.jsp');");
    out.print("</script>");
    dbcp.close();
}
%>
</body>
</html>