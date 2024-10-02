<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page import="net.fullstack7.common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	// GET으로 넘어온 memberIds
	String members = request.getParameter("members");
	
	if (members != null && !members.isEmpty()) {
		String[] memberIds = members.split(","); // 여러 ID를 배열로 변환
		JDBConnect jdbc = new JDBConnect();
		int intResult = 0;

		try {
			// 다중 삭제 쿼리 구성
			String sql = "DELETE FROM tbl_member WHERE memberId = ?";
			PreparedStatement psmt = jdbc.con.prepareStatement(sql);

			// 각각의 memberId에 대해 삭제 실행
			for (String memberId : memberIds) {
				psmt.setString(1, memberId);
				intResult += psmt.executeUpdate();
			}
			
			// 삭제 결과 처리
			out.print("<script> alert('" + intResult + "명의 회원이 삭제되었습니다.'); window.location.href='./member_list1.jsp'; </script>");
		} catch (Exception e) {
			out.print("<script> alert('삭제 실패: " + e.getMessage() + "'); history.back(); </script>");
		} finally {
			jdbc.close();
		}
	} 
%>


