<%@ page import="dto.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pageContext2</title>
</head>
<body>


	<%
	String no = ""; // String no = null; null.toString(); 를 한거랑 같다
	String name = "";
	int age = 0;
	String dept = "";
	int grade = 0;
	StudentDTO pageStudent = null;
	
	if (pageContext.getAttribute("pageStNo") != null) {
		no = pageContext.getAttribute("pageStNo").toString();
	}
	// String no = (String) pageContext.getAttribute("pageStNo");
	if (pageContext.getAttribute("pageStName") != null) {
		name = pageContext.getAttribute("pageStName").toString();
	}
	if(pageContext.getAttribute("pageStAge") != null){
		age = (Integer) pageContext.getAttribute("pageStAge");
	}
	if (pageContext.getAttribute("pageStDept") != null) {
		dept = pageContext.getAttribute("pageStDept").toString();
	}
	if(pageContext.getAttribute("pageStGrade") != null){
		grade = (Integer) pageContext.getAttribute("pageStGrade");
	}
	if(pageContext.getAttribute("pageStudent") != null){
		pageStudent = (StudentDTO) pageContext.getAttribute("pageStudent");
	}
	
	%>

	<h2>페이지 이동 후 page 영역 값 조회</h2>
	<ul>
		<li>학번 : <%=no%></li>
		<li>이름 : <%=name%></li>
		<li>나이 : <%=age%></li>
		<li>학과 : <%=dept%></li>
		<li>학년 : <%=grade%></li>
		<li>학생정보
			<%if(pageStudent != null) {%>
			<ul>
				<li><%=pageStudent.getNo()%></li>
				<li><%=pageStudent.getName()%></li>
				<li><%=pageStudent.getAge()%></li>
				<li><%=pageStudent.getDept()%></li>
				<li><%=pageStudent.getGrade()%></li>
			</ul>
			<%} %>
		</li>
	</ul>


</body>
</html>