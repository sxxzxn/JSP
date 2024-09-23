<%@page import="dto.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>request 영역</h2>
<%
String reqType = request.getParameter("reqType");
%>
<%
request.setAttribute("req1", "request 영역");
request.setAttribute("reqStudent", new StudentDTO ("2020", "하니", 3, "강아지", 2));
%>
<%
request.removeAttribute("req1");
request.removeAttribute("req2");// 없는값해도 에러 발생 x 
%>

<h2>requset 영역 속성갑 조회</h2>
<%	
Object req1 = request.getAttribute("req1");
Object reqStudent = request.getAttribute("reqStudent");
 %>
 
 


 <ul> 
 <li>req1 문자열 정보: <%=(req1 != null ? req1.toString() : "") %></li>
 </ul>
<% 
 if (reqStudent != null) {
			StudentDTO pageStudent2 = (StudentDTO) reqStudent;
%>
	<ul>
		<li>번호 : <%=pageStudent2.getNo()%></li>
		<li>이름 : <%=pageStudent2.getName()%></li>
		<li>나이 : <%=pageStudent2.getAge()%></li>
		<li>등급 : <%=pageStudent2.getDept()%></li>
		<li>학년 : <%=pageStudent2.getGrade()%></li>
	</ul> 
	<%}%>
<%
if( reqType != null && reqType.equalsIgnoreCase("send")){
// 	response.sendRedirect("req2.jsp?user_id=user1&pwd=12dd34");
	response.sendRedirect("req2.jsp");
}else if (reqType != null && reqType.equalsIgnoreCase("req")){
// 	request.getRequestDispatcher("req2.jsp?user_id=user1&pwd=1234").forward(request,response);
	request.getRequestDispatcher("req2.jsp").forward(request,response);
}
%>


<br><a href="req2.jsp">페이지 이동 소멸</a>
<br><a href="req.jsp?reqType=send">send</a>	
<br><a href="req.jsp?reqType=req"> forward</a>	
	

</body>
</html>