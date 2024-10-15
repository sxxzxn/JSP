package net.fullstack7.bbs;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.fullstack7.utils.Pagination;

@WebServlet("/bbs/list.do")

public class BbsListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	  BbsDAO dao = new BbsDAO();
        
        String searchType = req.getParameter("searchType");
        String searchKeyword = req.getParameter("searchKeyword");
        int pageNo = Integer.parseInt(req.getParameter("pageNo") != null ? req.getParameter("pageNo") : "1");
        int pageSize = Integer.parseInt(req.getParameter("pageSize") != null ? req.getParameter("pageSize") : "10");

        // 게시글 리스트 및 총 게시글 수 가져오기
        List<BbsDTO> bbsList = dao.getBbsList(pageNo, pageSize, searchType, searchKeyword);
        int totalPosts = dao.getTotalPageCnt(searchType, searchKeyword);

        // 페이징 처리
        Pagination pagination = new Pagination(totalPosts, pageNo, pageSize);
        
        req.setAttribute("bbsList", bbsList);
        req.setAttribute("pagination", pagination);  // Pagination 객체 전달
        req.setAttribute("searchType", searchType);
        req.setAttribute("searchKeyword", searchKeyword);
        
        req.getRequestDispatcher("list.jsp").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		doGet(req, res);
		

	 	BbsDTO dto = new BbsDTO();
        dto.setMemberId(req.getParameter("memberid"));
        dto.setTitle(req.getParameter("title"));
        dto.setContent(req.getParameter("content"));
        String regDateStr = req.getParameter("regDate");
        if (regDateStr != null && !regDateStr.isEmpty()) {
            LocalDateTime regDate = LocalDateTime.parse(regDateStr);
            dto.setRegDate(regDate);
        } else {
            dto.setRegDate(LocalDateTime.now());
        }
        dto.setReadCnt(Integer.parseInt(req.getParameter("readCnt")));
        
        BbsDAO dao = new BbsDAO();
        dao.registBbs(dto); 
        dao.close(); 

        res.sendRedirect("list.do"); 

	}

}
