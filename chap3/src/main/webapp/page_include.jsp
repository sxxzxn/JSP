<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="dto.StudentDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String no2 = pageContext.getAttribute("pageStNo").toString();
	String name2 = pageContext.getAttribute("pageStName").toString();
	int age2 = (Integer) pageContext.getAttribute("pageStAge");
	String dept2 = pageContext.getAttribute("pageStDept").toString();
	int grage2 = (Integer) pageContext.getAttribute("pageStGrade");
	StudentDTO pageStudent2 = (StudentDTO) pageContext.getAttribute("pageStudent");
	%>


	<a>include 영역---</a>
	<h3>삽입 페이지에서 결과 확인</h3>
	<ul>
		<li>학번 : <%=no2%></li>
		<li>이름 : <%=name2%></li>
		<li>나이 : <%=age2%></li>
		<li>학과 : <%=dept2%></li>
		<li>학년 : <%=grage2%></li>
		<li>학생정보
			<ul>
				<li><%=pageStudent2.getNo() %></li>
				<li><%=pageStudent2.getName()%></li>
				<li><%=pageStudent2.getAge() %></li>
				<li><%=pageStudent2.getDept() %></li>
				<li><%=pageStudent2.getGrade() %></li>
			</ul>
		</li>
	</ul>
	<a>include 영역---</a>
</body>
</html>