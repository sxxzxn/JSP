<%@page import="common.DBConnPool"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>JDBC 테스트1</h2>

<%
JDBConnect jdbc1;
// try(JDBConnect jdbc4 = new JDBConnect(application)){
	
// }
try {
	jdbc1 = new JDBConnect();
	
	out.println("==================================<br>");
	out.println("DB 접속 성공(기본생성자) <br> ");
	out.println("jdbc1 : " + jdbc1+"<br>");
	out.println("==================================");
	jdbc1.close();
	
} catch(Exception e) {
	out.println("==================================<br>");
	out.println("DB 접속 에러(기본생성자) <br> ");
	out.println(e.getMessage()+"<br>");
	out.println("==================================");
}

%>
<hr>
<h2>JDBC 테스트2</h2>

<%
Class.forName("org.mariadb.jdbc.Driver");

//DB에 연결
String driver = application.getInitParameter("MariaDriver");
String url = application.getInitParameter("MariaURL");
String id = application.getInitParameter("dbId");
String pwd = application.getInitParameter("dbPwd");

JDBConnect jdbc2;
try {
	jdbc2 = new JDBConnect(driver, url, id, pwd);
	
	out.println("==================================<br>");
	out.println("DB 접속 성공(매개 변수 생성자 2) <br> ");
	out.println("jdbc1 : " + jdbc2+"<br>");
	out.println("==================================");
	jdbc2.close();
	
} catch(Exception e) {
	out.println("==================================<br>");
	out.println("DB 접속 에러(매개 변수 생성자 2) <br> ");
	out.println(e.getMessage()+"<br>");
	out.println("==================================");
}

%>

<hr>
<h2>JDBC 테스트3</h2>

<%
JDBConnect jdbc3;
try {
	jdbc3 = new JDBConnect(application);
	
	out.println("==================================<br>");
	out.println("DB 접속 성공(기본생성자) <br> ");
	out.println("jdbc1 : " + jdbc3+"<br>");
	out.println("==================================");
	jdbc3.close();
} catch(Exception e) {
	out.println("==================================<br>");
	out.println("DB 접속 에러(기본생성자) <br> ");
	out.println(e.getMessage()+"<br>");
	out.println("==================================");
}
%>

<hr>
<h2>DB 커넥션 풀 테스트</h2>

<%
String ctxSrc="java:comp/env";
String ds="jdbc_fullstack7";

try {
	DBConnPool pool = new DBConnPool();
	
	out.println("==================================<br>");
	out.println("DB 커넥션 풀 생성 <br> ");
	out.println("DBConnPool : " + pool+"<br>");
	out.println("==================================");
	pool.close();
} catch(Exception e) {
	out.println("==================================<br>");
	out.println("DB 커넥션 풀 오류 <br> ");
	out.println("에러 : "+e.getMessage()+"<br>");
	out.println("==================================");
}
%>
</body>
</html>