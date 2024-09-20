<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!--  contentType="text/html; charset=UTF-8" HTML 작성한거 -->
<!--  pageEncoding="UTF-8" JSP ( 선언부 포함) -->
<!--  <meta charset="UTF-8"> 톰캣에서 확인( 적지 않을 경우 pageEncoding="UTF-8"%> 따라감) -->
<%!
// 선언부
int i  = 100;
public int add(int num1, int num2){
	return num1+num2;
}

// (int num1, int num2)->{return num1+num2};
// (int num1, int num2) -> num1 + num2;

%>


<!-- _jspService -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
int result =  add(10,20);
%>

결과 1 : <%=result %>
결과 2 : <%=add(30,40) %>
i : <%=i %>

</body>
</html>