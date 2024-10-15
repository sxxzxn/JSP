package net.fullstack7.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/member/list.do")

public class MemberListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		MemberDAO dao = new MemberDAO();
//	    
//	    String searchKeyword = req.getParameter("searchKeyword");
//	    int pageNo = Integer.parseInt(req.getParameter("pageNo") != null ? req.getParameter("pageNo") : "1");
//	    int pageSize = Integer.parseInt(req.getParameter("pageSize") != null ? req.getParameter("pageSize") : "10");
//
//	    List<MemberDTO> mList = dao.memberInfo(pageNo, pageSize);
//	    int totalMembers = dao.getMemberCnt(searchKeyword);
//	    
//	    req.setAttribute("memberList", mList);
//	    req.setAttribute("totalMembers", totalMembers);
//	    req.setAttribute("pageNo", pageNo);
//	    req.setAttribute("pageSize", pageSize);
//	    req.setAttribute("searchKeyword", searchKeyword);
//	    
//	    req.getRequestDispatcher("memberList.jsp").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
////		doGet(req, res);
//		
//
//	 	MemberDTO dto = new MemberDTO();
//        dto.setMemberId(req.getParameter("memberid"));
//        dto.setName(req.getParameter("name"));
//        dto.setJumin(req.getParameter("jumin"));
//        dto.setAddr1(req.getParameter("addr1"));
//        dto.setAddr2(req.getParameter("addr2"));
//        dto.setBirthday(req.getParameter("birthday"));
//        dto.setJobCode(req.getParameter("jobCode"));
//        dto.setMileage(Integer.parseInt(req.getParameter("mileage")));
//        String regDateStr = req.getParameter("regDate");
//        if (regDateStr != null && !regDateStr.isEmpty()) {
//            LocalDateTime regDate = LocalDateTime.parse(regDateStr);
//            dto.setRegDate(regDate);
//        } else {
//            dto.setRegDate(LocalDateTime.now());
//        }
//        
//        
////        MemberDAO dao = new MemberDAO();
////        try {
////            dao.registMember(dto);  
////        } finally {
////            dao.close();  
////        }
//        
//        
//        res.sendRedirect("list.do"); 

	}

}
