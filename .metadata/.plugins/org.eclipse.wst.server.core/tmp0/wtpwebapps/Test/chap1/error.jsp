<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page errorPage ="error2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>
page 지시어 = errorPage, isErrorPage 속성
</h2>

<% 
try{
	int age= Integer.parseInt(request.getParameter("age"));
	out.print("현재나이는 "+ age +"입니다.");
} catch(Exception e){
	e.getStackTrace();
	out.print(e.getMessage()+"<br>"+e.getClass().getName());
// 	로그남기기
}


try{
	int age= Integer.parseInt(request.getParameter("age"));
	out.print("현재나이는 "+ age +"입니다.");
} catch(Exception e){
	e.getStackTrace();
	out.print(e.getMessage()+"<br>"+e.getClass().getName());
// 	로그남기기
}
%>

</body>
</html>