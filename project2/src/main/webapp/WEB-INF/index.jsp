<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="project.dto.Member"%>
<%@ page buffer="none"%>
<%@ page import="project.dto.Board" %>
<%@ page import="project.services.BoardService" %>
<%@ page import="project.services.NoticeService" %>
<%@ page import="project.dto.Notice" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<title>Studio Rental</title>
<meta charset="utf-8" />
</head>
<body>
	<!-- 헤더영역  -->
	<jsp:include page="navbar.jsp" />

	<link href="css/styles.css" rel="stylesheet" />
	<!-- 메인 배너 이미지 삽입 -->
	<div id="slideShow">
		<div id="slides">
			<img src="images/main1.jpg" alt=""> 
			<img src="images/main2.jpg" alt=""> 
			<img src="images/main3.jpg" alt="">
			<button id="prev">&lang;</button>
			<button id="next">&rang;</button>
		</div>
	</div>
	<!-- 상세페이지 메인  -->
	<h1>Room Photo</h1>
	<div class="products">
		<a href="#"> <img src="images/Aroom.jpg">
			<p>A Room</p>
		</a> <a href="#"> <img src="images/Broom.jpg">
			<p>B Room</p>
		</a> <a href="#"> <img src="images/Croom.jpg">
			<p>C Room</p>
		</a>
		<div class="clearfix"></div>
		
		
	</div>
	

	<!-- 푸터영역  -->
	<jsp:include page="other.jsp" />
	<!--메인 배너 이미지 넘기기 -->
	<script src="js/slideshow.js"></script>

</body>
</html>
