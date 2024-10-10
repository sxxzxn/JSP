package net.fullstack7.test;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.fullstack7.member.MemberDAO;
import net.fullstack7.member.MemberDTO;

/**
 * Servlet implementation class Member
 */
//@WebServlet("*.mvc")
public class Member extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberDAO dao;
	
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		// 만약 JDBC 사용시 로직 적어주기
		
		// 단 init 는 단 한번만 호출되니까 여기에 적어줌..
		dao = new MemberDAO();
	}
	

	// 비지니스 로직
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//관리자
		String adminId = this.getInitParameter("adminId");
		
		//사용자
		String userId = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String msg = "";
		
		//모델 영역 시작 ->
		MemberDTO dto = dao.getMemberInfo(userId, pwd);
		if ( dto != null && dto.getMemberId() != null) {
			req.setAttribute("MemberDTO", dto);
//			req.setAttribute("msg", dto.getName()+"회원님("+dto.getMemberId()+") 로그인");
			msg = dto.getName()+" 회원님 ("+dto.getMemberId()+") 로그인";
			
		}else {
			if(adminId.equals(userId)) {
//				req.setAttribute("msg", "관리자 ("+adminId+") 로그인 성공");
				msg = " 관리자 ("+adminId+") 로그인 성공";
			} else {
//				req.setAttribute("msg", "정회원만 사용 가능한 사이트 입니다");
				msg = " 정회원만 사용 가능한 사이트 입니다.";
			}
		}
//		Map<String, String> bbsInfo = new hashMap<>();
//		bbsInfo.put("pageNo", page_no);
//		
		req.setAttribute("msg", msg);
		req.getRequestDispatcher("Member.jsp").forward(req, res);
	}
	

	@Override
	public void destroy() {
		dao.close();
		
		
	}
}
