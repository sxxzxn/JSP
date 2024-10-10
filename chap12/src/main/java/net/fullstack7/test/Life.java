package net.fullstack7.test;

import java.io.IOException;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Life
 */
@WebServlet("/Life.do")
public class Life extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@PostConstruct
	public void myPostConstuct() {
		System.out.println("=========================================");
		System.out.println("life Servlet Strat");
		System.out.println("@PostConstruct : myPostConstuct 호출");
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() 메서드 호출");
	}
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("service() 메서드 호출");
		super.service(req, res);
		
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		res.getWriter().append("Served at: ").append(req.getContextPath());
		System.out.println("doGet() 메서드 호출");
		req.getRequestDispatcher("./life.jsp").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("doPost() 메서드 호출");
		doGet(req, res);
	}
	
	
	@Override
	public void destroy() {
		System.out.println("destroy() 메서드 호출");
	}

	@PreDestroy
	public void myPreDestroy() {
		System.out.println("@PreDestroy : myPreDestroy 호출");
		System.out.println("life Servlet End");
		System.out.println("=========================================");
	}

}
