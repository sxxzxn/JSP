package net.fullstack7.comment;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/comment/regist.do")

public class CommentRegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.sendRedirect("/bbs/list.do");	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		doGet(req, res);
		
		String writerId = req.getParameter("writerId");
        int bbsIdx = Integer.parseInt(req.getParameter("boardId"));
        String contents = req.getParameter("contents");
        int pId = req.getParameter("pId") != null ? Integer.parseInt(req.getParameter("pId")) : 0;

        CommentDTO commentDTO = new CommentDTO();
        commentDTO.setWriterId(writerId);
        commentDTO.setBbsIdx(bbsIdx);
        commentDTO.setContents(contents);
        commentDTO.setpId(pId);
        
        CommentDAO commentDAO = new CommentDAO();
        int result = commentDAO.commentRegist(commentDTO);
        
        System.out.println("writerId: " + writerId);
        System.out.println("bbsIdx: " + bbsIdx);
        System.out.println("contents: " + contents);
        System.out.println("pId: " + pId);
        
        res.sendRedirect("/mvc/bbs/view.do?idx=" + bbsIdx);
        commentDAO.close();
	
	}

}
