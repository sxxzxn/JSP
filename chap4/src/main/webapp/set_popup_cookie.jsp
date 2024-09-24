<%@page import="java.net.HttpCookie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%!
public void setCookie(HttpServletResponse response,HttpServletRequest request, String name, String value, int maxAge, String path){
	Cookie cookie = new Cookie(name, value);
    cookie.setPath(path);
    cookie.setMaxAge(maxAge);
    response.addCookie(cookie);
}


// public void printCookies(HttpServletRequest request, JspWriter out) throws Exception {
//     Cookie[] cookies = request.getCookies();
//     if (cookies != null) {
//         for (Cookie c : cookies) {
//             String cookieName = c.getName();
//             String cookieValue = c.getValue();
//             out.print(String.format("%s : %s<br>", cookieName, cookieValue));
//         }
//     }
// }
%>

<%-- <%! --%>
// String popFlag = request.getParameter("popFlog");
// if (popFlag != null && popFlag.equlas("Y")){
// 	setCookie(response, request)
// }
<%-- %> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>1. 쿠키(Cookie) 설정 </h2>

<%
// Cookie cookie = new Cookie("cookie1", "쿠키값1");
// cookie.setPath(request.getContextPath()); // 보편적으로 루트( / ) 사용
// cookie.setMaxAge(3600);
// response.addCookie(cookie);
setCookie(response,request, "cookie1", "쿠키값1", 3600, request.getContextPath());
%>

<hr>
<h2>2. 쿠키(Cookie) 값 확인</h2>
<%
Cookie[] cookies = request.getCookies(); // 요청 헤더에 있는 모든 쿠키 조회
if (cookies != null ){
	for(Cookie c : cookies){
		String cookieName = c.getName();
		String cookieValue = c.getValue();
		out.print(String.format("%s : %s<br>", cookieName, cookieValue));
	}
}
// printCookies(request, out);
%>

<hr>
<h2>3. 페이지 이동 후 쿠키 값 확인</h2>
<a href=cookie2.jsp>이동</a>
</body>
</html>