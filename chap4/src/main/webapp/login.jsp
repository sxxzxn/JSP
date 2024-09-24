<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@  include file= "./makeCookie.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<%
String loginId = checkCookies(request, response, "loginId");

String cookieCheck="";
if(!loginId.equals("")){
	cookieCheck = "checked";
}


%>

<h2>login</h2>
<div>
	<form name="frmLogin" id="frmLogin" action="loginaction.jsp" method="post">
		<span for="user_id">아이디</span> 
		<input type="text" id="user_id"name="user_id" value="<%=loginId %>" maxlength="20" /> 
		<input type="checkbox"id="save_id_flag" name="save_id_flag" value="Y" <%=cookieCheck %>> 
		<span for="save_id_flag">아이디저장하기</span> 
		<br> <br> 
		<span for="pwd">비밀번호</span> 
		<input type="password" id="pwd" name="pwd" value="" maxlength="10" /> 
		<br> <br> 
		<input type="submit"id="btnLogin" value="로그인" />
	</form>

</div>

<script>
	// const frmLogin = document.getElementById(frmLogin);
	// const btnLogin = document.querySelector(#btnLogin);

	// btnLogin.addEventListener = check function(e){
	// 	e.preventDefault();
	// 	e.stopPropagation();

	// 	const user_id = frmLogin.user_id.value();
	// 	const pwd = frmLogin.pwd.value();

	// 	console.log("user_id : "+user_id);
	// 	console.log("pwd : "+pwd);

	// 	frmLogin.action ="";
	// 	frmLogin.method = "GET";
	// 	frmLogin.sumbit();
	// }
</script>

</body>
</html>