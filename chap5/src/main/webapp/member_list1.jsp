<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table,thead,tbody,th,tr,td {
	border:1px solid black;
	border-collapse : collapse;

}

</style>
</head>
<body>

<h2> 회원 목록 조회(statement)</h2>

<%
JDBConnect jdbc = new JDBConnect();
String sql = "SELECT memberID, name, pwd, regDate FROM tbl_member";
Statement stmt = jdbc.con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
%>


<table>
	<thead>
		<tr>
			<th><input type="checkbox" id = "all" name="checkBox" onclick="checkAll()" /></th>
			<th>아이디</th>
			<th>이름</th>
			<th>비밀번호</th>
			<th>등록일</th>
		
		</tr>
	</thead>
	<tbody>
		
	<%
	while(rs.next()){
	%>
	<tr>
			<td><input type="checkbox" name="checkBox"  />
			<td><a href="./member_view.jsp?memberId=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getDate(4) %></td>
		</tr>
	<% 
	}
	jdbc.close();
	%>	
		<tr>
			<td colspan="5" class="centext"><1 2 3></td>
		</tr>
		<tr>
			<td colspan="5">
			<input type="button" class="centet" id ="btnRegist" value="회원가입" />
			<input type="button" class="centet" id ="btnDelete" value="회원삭제" />
			</td>
		</tr>
	</tbody>
</table>
<script>

const btnRegist = document.getElementById("btnRegist");
btnRegist.addEventListener("click", function(e){
	location.href="./member_regist.jsp";
})

function checkAll(){
	const checkBoxs = document.getElementsByName("checkBox");
	const allCheck = document.getElementById("all");
	if(allCheck.checked==true){  
        for(let i=0;i<checkBoxs.length;i++) 
        	checkBoxs[i].checked=true;   
     }
     if(allCheck.checked==false){
        for(let i=0;i<checkBoxs.length;i++) 
        	checkBoxs[i].checked=false;  
     }
}
</script>




</body>
</html>