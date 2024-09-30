<%@page import="net.fullstack7.bbs.BbsDTO"%>
<%@page import="net.fullstack7.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>게시판 수정 동작</h2>
<%
String idx = request.getParameter("idx"); 
String title = request.getParameter("title"); 
String memberId = request.getParameter("memberId"); 
String content = request.getParameter("content"); 

BbsDAO dao = new BbsDAO();
BbsDTO dto = new BbsDTO();
dto.setIdx(Integer.parseInt(idx)); 
dto.setTitle(title); 
dto.setMemberId(memberId); 
dto.setContent(content); 

int result = dao.setBbsModify(dto); 

if (result > 0) {
	out.print("<script>alert('수정 성공'); location.href='view.jsp?idx=" + dto.getIdx() + "';</script>");
} else {
    out.println("<script>alert('게시글 등록 실패'); history.back();</script>");
}
%>
</body>
</html>