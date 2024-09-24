<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%!
public void printCookies(HttpServletRequest request, JspWriter out) throws Exception {
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            String cookieName = c.getName();
            String cookieValue = c.getValue();
            out.print(String.format("%s : %s<br>", cookieName, cookieValue));
        }
    }
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h2>1.페이지 이동 후 쿠키(Cookie) 값 확인</h2>
<%
// Cookie[] cookies = request.getCookies(); // 요청 헤더에 있는 모든 쿠키 조회
// if (cookies != null ){
// // 	for(Cookie c : cookies){
// // 		String cookieName = c.getName();
// // 		String cookieValue = c.getValue();
// // 		out.print(String.format("%s : %s<br>", cookieName, cookieValue));
// // 	}
//  	for (int i=0; i<cookies.length; i++){
// 		String cookieName = cookies[i].getName();
// 		String cookieValue = cookies[i].getValue();
// 		out.print(String.format("%s : %s<br>", cookieName, cookieValue));
//  	}
// }



%>


</body>
</html>