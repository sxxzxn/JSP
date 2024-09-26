<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utils.JDBConnect"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="inc_func.jsp" %>
<%
JDBConnect jdbc = new JDBConnect();
String sql = "SELECT memberId, pwd FROM tbl_member";
PreparedStatement psmt = jdbc.con.prepareStatement(sql);
ResultSet rs = psmt.executeQuery();
%>



<%
String user_id = request.getParameter("user_id");
String nama = request.getParameter("memberName");
String pwd = request.getParameter("pwd");
String saveIdFlag = request.getParameter("save_id_flag");

// if (user_id == null || user_id.length() < 4 || user_id.length() > 20 ) {
// 	out.print("<script>");
// 	out.print("alert('아이디 정보가 올바르지 않습니다.');");
// 	out.print("window.location.replace('login.jsp');");
// 	out.print("</script>");
// 	out.close();
// }
// if (pwd == null || pwd.length() < 4 || pwd.length() > 20 ) {
// 	out.print("<script>");
// 	out.print("alert('비밀번호 정보가 올바르지 않습니다.');");
// 	out.print("window.location.replace('login.jsp');");
// 	out.print("</script>");
// 	out.close();
// }

// if ( saveIdFlag != null && saveIdFlag.equals("Y") ) {
// 	setCookiesInfo(request, response, "/", 10, "", "save_id_flag", saveIdFlag);
// 	setCookiesInfo(request, response, "/", 10, "", "save_user_id", user_id);
// }

session.setAttribute("memberId", user_id);
session.setAttribute("memberName", nama);

response.sendRedirect("login.jsp");

%>