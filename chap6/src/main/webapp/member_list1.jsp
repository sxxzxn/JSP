<%@page import="fullstack7.member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="fullstack7.member.MemberDAO"%>
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
// String dbDriver = application.getInitParameter("MariaDriver");
// String dbUrl = application.getInitParameter("MariaURL");
// String dbId = application.getInitParameter("dbId");
// String dbPwd = application.getInitParameter("dbPwd");

MemberDAO dao = new MemberDAO();
List<MemberDTO> mList = dao.getMemberList();

if(mList != null && !  mList.isEmpty()){
%>


<table>
	<thead>
		<tr>
			<th><input type="checkbox" id = "all" name="checkBox" onclick="checkAll()" /></th>
			<th>아이디</th>
			<th>이름</th>
			<th>비밀번호</th>
			<th>삭제</th>
		
		</tr>
	</thead>
	<tbody>
		
	<%
	for (MemberDTO member : mList){
	%>
	<tr>
			<td><input type="checkbox" name="checkBox"  value="<%=member.getMemberId() %>" /></td>
			<td><a href="./member_view.jsp?memberId=<%=member.getMemberId() %>"><%=member.getMemberId() %></a></td>
			<td><%=member.getName() %></td>
			<td><%=member.getPwd() %></td>
			<td><a href="./member_delete_ok.jsp?memberId=<%=member.getMemberId()%>">삭제</a></td>
		</tr>
	<% 
	}
	%>	
		<tr>
			<td colspan="6" class="centext"><1 2 3></td>
		</tr>
		<tr>
			<td colspan="6">
			<input type="button" class="centet" id ="btnRegist" value="회원가입" />
			<input type="button" class="centet" id ="btnDelete" value="회원삭제" />
			</td>
		</tr>
	</tbody>
</table>
<%
}else{
%>
회원이 없습니다.
<%
}
%>
<script>
//등록페이지
const btnRegist = document.getElementById("btnRegist");
btnRegist.addEventListener("click", function(e){
	location.href="./member_regist.jsp";
})

// 다중삭제
const btnDelete = document.getElementById("btnDelete");
btnDelete.addEventListener("click", function(e){
    const checkedBoxes = document.querySelectorAll('input[name="checkBox"]:checked');
    if (checkedBoxes.length == 0) {
        alert("삭제할 회원을 선택하세요.");
        return;
    }
    
    let deleteMembers = [];
    checkedBoxes.forEach(function(box) {
        deleteMembers.push(box.value);
    });
    
    if (confirm(deleteMembers.length + "명의 회원을 삭제하시겠습니까?")) {
        location.href = "./member_delete_ok2.jsp?members=" + deleteMembers.join(",");
    }
});

//전체선택
function checkAll(){
    const checkBoxs = document.getElementsByName("checkBox");
    const allCheck = document.getElementById("all");
    
    for(let i = 0; i < checkBoxs.length; i++) {
        checkBoxs[i].checked = allCheck.checked;
    }
}
</script>




</body>
</html>