<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
<style>
table, thead, tbody, th, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
<h2> 회원 수정</h2>
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
		}
		else {
		    System.out.println("데이터가 조회되지 않았습니다.");
		    out.print("<script> alert('일치하는 아이디가 없습니다'); history.back(); </script>");
		}
}
%>
<form id="frmModify" action="member_modify_ok.jsp" method="POST">
<table>
	<tbody>
	<tr>
		<td class="input_title">아이디</td>
		<td><input type="text" name="memberId" value="<%=memberId%>" readonly maxlength="20"/></td>
	</tr>
	<tr>
		<td class="input_title">이름</td>
		<td><input type="text" name="name" value="<%=name%>" maxlength="20"/></td>
	</tr>
	<tr>
		<td class="input_title">비밀번호</td>
		<td><input type="password" name="pwd" value="<%=pwd%>" maxlength="20"/></td>
	</tr>
	<tr>
		<td colspan="5" class="center"></td>
	</tr>
	<tr>
		<td colspan="5" class="center">
			<input type="button" id="btnModify" value="수정" />
			<input type="button" id="btnCancle" value="취소" />
		</td>
	</tr>
	</tbody>
</table>
</form>

<script>
const btnModify = document.getElementById("btnModify");
btnModify.addEventListener("click", function(e){
	e.preventDefault();
	const frm = document.getElementById('frmModify'); // 수정된 부분
	const memberName = frm.name.value;
	const pwd = frm.pwd.value;

	if(memberName.length < 2 || memberName.length > 20){
		alert("이름을 입력하세요");
		frm.name.focus();
		return;
	}
	if(pwd.length < 4 || pwd.length > 20){
		alert("비밀번호를 4자리 이상 20자리 이하로 입력하세요");
		frm.pwd.focus();
		return;
	}
	frm.action = "./member_modify_ok.jsp?";
	frm.method= "POST";
	frm.submit();
});


const btnCancle = document.getElementById("btnCancle");
btnCancle.addEventListener("click", function(e) {
	e.preventDefault();
	e.stopPropagation();
	location.href = "./member_list1.jsp";
});
</script>
</body>
</html>