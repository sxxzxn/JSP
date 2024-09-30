<%@page import="net.fullstack7.bbs.BbsDAO"%>
<%@page import="net.fullstack7.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>게시판 삭제 동작</h2>
<%-- <% --%>
// int idx = Integer.parseInt(request.getParameter("idx"));

// BbsDAO dao = new BbsDAO();
// BbsDTO dto = new BbsDTO();
// int result = dao.setBbsDelete(idx);

// if(result > 0){
// 	out.print("<script>alert('삭제'); location.href='list.jsp'; </script>");
// }else{
// 	out.print("<script>alert('삭제실패'); location.href='list.jsp'; </script>");
// }
<%-- %> --%>

<%
String idxParam = request.getParameter("idx");

if (idxParam != null && !idxParam.isEmpty()) {
    // idx를 쉼표로 분리하여 배열로 변환
    String[] idxArray = idxParam.split(",");

    BbsDAO dao = new BbsDAO();
    int[] idxsToDelete = new int[idxArray.length];
    
    // 문자열 배열을 정수 배열로 변환
    for (int i = 0; i < idxArray.length; i++) {
        idxsToDelete[i] = Integer.parseInt(idxArray[i].trim());
    }

    // 다중 삭제 호출
    int result = dao.setBbsDeletes(idxsToDelete);

    if (result > 0) {
        out.print("<script>alert('" + result + "개 게시글이 삭제되었습니다.'); location.href='list.jsp'; </script>");
    } else {
        out.print("<script>alert('삭제 실패'); location.href='list.jsp'; </script>");
    }
} else {
    out.print("<script>alert('삭제할 게시글을 선택해주세요.'); location.href='list.jsp'; </script>");
}
%>
</body>
</html>