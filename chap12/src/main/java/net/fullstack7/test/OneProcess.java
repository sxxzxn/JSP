package net.fullstack7.test;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OneProcess
 */
@WebServlet("*.mem")
public class OneProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OneProcess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.getWriter().append("Served at: ").append(req.getContextPath());
		String uri = req.getRequestURI();
		String menu_kind = uri.substring(uri.lastIndexOf("/"));
		
		if(menu_kind.equals("/regist.mem")) {
			req.setAttribute("menu_kind", "<h3> 회원가입 </h3>");
			
		} else if (menu_kind.equals("/login.mem")) {
			req.setAttribute("menu_kind", "<h3> 로그인 </h3>");
			
		} else if (menu_kind.equals("/bbs.mem")) {
			req.setAttribute("menu_kind", "<h3> 자유게시판 </h3>");
			
		}
		
		req.setAttribute("uri", uri);
		req.setAttribute("menu_kind", menu_kind);
		
		req.getRequestDispatcher("/OneProcess.jsp").forward(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, res);
	}

}
