<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록</title>

<style>
	.bbsdiv{
	width: 500px;
	height: 600px;
	
	}
    table {
        border-collapse: collapse;
        width: 100%;
    }
    
    tr, td {
        border: 1px solid black;
        padding: 10px;
    }

    .top-row {
        display: flex;
        justify-content: space-between;
        padding-bottom: 10px;
    }

    .content-row {
        margin-top: 20px;
    }

    .label {
        width: 15%;
        font-weight: bold;
    }
</style>

</head>
<body>
<%
%>

<h2>게시판 등록</h2>
<div class="bbsdiv">
    <form id="frm">
        <div class="top-row">
            <div>
                <label class="label">제목:</label>
                <input type="text" id="title" name="title">
            </div>
            <div>
                <label class="label">글쓴이:</label>
                <input type="text" id="memberId" name="memberId">
            </div>
        </div>
        <div class="content-row">
            <label class="label">내용:</label>
            <br>
            <textarea name="content" id="cotent" rows="10" style="width: 100%;"></textarea>
        </div>
        <div>
        	<input type="button" id="btnRegist" value="등록" />
        </div>
    </form>
</div>

<script>


const btnRegist = document.getElementById("btnRegist");
btnRegist.addEventListener("click", function(e){
	e.preventDefault();
	const frm = document.getElementById('frm'); // 수정된 부분
	const title = frm.title.value;
	const memberId = frm.memberId.value;
	const content = frm.content.value;

	frm.action = "./regist_ok.jsp?";
	frm.method= "POST";
	frm.submit();
});
</script>

</body>
</html>