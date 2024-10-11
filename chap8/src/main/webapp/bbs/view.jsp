<%@page import="net.fullstack7.bbs.BbsDTO"%>
<%@page import="net.fullstack7.bbs.BbsDAO"%>
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
    textarea{
    	width:100%;
    }
</style>
</head>
<body>

<%
int idx = Integer.parseInt(request.getParameter("idx"));

BbsDAO dao = new BbsDAO();
//조회수 증가 
dao.increaseViews(idx);
BbsDTO dto = dao.getBbsNo(idx);
String memberId = (String) session.getAttribute("memberId");
String role = (String) session.getAttribute("role");
%>
<h2>게시글 조회</h2>
<div class="bbsdiv">
    <form id="frm">
    <input type="hidden" name="idx" value="<%= idx %>">
        <div class="top-row">
            <div>
                <label class="label">제목:</label>
                <input type="text" name="title" value="<%= dto.getTitle() %>" readonly />
            </div>
            <div>
                <label class="label">글쓴이:</label>
                <input type="text" name="memberId" value="<%= dto.getMemberId() %>" readonly />
            </div>
        </div>
        <div class="content-row">
            <label class="label">내용:</label>
            <br>
            <textarea name="content" rows="10" readonly><%= dto.getContent() %></textarea>
        </div>
        <div>
        <input type="button" id ="btnBack" value="이전" />
      <%
     if(memberId != null &&  memberId.equals(dto.getMemberId())){
     %> 
        <input type="button" id ="btnModify" value="수정" />        
    <%
     }
     %>

     <%
     if(memberId != null &&  memberId.equals(dto.getMemberId())){
     %> 
        <input type="button" id ="btndelete" value="삭제" />
     <%
     }
     %>
     
        </div>
    </form>
</div>
</body>
<script>
// 수정
const btnModify = document.getElementById("btnModify");
btnModify.addEventListener("click", function(e){
    e.preventDefault();
    const frm = document.getElementById('frm');
    const title = frm.title.value;
    const memberId = frm.memberId.value;
    const content = frm.content.value;
    const idx = frm.idx.value; 

    frm.action = "./modify.jsp"; 
    frm.method = "POST"; 
    frm.submit();
});

//이전
const btnBack = document.getElementById("btnBack");
btnBack.addEventListener("click", function(e){
    e.preventDefault();
    alert("버튼화ㅣㄱ인");

    window.location.href = "./list.jsp"; 
});

//삭제
const btndelete = document.getElementById("btndelete");
btndelete.addEventListener("click", function(e){
    e.preventDefault();
    const frm = document.getElementById('frm');
    const idx = frm.idx.value;
    
    frm.action = "./delete_ok.jsp"; 
    frm.method = "POST"; 
    frm.submit();
});
</script>
</html>