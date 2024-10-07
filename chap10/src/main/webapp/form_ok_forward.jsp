=<%@page import="net.fullstack7.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>request form 값 처리 </h2>


<%
// String memberId = request.getParameter("memberId"); 
// String name = request.getParameter("name"); 
// String gender = request.getParameter("gender"); 
// String school = request.getParameter("school"); 
// String[] hobby = request.getParameterValues("hobby"); 
// MemberDTO member = new MemberDTO();
// member.setName(name);
// member.setGender(gender);
// member.setSchool(school);
// String hobbies = ""; 
// if(hobby != null){
// 	for(int i= 0; i<hobby.length; i++){
// 		hobbies += hobby[i];
// 	}
// }
// member.setHobby(hobbies);
// request.setAttribute("memberObj", member);
%>



<h2>EL - form 값 처리 </h2>

<ul>
	<li>아이디 : ${ param.memberId }</li>
	<li>이름 : ${ param.name }</li>
	<li>성별 : ${ param.gender }</li>
	<li>학력 : ${ param.school }</li>
	<li>취미 : ${ paramValues.hobby[0] }
			${ paramValues.hobby[1] }
			${ paramValues.hobby[2] }
			${ paramValues.hobby[3] }
	</li>
	<li>
		<ul>회원정보
			<li>아이디 : ${memberObj.name }</li>
			<li>이름 : ${memberObj.memberId }</li>
			<li>성별 : ${memberObj.gender }</li>
			<li>학력 : ${memberObj.school }</li>
			<li>취미 : ${memberObj.hobby }</li>
		</ul>
	</li>
</ul>

<h2>EL - form 값 처리 </h2>
<ul>
	<li>이메일 : ${ param.email }</li>
	<li>나이 : ${ param.age }</li>
</ul>
</body>
</html>