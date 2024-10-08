<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.fullstack7.member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
table, tr, td {
  border: 1px solid black;
  border-collapse: collapse;
}

</style>
</head>
<body>

<h2>JSTL - forEach</h2>
<h3>일반 for 형태</h3>
<c:forEach var="i" begin="1" end="10" step="1">
<p>일반 for 문 형태로 반복 진행 : ${i}</p>
</c:forEach>
<h3>varStatus 속성 값 조회</h3>
<table>
	<tr>
		<td>conunt</td>
		<td>index</td>
		<td>current</td>
		<td>first</td>
		<td>last</td>
	</tr>
	<c:forEach var="i" begin="1" end="10" varStatus="loopStatus">
	<tr>
		<td>${loopStatus.count }</td>
		<td>${loopStatus.index }</td>
		<td>${loopStatus.current }</td>
		<td>${loopStatus.first }</td>
		<td>${loopStatus.last }</td>
	</tr>
	</c:forEach>
<!-- 	페이징영역, 데이터 없을경우 -->
<!-- 	<tr> -->
<!-- 		<td colspan="5">conunt</td> -->
<!-- 	</tr> -->
</table>



<h3>1~100까지 짝수 합</h3>
<c:forEach var="i" begin="1" end="100">
	<c:if test="${i % 2 == 0 }">
		<c:set var="sum" value="${sum + i}" />
	</c:if>
</c:forEach>
합: ${sum}



<hr>
<h3>Array</h3>
<%
String[] arrStr = {"축구","야구","농구","배구"};
%>

<c:forEach var="str" items="<%=arrStr %>">
	<br><span>구기종목 : ${str}</span>
</c:forEach>

<hr>
<h3>List</h3>
<%
List<MemberDTO> dtoList = new ArrayList<MemberDTO>();

dtoList.add(new MemberDTO("user1", "하니", "여"));
dtoList.add(new MemberDTO("user2", "코코", "여"));
dtoList.add(new MemberDTO("user3", "몽글", "남"));

%>

<c:set var="dto" value="<%=dtoList %>" />
<ul>
<c:forEach var="list" items="${dto}">
	<li>
		<ul>
		<li>아이디 : ${list.memberId}</li>
		<li>이름 : ${list.name}</li>
		<li>성별 : ${list.gender}</li>
		</ul>
	</li>
</c:forEach>
</ul>


<h3>Map 컬렉션</h3>
<%
Map<String, MemberDTO> dtoM = new HashMap<String, MemberDTO>();
dtoM.put("user1",new MemberDTO("user1", "하니", "여"));
dtoM.put("user2",new MemberDTO("user2", "하2", "2"));
dtoM.put("user3",new MemberDTO("user3", "하3", "3"));
%>

<c:set var="maps" value="<%=dtoM %>" />
<ul>
<c:forEach var="m" items="${maps }">
	<li>
		<ul>
		<li>키 : ${m.key}</li>
		<li>아이디 : ${m.value.memberId}</li>
		<li>이름 : ${m.value.name}</li>
		<li>성별 : ${m.value.gender}</li>
		</ul>
	</li>
</c:forEach>
</ul>

<h3> 토큰 </h3>
<%
String cars= "벤츠,캐딜락,벤트리,포르쉐";
%>

<c:forTokens var="car" items="<%=cars %>" delims=",">
	<br><span>자동차 : ${car }</span>
</c:forTokens>
</body>
</html>