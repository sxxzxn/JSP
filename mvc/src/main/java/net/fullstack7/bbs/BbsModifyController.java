package net.fullstack7.bbs;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/bbs/modify.do")
public class BbsModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int idx = Integer.parseInt(req.getParameter("idx")); 
	    BbsDAO dao = new BbsDAO();
	    BbsDTO dto = new BbsDTO(); 
	    dto.setIdx(idx);
	    dto = dao.viewBbs(dto);
	    req.setAttribute("dto", dto); 
	    req.getRequestDispatcher("modify.jsp").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	    System.out.println("BbsModifyController 시작");

	    BbsDAO dao = new BbsDAO();
	    BbsDTO dto = new BbsDTO();

	    dto.setContent(req.getParameter("content")); 
	    dto.setIdx(Integer.parseInt(req.getParameter("idx"))); 
	    
	    int row = dao.modify(dto);
	    
	    if (row > 0) {
	        res.sendRedirect(req.getContextPath() + "/bbs/view.do?idx=" + dto.getIdx()); 
	    } else {
	        req.setAttribute("error", "게시글 수정 실패"); 
	        req.setAttribute("dto", dto); 
	        req.getRequestDispatcher("modify.jsp").forward(req, res);
	    }
		dao.close();

	}

}
