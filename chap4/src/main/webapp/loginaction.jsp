<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@  include file= "./makeCookie.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String user_id = request.getParameter("user_id");
String pwd = request.getParameter("pwd");
String save_id_flag = request.getParameter("save_id_flag");


if("user1".equals(user_id) && "1234".equals(pwd)){
	if(save_id_flag != null && save_id_flag.equals("Y")){
		setCookie(response, "loginId", user_id, 100,"/");
	}
	response.getWriter().println("<script>alert('로그인 성공');</script>");
}else{
	response.getWriter().println("<script>alert('로그인 실패');</script>");
}
%>

</body>
</html>