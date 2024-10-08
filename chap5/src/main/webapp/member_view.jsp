<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>
<style>
table, thead, tbody, th, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>

	<h2>회원 상세 정보</h2>
	<%
	String memberId = request.getParameter("memberId");
	String name = "";
	String pwd = "";

	if (memberId != null && !memberId.isEmpty()) {
		JDBConnect jdbc = new JDBConnect();
		String sql = "SELECT memberId, name, pwd FROM tbl_member WHERE memberId = ?";
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		psmt.setString(1, memberId);
		ResultSet rs = psmt.executeQuery(); // 조회할때만,insert delect 일때는 int 로해서 1 이상일때 

		if (rs.next()) {
			
			memberId = rs.getString("memberId");
			name = rs.getString("name");
			pwd = rs.getString("pwd");	
	%>
	<form id="frmMember">

		<table>
			<tbody>
				<tr>
					<td class="input_title">아이디</td>
					<td><%=memberId%></td>
				</tr>
				<tr>
					<td class="input_title">이름</td>
					<td><%=name%></td>
				</tr>
				<tr>
					<td class="input_title">비밀번호</td>
					<td><%=pwd%></td>
				</tr>
				<tr>
					<td colspan="2" class="center">
					<input type="button" id="btnOK"value="확인" />
					<input type="button" id="btnModify"value="수정" />
					</td>
				</tr>
			</tbody>
		</table>

	</form>
	<%
	} else {
		out.print("<script> alert('일치하는 아이디가 없습니다'); history.back(); </script>");
		}

	} else{
		out.print("<script> alert('입력된 값이 없습니다'); history.back(); </script>");
	}
	%>
	<script>
		const btnRegist = document.getElementById("btnOK");
		btnRegist.addEventListener("click", function(e) {
			e.preventDefault();
			e.stopPropagation();
			location.href = "./member_list1.jsp";
		});
		
		const btnModify = document.getElementById("btnModify");
		btnModify.addEventListener("click", function(e) {
			e.preventDefault();
			e.stopPropagation();

			location.href = "./member_modify.jsp?memberId=<%=memberId%>";
		});
	</script>

</body>
</html>