<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.fullstack7.member.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page import="net.fullstack7.common.DBConnPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	String memberId = request.getParameter("memberId");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	
	

	if(name.length() <= 0 || name.length() > 20) {
		out.print("<script> alert('이름 정보가 올바르지 않습니다.'); history.back(); </script>");
	}
	if(pwd.length() < 4 || pwd.length() > 20) {
		out.print("<script> alert('비밀번호 정보가 올바르지 않습니다.'); history.back(); </script>");
	}
%>
<%
MemberDAO dao = new MemberDAO();
Map<String, Object> memberModify = new HashMap<>();
memberModify.put("name", name);
memberModify.put("pwd", pwd);
memberModify.put("memberId", memberId);

int result = dao.setMemberModify(memberModify);

if (result>0){
	response.sendRedirect("member_list1.jsp");   
}else{
	out.print("실패") ;
	response.sendRedirect("member_list1.jsp");
}
// String sql = "UPDATE tbl_member SET name = ?, pwd = ? WHERE memberId = ?;" ;
// JDBConnect jdbc = new JDBConnect();
// int intResult = -1;
// try {
// 	PreparedStatement psmt = jdbc.con.prepareStatement(sql); // 동적쿼리
// 	psmt.setString(1, name);
// 	psmt.setString(2, pwd);
// 	psmt.setString(3, memberId);
// 	intResult = psmt.executeUpdate();
// 	out.print("<script> alert('회원정보를 수정하였습니다.'); history.back();; </script>");
// } catch (Exception e) {
// // 	request.getRequestDispatcher("member_regist.jsp").forward(request, response);
// 	out.print("<script> alert('수정 실패: " + e.getMessage() + "'); history.back(); </script>");
// } finally {
// 	jdbc.close();
// }
%>