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
        String reContents = req.getParameter("reContents");
        String pId = req.getParameter("pId");

        CommentDTO commentDTO = new CommentDTO();
        commentDTO.setWriterId(writerId);
        commentDTO.setBbsIdx(bbsIdx);
        if (pId != null && !pId.isEmpty()) {
            commentDTO.setContents(reContents); 
            commentDTO.setpId(pId); 
        } else {
            // 일반 댓글일 경우
            commentDTO.setContents(contents); 
            commentDTO.setpId("0"); 
        }
//        commentDTO.setpId(pId == null ? "0" : pId);
        
        CommentDAO commentDAO = new CommentDAO();
        int result = commentDAO.commentRegist(commentDTO);
        
        System.out.println("writerId: " + writerId);
        System.out.println("bbsIdx: " + bbsIdx);
        System.out.println("contents: " + (pId != null ? reContents : contents));
        System.out.println("pId: " + pId);
        
        res.sendRedirect("/mvc/bbs/view.do?idx=" + bbsIdx);
	
	}

}
