<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="dto.StudentDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>application 영역 조회</h2>
<%
List<String> result_lists = (List<String>) application.getAttribute("lists");
if(result_lists !=null){
	for(String str : result_lists){
		out.print("str :" + str + "<br>");
	}
}


Map<String, StudentDTO> result_maps = (Map<String, StudentDTO>) application.getAttribute("maps");
if (result_maps != null){
	Set<String> keys = result_maps.keySet();
	for (String key : keys){
		StudentDTO std = result_maps.get(key);
		out.print(
		String.format("학번 : %s, 이름 : %s, 나이 : %d, 학과 %s, 학년 %d<br>",
			std.getNo(),
			std.getName(),
			std.getAge(),
			std.getDept(),
			std.getGrade()
		));
	}
}

%>

</body>
</html>