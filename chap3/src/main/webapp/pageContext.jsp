<%@ page import="dto.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pageContext</title>
</head>
<body>

<h2>page 영역 속성값 처리</h2>

<%
pageContext.setAttribute("pageStNo", "20240101");
pageContext.setAttribute("pageStName", "조수진");
pageContext.setAttribute("pageStAge", 20);
pageContext.setAttribute("pageStDept", "항공교통");
pageContext.setAttribute("pageStGrade", 1);
pageContext.setAttribute("pageStudent", new StudentDTO ("2020", "하니", 3, "강아지", 2));
%>




<%
String no = pageContext.getAttribute("pageStNo").toString();
String name = pageContext.getAttribute("pageStName").toString();
int age = (Integer)pageContext.getAttribute("pageStAge");
String dept = pageContext.getAttribute("pageStDept").toString();
int grage = (Integer)pageContext.getAttribute("pageStGrade");
%>

<h2>page 영역의 속성값 읽기</h2>
<%@ include file= "page_include.jsp" %>


<h2>페이지 이동 후 page 영역 값 조회</h2>
<a href="pageContext2.jsp">이동</a>


</body>
</html>