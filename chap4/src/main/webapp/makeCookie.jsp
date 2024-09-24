<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	public void setCookie(HttpServletResponse response, String cName, String cValue, int maxAge, String path) {
		Cookie cookie = new Cookie(cName, cValue);
		cookie.setPath(path);
		cookie.setMaxAge(maxAge);
		response.addCookie(cookie);
	}

	public String checkCookies(HttpServletRequest request, HttpServletResponse response, String cName) {
		String cookieValue="";
		
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				String cookieName = c.getName();
				if (cookieName.equals(cName)) {
					cookieValue = c.getValue();
				}

			}

		}
		return cookieValue;
	}%>

</body>
</html>