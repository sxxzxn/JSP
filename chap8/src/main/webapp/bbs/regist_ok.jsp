<%@page import="net.fullstack7.bbs.BbsDAO"%>
<%@page import="net.fullstack7.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>게시판 글 등록 동작</h2>
	<%
	
	String title = request.getParameter("title");
	String memberId = request.getParameter("memberId");
	String content = request.getParameter("content");
	


	if (title != null && ! title.isEmpty() 
		&& memberId != null && ! memberId.isEmpty() 
		&& content != null&& ! content.isEmpty()) {
		
		BbsDTO dto = new BbsDTO(title, content, memberId);

		BbsDAO dao = new BbsDAO();
		int result = dao.setBbsRegist(dto);

		if (result > 0) {
			out.print("<script>alert('등록성공'); location.href='list.jsp';</script>");
		} else {
			out.print("<script>alert('게시글 등록 실패'); history.back();</script>");
		}
	} else {
		out.print("<script>");
		out.print("alert('제목: " + title + "\\n회원: " + memberId + "\\n내용: " + content + "');");
		out.print("history.back();");
		out.print("</script>");

	}
	

	%>

	
</body>
</html>