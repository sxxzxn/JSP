<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="common.CommonUtils"%>
<%
// public String getCookiesInfo(HttpServletRequest req, String cName){
// 	Cookie[] cookies = req.getCookies();	// 요청 헤더에 있는 모든 쿠키 조회
// 	if ( cookies != null ){
// 		for(Cookie c : cookies){
// 			String cookieName = c.getName();
// 			String cookieValue= c.getValue();

// 			if ( cookieName.equals(cName) ) return cookieValue;
// 		}
// 	}
	
// 	return "";
// }
%>
<%//@include file="inc_func.jsp" %>
<%
// String save_id_flag = getCookiesInfo(request, "save_id_flag");
// String save_user_id = (save_id_flag!=null && save_id_flag.equals("Y") ? getCookiesInfo(request, "save_user_id") : "");


String member_id = (String) session.getAttribute("memberId");
String save_id_flag ="";
String save_user_id ="";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>로그인 페이지</h2>

<%if (member_id == null) {%>
<form name="frmLogin" id="frmLogin" action="login_ok2.jsp?" method="get">
	<span for="user_id">아이디</span> <input type="text" id="user_id" name="user_id" value="" maxlength="20" />
	<input type="checkbox" id="save_id_flag" name="save_id_flag" value="Y" /> <span for="save_id_flag">아이디 저장</span>
	<br><br>
	<span for="pwd">비밀번호</span> <input type="password" id="pwd" name="pwd" value="" maxlength="20" />
	<br><br>
	<input type="submit" id="btnLogin" value="로그인" />
<%
}else{ 
	out.print(member_id+"회원님, 로그인 성공!<br>");
%>
<a href="logout.jsp;">로그아웃</a>
<%
}
%>

</form>



<script>
const frmLogin = document.getElementById("frmLogin");
const btnLogin = document.getElementById("btnLogin");
btnLogin.addEventListener("click", function(e){
	e.preventDefault();
	e.stopPropagation();
	
	
	const memberId = frmLogin.memberId.value;
	const pwd = frmLogin.pwd.value;
	if ( user_id.length < 4 || user_id.length > 20 ) {
		alert("아이디를 4자리 이상 20자리 이하로 입력하세요");
		frmLogin.user_id.focus();
		return;
	}
	if ( pwd.length < 4 || pwd.length > 20 ) {
		alert("비밀번호를 4자리 이상 20자리 이하로 입력하세요");
		frmLogin.pwd.focus();
		return;
	}
	console.log("memberId : "+ memberId);
	console.log("pwd : "+ pwd);
	//frmLogin.action = "login_ok.jsp";
	//frmLogin.method = "GET";
	frmLogin.submit();
});



}
</script>
</body>
</html>