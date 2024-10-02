<%@page import="java.util.ArrayList"%>
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
	<div>
	<%
        String memberId = (String) session.getAttribute("memberId");
        String role = (String) session.getAttribute("role");
        if (memberId == null) {
    %>
            <a href="../member/login2.jsp">로그인</a>
            <a href="../member/member_regist.jsp">회원가입</a>
    <%
        } else {
    %>
            <a href="../member/logout.jsp">로그아웃</a>
    <%
        }
    %>
	</div>
	<div>
	<form action=list.jsp method="get">
		<select name="searchType">
			<option value="title" <%= "title".equals(request.getParameter("searchType")) ? "selected" : "" %>>제목</option>
	        <option value="memberId" <%= "memberId".equals(request.getParameter("searchType")) ? "selected" : "" %>>회원아이디</option>
	    </select>
    <input type="text" name="searchKeyword" value="<%= request.getParameter("searchKeyword") != null ? request.getParameter("searchKeyword") : "" %>" placeholder="검색어 입력">
		<input type="submit" value="검색"/>
	</form>
	
	    <form action="list.jsp" method="get">
	        <select name="pageSize" id="pageSize">
	            <option value="10" <%= request.getParameter("pageSize") != null && request.getParameter("pageSize").equals("10") ? "selected" : "" %>>10</option>
	            <option value="20" <%= request.getParameter("pageSize") != null && request.getParameter("pageSize").equals("20") ? "selected" : "" %>>20</option>
	            <option value="30" <%= request.getParameter("pageSize") != null && request.getParameter("pageSize").equals("30") ? "selected" : "" %>>30</option>
	            <option value="40" <%= request.getParameter("pageSize") != null && request.getParameter("pageSize").equals("40") ? "selected" : "" %>>40</option>
	            <option value="50" <%= request.getParameter("pageSize") != null && request.getParameter("pageSize").equals("50") ? "selected" : "" %>>50</option>
	        </select>
	        <input type="submit" value="선택" />
	    </form>
	</div>
	
	

	<table>
        <thead>
            <tr>
            <%
            if("admin".equals(memberId)){
            %>
                <th><input type="checkbox" id="all" name="bbs_idx" onclick="checkAll()" /></th>
            <%
            }
            %>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>조회수</th>
                <th>등록일</th>
            <%
            if("admin".equals(role)){
            %>
                <th>삭제</th>
            <%
            }
            %>    
            
            </tr>
        </thead>
        <tbody>
            <form id="frmList" name="frmList" method="post">
                <% 
                
                BbsDAO dao = new BbsDAO();
                String searchType = request.getParameter("searchType");
                String searchKeyword = request.getParameter("searchKeyword");
                
                int pageNo = 1;
                int pageSize = 10;
                int pageBlock = 5;
                String pageNoParam = request.getParameter("pageNo");
                if (pageNoParam != null) {
                    pageNo = Integer.parseInt(pageNoParam);
                }
                String pageSizeParam = request.getParameter("pageSize");
                if (pageSizeParam != null) {
                    pageSize = Integer.parseInt(pageSizeParam);
                }
                
                int totalPost = dao.getTotalPageCnt(searchType, searchKeyword);
                int totalPages = (int) Math.ceil((double) totalPost / pageSize);
                
                List<BbsDTO> mList = dao.getBbsList(pageNo, pageSize, searchType, searchKeyword);
				
                
                    if (mList != null && !mList.isEmpty()) {
                        for (BbsDTO dto : mList) {
                %>
                            <tr>
                            <%
				            if("admin".equals(memberId)){
				            %>
                                <td><input type="checkbox" id="bbs_idx" name="bbs_idx" value="<%= dto.getIdx() %>" /></td>
                            <%
				            }
                            %>
                                <td><%= dto.getIdx() %></td>
                                <td><a href="./view.jsp?idx=<%= dto.getIdx() %>"><%= dto.getTitle() %></a></td>
                                <td><%= dto.getMemberId() %></td>
                                <td><%= dto.getReadCnt() %></td>
                                <td><%= dto.getRegDate() %></td>
                     		<%
				            if("admin".equals(memberId)){
				            %>
                                <td><a href="./delete_ok.jsp?idx=<%=dto.getIdx()%>">삭제</a></td>
                            <%
				            }
                            %>
                            
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
                    <td colspan="7" class="centext">
                
                    <%
                    if (totalPages > 0) {
                        int startPage = ((pageNo - 1) / pageBlock) * pageBlock + 1;
                        int endPage = Math.min(startPage + pageBlock - 1, totalPages);

                        // 검색어와 검색 유형이 null일 수 있으므로 기본값 처리
                        if (searchType == null) searchType = "";
                        if (searchKeyword == null) searchKeyword = "";

                        // 이전 페이지 링크
                        if (pageNo > 1) {
                            out.print("<a href='list.jsp?pageNo=1&pageSize=" + pageSize + "&searchType=" + searchType + "&searchKeyword=" + searchKeyword + "'>&lt;&lt;</a> ");
                            out.print("<a href='list.jsp?pageNo=" + (pageNo - 1) + "&pageSize=" + pageSize + "&searchType=" + searchType + "&searchKeyword=" + searchKeyword + "'>&lt;</a> ");
                        }

                        // 페이지 번호 링크
                        for (int i = startPage; i <= endPage; i++) {
                            if (i == pageNo) {
                                out.print("<strong>" + i + "</strong> ");
                            } else {
                                out.print("<a href='list.jsp?pageNo=" + i + "&pageSize=" + pageSize + "&searchType=" + searchType + "&searchKeyword=" + searchKeyword + "'>" + i + "</a> ");
                            }
                        }

                        // 다음 페이지 링크
                        if (pageNo < totalPages) {
                            out.print("<a href='list.jsp?pageNo=" + (pageNo + 1) + "&pageSize=" + pageSize + "&searchType=" + searchType + "&searchKeyword=" + searchKeyword + "'>&gt;</a> ");
                            out.print("<a href='list.jsp?pageNo=" + totalPages + "&pageSize=" + pageSize + "&searchType=" + searchType + "&searchKeyword=" + searchKeyword + "'>&gt;&gt;</a>");
                        }
                    }
                    System.out.println("pageNo: " + pageNo);
                    System.out.println("pageSize: " + pageSize);
                    System.out.println("totalPost: " + totalPost);
                    System.out.println("totalPages: " + totalPages);
                   dao.close();
                    %>
                    
                    
                    </td>
                </tr>
                <tr>
                    <td colspan="7">
                        <input type="button" class="center" id="btnRegist" value="글등록" />
                        <%
				        if("admin".equals(memberId)){
				        %>
                        <input type="button" class="center" id="btnDeletes" value="선택글삭제"  />
                    	<% }%>
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