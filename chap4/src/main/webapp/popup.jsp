<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.7.1.slim.min.js"></script>
<style>
div#divPop1 {
	width: 300px;
	height: 100px;
	background-color: yellow;
}

div#divPop1>div {
	margin-top: 80px;
}
</style>
</head>
<body>

	<h2>팝업창 페이지</h2>

	<div id="divPop1">
		<h2 align="center">공지사항 팝업</h2>
		<div align="right">
			<form name="frmPop1" id="frmPop1">
				<input type="checkbox" id="popFlag" value="Y" />하루 동안 창을 열지 않음 <input
					type="button" id="btnClose" value="닫기" />
			</form>
		</div>
	</div>

<script>
$(function() {
	$("#btnClose").click(function)(){
		$("#divPop1").hide()// document.getElementById("dovPop1").style.display=none;
		var popVal = $("input:checkbox[id=popPlag]:checked").val();
		if(popFlag == "Y"){
			$.ajax({
				url : './set_popup_cookie.jsp',
				type : 'get',
				data : {popFlag : popVal},
				dateType : "text",
				success : function(resData){
					if(resDats != '') location.reload(); // window 내장객체로 생략 가능
				}
					
			});
		}
	});
		
});
	
	$document.re
</script>

</body>
</html>