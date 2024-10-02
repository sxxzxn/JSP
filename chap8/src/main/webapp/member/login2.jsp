<%@page import="java.util.List"%>
<%@page import="net.fullstack7.member.MemberDTO"%>
<%@page import="net.fullstack7.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="inc_func.jsp" %>

<style>
/* span { */
/* 	width : 200px; */
/* 	length : 200px; */
/* } */

</style>
<%
String memberId = (String) session.getAttribute("memberId");
String memberName = (String) session.getAttribute("memberName");
String save_id_flag ="";
String savedId = getCookiesInfo(request, "save_user_id");
// String save_id_flag = getCookiesInfo(request, "save_id_flag");
// String save_memberId = (save_id_flag!=null && save_id_flag.equals("Y") ? getCookiesInfo(request, "save_memberId") : "");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
</head>
<body>

<h2>로그인 페이지</h2>

<% if (memberId == null) { %>
<form name="frmLogin" id="frmLogin" action="login_ok2.jsp" method="post">
    <span for="memberId">아이디</span>
    <input type="text" id="memberId" name="memberId" value="<%= savedId %>" maxlength="20" />
    <input type="checkbox" id="save_id_flag" name="save_id_flag" value="Y"   <% if (!savedId.isEmpty()) { %>checked<% } %>/> 
    <span for="save_id_flag">아이디 저장</span>
    <br><br>
    <span for="pwd">비밀번호</span>
    <input type="password" id="pwd" name="pwd" value="" maxlength="20" />
    <br><br>
    <input type="submit" id="btnLogin" value="로그인" />
</form>
<% } else { %>
    <p><%= memberId %> 회원님, 로그인 성공!</p>
    <a href="logout.jsp">로그아웃</a>
<% } %>

<%
String dbDriver = application.getInitParameter("MariaDriver");
String dbUrl = application.getInitParameter("MariaURL");
String dbId = application.getInitParameter("dbId");
String dbPwd = application.getInitParameter("dbPwd");

MemberDAO dao = new MemberDAO();
List<MemberDTO> mList = dao.getMemberList();

if(mList != null && ! mList.isEmpty()){
%>
<table>
	<tr>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
	</tr>
	<%
	for (MemberDTO member : mList){
	%>
	<tr>
		<td><%=member.getMemberId() %></td>
		<td><%=member.getPwd() %></td>
		<td><%=member.getName() %></td>
	</tr>
	<%
	}
	%>
</table>
<% 
} else{
%>
회원x
<%
}
%>
<script>
const frmLogin = document.getElementById("frmLogin");
const btnLogin = document.getElementById("btnLogin");
btnLogin.addEventListener("click", function(e){
	e.preventDefault();
	e.stopPropagation();
	
	
	const memberId = frmLogin.memberId.value;
	const pwd = frmLogin.pwd.value;
	
// 	console.log("memberId : "+ memberId);
// 	console.log("pwd : "+ pwd);
	frmLogin.submit();
});
</script>
</body>
</html>