package net.fullstack7.bbs;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/bbs/list.do")

public class BbsListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		 BbsDAO dao = new BbsDAO();
		 List<BbsDTO> bbsList = dao.list();
		 req.setAttribute("bbsList", bbsList);
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
            // 변환 예시 (문자열을 LocalDateTime으로 변환)
            LocalDateTime regDate = LocalDateTime.parse(regDateStr);
            dto.setRegDate(regDate);
        } else {
            dto.setRegDate(LocalDateTime.now());
        }
        dto.setReadCnt(Integer.parseInt(req.getParameter("readCnt")));
        
        BbsDAO dao = new BbsDAO();
        dao.registBbs(dto); // 게시글 등록 메서드 호출
        dao.close(); // DAO 리소스 정리

        res.sendRedirect("list.do"); // 리다이렉트

	}

}
