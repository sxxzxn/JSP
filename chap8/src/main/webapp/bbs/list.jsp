<%@page import="java.util.List"%>
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

<style>
table, thead, tbody, tr, td {
	border: 1px solid black;
}
</style>
</head>
<body>

	<h2>게시판 목록</h2>

	<table>
        <thead>
            <tr>
                <th><input type="checkbox" id="all" name="bbs_idx" onclick="checkAll()" /></th>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>조회수</th>
<!--                 <th>등록일</th> -->
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <form id="frmList" name="frmList" method="post">
                <% 
                BbsDAO dao = new BbsDAO();
                List<BbsDTO> mList = dao.getBbsList();

                    if (mList != null && !mList.isEmpty()) {
                        for (BbsDTO bbs : mList) {
                %>
                            <tr>
                                <td><input type="checkbox" id="bbs_idx" name="bbs_idx" value="<%= bbs.getIdx() %>" /></td>
                                <td><%= bbs.getIdx() %></td>
                                <td><a href="./view.jsp?idx=<%= bbs.getIdx() %>"><%= bbs.getTitle() %></a></td>
                                <td><%= bbs.getMemberId() %></td>
                                <td><%= bbs.getReadCnt() %></td>
<%--                                 <td><%= bbs.getRegDate() %></td> --%>
                                <td><a href="./delete_ok.jsp?idx=<%=bbs.getIdx()%>">삭제</a></td>
                            </tr>
                <%
                        }
                    } else {
                %>
                        <tr>
                            <td colspan="7">등록된 게시물이 없습니다.</td>
                        </tr>
                <%
                    }
                %>
                
                <tr>
                    <td colspan="7" class="centext"><11></td>
                </tr>
                <tr>
                    <td colspan="7">
                        <input type="button" class="center" id="btnRegist" value="글등록" />
                        <input type="button" class="center" id="btnDeletes" value="선택글삭제"  />
                    </td>
                </tr>
            </form>
        </tbody>
    </table>
    <script>
//등록페이지
const btnRegist = document.getElementById("btnRegist");
btnRegist.addEventListener("click", function(e){
	location.href="./regist.jsp";
})


// 다중삭제
const btnDeletes = document.getElementById("btnDeletes");
btnDeletes.addEventListener("click", function(e){
    const checkedBoxes = document.querySelectorAll('input[name="bbs_idx"]:checked');
    if (checkedBoxes.length == 0) {
        alert("삭제할 게시글을 선택하세요.");
        return;
    }
    
    let deleteNo = [];
    checkedBoxes.forEach(function(box) {
    	deleteNo.push(box.value);
    });
    
    if (confirm(deleteNo.length + "개의 게시글 삭제하겠습니까??")) {
        location.href = "./delete_ok.jsp?idx=" + deleteNo.join(",");
    }
});

//전체선택
function checkAll(){
    const checkBoxs = document.getElementsByName("bbs_idx");
    const allCheck = document.getElementById("all");
    
    for(let i = 0; i < checkBoxs.length; i++) {
        checkBoxs[i].checked = allCheck.checked;
    }
}
</script>
</body>
</html>