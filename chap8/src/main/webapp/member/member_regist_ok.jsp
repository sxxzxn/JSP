<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.fullstack7.member.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page import="net.fullstack7.common.DBConnPool"%>
<%@ page import="net.fullstack7.common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	String memberId = request.getParameter("memberId");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	
	
// 	if(memberId.length() < 4 || memberId.length() > 20) {
// 		out.print("<script> alert('아이디 정보가 올바르지 않습니다.'); history.back(); </script>");
// 	}
// 	if(name.length() <= 0 || memberId.length() > 20) {
// 		out.print("<script> alert('이름 정보가 올바르지 않습니다.'); history.back(); </script>");
// 	}
// 	if(pwd.length() < 4 || pwd.length() > 20) {
// 		out.print("<script> alert('비밀번호 정보가 올바르지 않습니다.'); history.back(); </script>");
// 	}
%>
<%
MemberDAO dao = new MemberDAO();
Map<String, Object> memberRegist = new HashMap<>();
memberRegist.put("memberId",memberId);
memberRegist.put("name",name);
memberRegist.put("pwd",pwd);
int result = dao.setMemberRegist(memberRegist);

if (result>0){
	response.sendRedirect("../bbs/list.jsp");   
}else{
	out.print("실패") ;
}


// int intResult = -1;
// try {
// 	PreparedStatement psmt = jdbc.con.prepareStatement(sql); // 동적쿼리
// 	psmt.setString(1, memberId);
// 	psmt.setString(2, name);
// 	psmt.setString(3, pwd);
// 	intResult = psmt.executeUpdate();
// 	out.print("<script> alert('회원정보를 등록하였습니다.'); window.location.href='./member_list1.jsp'; </script>");
// } catch (Exception e) {
// // 	request.getRequestDispatcher("member_regist.jsp").forward(request, response);
// 	out.print("<script> alert('등록 실패'); history.back(); </script>");
// } finally {
// 	jdbc.close();
// }
%>