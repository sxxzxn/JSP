package net.fullstack7.bbs;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.fullstack7.comment.CommentDAO;
import net.fullstack7.comment.CommentDTO;

@WebServlet("/bbs/view.do")
public class BbsViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("BbsViewController시작");
		int idx = Integer.parseInt(req.getParameter("idx"));

	    BbsDAO dao = new BbsDAO();
	    BbsDTO dto = new BbsDTO();
	    
	    dao.increaseView(idx);

	    dto.setIdx(idx); 
	    dto = dao.viewBbs(dto);

	    req.setAttribute("dto", dto);
	    
	  
	    CommentDAO cDao = new CommentDAO();
        List<CommentDTO> commentList = cDao.commentList(idx);

        // request에 댓글 리스트 저장
        req.setAttribute("commentList", commentList);
	    
        req.getRequestDispatcher("/bbs/view.jsp").forward(req, res);

        dao.close();
	    
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

	}

}
