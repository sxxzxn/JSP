<%@page import="net.fullstack7.member.MemberDTO"%>
<%@page import="net.fullstack7.member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
String nama = request.getParameter("memberName");
String pwd = request.getParameter("pwd");
String saveIdFlag = request.getParameter("save_id_flag");
String saveUserId = request.getParameter("save_user_id");



MemberDTO memberDTO = new MemberDTO();
memberDTO.setMemberId(memberId);
memberDTO.setName("이름");
memberDTO.setSaveIdFlag(saveIdFlag);



MemberDAO dao = new MemberDAO();
MemberDTO dto = new MemberDTO();
dto = dao.getMemberInfo(memberId,pwd);
// dao.close();

if (dto != null && dto.getMemberId() != null){
    session.setAttribute("memberId", dto.getMemberId());
	session.setAttribute("memberName", dto.getName());
	session.setAttribute("role", dto.getRole());

	if ( saveIdFlag != null && saveIdFlag.equals("Y") ) {
		setCookiesInfo(request, response, "/", 10, "", "save_id_flag", dto.getSaveIdFlag());
		setCookiesInfo(request, response, "/", 10, "", "save_user_id", dto.getMemberId());
	} 
	
	response.sendRedirect("../bbs/list.jsp");    
}else {
    out.print("<script>");
    out.print("alert('아이디 또는 비밀번호가 잘못되었습니다.');");
    out.print("window.location.replace('login2.jsp');");
    out.print("</script>");
}

// DBConnPool dbcp = new DBConnPool();
// String sql = "SELECT memberId, pwd FROM tbl_member WHERE memberId = ? AND pwd = ?";
// PreparedStatement psmt = dbcp.con.prepareStatement(sql);
// psmt.setString(1, memberId);
// psmt.setString(2, pwd);
// ResultSet rs = psmt.executeQuery();

// if (memberId == null || memberId.length() < 4 || memberId.length() > 20 ) {
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
// 	setCookiesInfo(request, response, "/", 10, "", "save_id_flag", memberDTO.getSaveIdFlag());
// 	setCookiesInfo(request, response, "/", 10, "", "save_user_id", memberDTO.getMemberId());
// }

// if (rs.next()) {
//     session.setAttribute("memberId", memberDTO.getMemberId());
//     session.setAttribute("memberName", memberDTO.getName());
    
    
//     if ( saveIdFlag != null && saveIdFlag.equals("Y") ) {
//     	setCookiesInfo(request, response, "/", 10, "", "save_id_flag", memberDTO.getSaveIdFlag());
//     	setCookiesInfo(request, response, "/", 10, "", "save_user_id", memberDTO.getMemberId());
//     } else {
//         setCookiesInfo(request, response, "/", 0, null, "save_user_id", "");  // 쿠키 삭제
//     }

//     response.sendRedirect("login2.jsp");
    
// } else {
//     out.print("<script>");
//     out.print("alert('아이디 또는 비밀번호가 잘못되었습니다.');");
//     out.print("window.location.replace('login2.jsp');");
//     out.print("</script>");
//     dbcp.close();
// }
%>
</body>
</html>