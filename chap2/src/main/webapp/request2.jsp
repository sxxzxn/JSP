<%@page import="java.lang.reflect.Method"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
request.setCharacterEncoding("UTF-8");
String user_id = request.getParameter("user_id2");
String pwd2 = request.getParameter("pwd2");
String age = request.getParameter("age");
String addr1 = request.getParameter("addr1");
String addr2 = request.getParameter("addr2");
String favorite = request.getParameter("favorite");
String[] interest = request.getParameterValues("interest");
String strInter="";
if(interest != null){
	for(int i=0; i<interest.length; i++){
		strInter += interest[i]+" ";
	}
}

// for (String item : interest) {
//     strInter += item + " ";
// }
String introduce = request.getParameter("introduce");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 2. 클라이언트 요청 매개변수</h2>
<ul>
<li>아이디 : <%= request.getParameter("user_id2") %></li>
<li>비밀번호 : <%= request.getParameter("pwd2") %></li>
<li>나이 : <%= request.getParameter("age") %></li>
<li>주소 : <%= request.getParameter("addr1") %></li>
<li>상세주소 : <%= request.getParameter("addr2") %></li>
<li>스포츠 : <%= request.getParameter("favorite") %></li>
<li>관심사항 : <%= strInter %></li>
<li>자기소개 : <%= request.getParameter("introduce") %></li>

</ul>

<%
Class<?> reqClass = request.getClass(); 
Method arrMethods[] = reqClass.getMethods();
for(Method m: arrMethods) {
	out.println("<li>메서드명: "+m.getName()+"</li>");
}

%>

</body>
</html>