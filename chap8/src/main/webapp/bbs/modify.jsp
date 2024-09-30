<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	
	.bbsdiv{
	width: 500px;
	height: 600px;
	
	}
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

<h2>게시판 수정</h2>
<div class="bbsdiv">
    <form id="frm">
    <input type="hidden" name="idx" value="<%= request.getParameter("idx") %>">
        <div class="top-row">
            <div>
                <label class="label">제목:</label>
                <input type="text" name="title" value="<%= request.getParameter("title") %>">
            </div>
            <div>
                <label class="label">글쓴이:</label>
                <input type="text" name="memberId" value="<%= request.getParameter("memberId") %>" readonly />
            </div>
        </div>
        <div class="content-row">
            <label class="label">내용:</label>
            <br>
            <textarea name="content" rows="10" style="width: 100%;"><%= request.getParameter("content") %></textarea>
        </div>
        <div>
            <input type="button" id ="BtnGoModify" value="수정" />
        </div>
    </form>
</div>

<script>
const BtnGoModify = document.getElementById("BtnGoModify");
BtnGoModify.addEventListener("click", function(e){
    e.preventDefault();
    const frm = document.getElementById('frm');
    const title = frm.title.value;
    const memberId = frm.memberId.value;
    const content = frm.content.value;
    const idx = frm.idx.value;

    frm.action = "./modify_ok.jsp"; 
    frm.method = "POST";
    frm.submit();
});
</script>

</body>
</html>