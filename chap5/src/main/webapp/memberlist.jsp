<%@page import="common.JDBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
JDBConnect jdbc = new JDBConnect();
String sql = "SELECT memberId, name, pwd FROM tbl_member";
PreparedStatement psmt = jdbc.con.prepareStatement(sql);
ResultSet rs = psmt.executeQuery();

while(rs.next()){

%>
	<%=rs.getString(1)%>
	<%=rs.getString(2)%>
	<%=rs.getString(3)%>
<%
}%>
</body>
</html>