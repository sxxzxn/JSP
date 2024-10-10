package net.fullstack7.test;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet2
 */
@WebServlet("/HelloServlet2.do")
public class HelloServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		req.setAttribute("msg", "어노테이이션으로 접근");
//		req.getRequestDispatcher("HelloServlet2.jsp").forward(req, res);
		
		
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter wrt = res.getWriter();
			wrt.println("<html>");
			wrt.println("<head><title> get Writer로 직접 HTML 작성하기</title></head>");
			wrt.println("<body>");
			wrt.println("<h2> get서블릿에서 직접 코드 작성</h2>");
			wrt.println("<ul>");
			wrt.println("<li> get 목록 태그 작성1 </li>");
			wrt.println("<li> get 목록 태그 작성2 </li>");
			wrt.println("<li> get 목록 태그 작성3 </li>");
			wrt.println("<li> get 목록 태그 작성4 </li>");
			wrt.println("<li> get 목록 태그 작성5 </li>");
			wrt.println("</ul>");
			wrt.println("<button onclick='history.back()'>뒤로가기</button>");
			wrt.println("</body>");
			wrt.println("</html>");
			wrt.close();
			
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		StringBuilder sb = new StringBuilder();
		sb.append("<html>");
		sb.append("<head><title>POST:  Writer로 직접 HTML 작성하기</title></head>");
		sb.append("<body>");
		sb.append("<h2> POST: 서블릿에서 직접 코드 작성</h2>");
		sb.append("<ul>");
		sb.append("<li> POST: 목록 태그 작성1 </li>");
		sb.append("<li> POST: 목록 태그 작성2 </li>");
		sb.append("<li> POST: 목록 태그 작성3 </li>");
		sb.append("<li> POST: 목록 태그 작성4 </li>");
		sb.append("<li> POST: 목록 태그 작성5 </li>");
		sb.append("</ul>");
		sb.append("<button onclick='history.back()'>뒤로가기</button>");
		sb.append("</body>");
		sb.append("</html>");
	
		res.getWriter().append(sb.toString()).append(req.getContextPath());
		doGet(req, res);
	}

}
