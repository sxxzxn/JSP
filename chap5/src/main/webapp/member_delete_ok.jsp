<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page import="common.DBConnPool"%>
<%@ page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	String memberId = request.getParameter("memberId");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	
%>
<%
String sql = "DELETE FROM tbl_member WHERE memberId = ?;" ;
JDBConnect jdbc = new JDBConnect();
int intResult = -1;
try {
	PreparedStatement psmt = jdbc.con.prepareStatement(sql); // 동적쿼리
	psmt.setString(1, memberId);
	intResult = psmt.executeUpdate();
	out.print("<script> alert('회원삭제 성공.'); window.location.href='./member_list1.jsp; </script>");
} catch (Exception e) {
// 	request.getRequestDispatcher("member_regist.jsp").forward(request, response);
	out.print("<script> alert('삭제 실패: " + e.getMessage() + "'); history.back(); </script>");
} finally {
	jdbc.close();
}
%>