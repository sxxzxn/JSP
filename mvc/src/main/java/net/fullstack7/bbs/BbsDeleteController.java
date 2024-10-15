package net.fullstack7.bbs;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/bbs/delete.do")
public class BbsDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("list.do").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	 String[] selectedIdxArray = req.getParameterValues("selectedIdx[]"); 
	   
	 	if (selectedIdxArray != null) {
	        BbsDAO dao = new BbsDAO();
	        
	        int[] idxArray = new int[selectedIdxArray.length];
	        for (int i = 0; i < selectedIdxArray.length; i++) {
	            idxArray[i] = Integer.parseInt(selectedIdxArray[i]); 
	        }

	        int deleteCount = dao.deleteMultiple(idxArray); 

	        if (deleteCount > 0) {
	            System.out.println("삭제 성공: " + deleteCount + "개 게시글 삭제됨");
	        } else {
	            System.out.println("삭제 실패");
	        }

	        dao.close();
	    } else {
	        System.out.println("삭제할 항목이 없습니다.");
	    }

	    res.sendRedirect("list.do"); 
	}

}
