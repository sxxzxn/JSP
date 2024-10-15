package net.fullstack7.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/member/login.do")
public class MemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("/member/login.jsp").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 1. 요청 파라미터에서 사용자 입력 정보 받아오기
	    String memberId = req.getParameter("memberId");
	    String pwd = req.getParameter("pwd");

	    // 2. DTO 객체에 입력 정보 저장
	    MemberDTO dto = new MemberDTO();
	    dto.setMemberId(memberId);
	    dto.setPwd(pwd);

	    // 3. 로그인 처리 (DAO 호출)
	    MemberDAO dao = new MemberDAO();
	    dto = dao.login(dto);

	    if (dto != null) {
	        // 4. 로그인 성공: 세션에 사용자 정보 저장
	    	req.getSession().setAttribute("memberId", dto.getMemberId());
	    	req.getSession().setAttribute("name", dto.getName());
	        req.getSession().setAttribute("loginMember", dto);

	        // 5. 성공 시, 메인 페이지로 리다이렉트
	        res.sendRedirect(req.getContextPath() + "/bbs/list.do");
	    } else {
	        // 6. 로그인 실패: 다시 로그인 페이지로
	        req.setAttribute("errMsg", "아이디 비번확인");
	        req.getRequestDispatcher("/member/login.jsp").forward(req, res);
	    }
	}

}
