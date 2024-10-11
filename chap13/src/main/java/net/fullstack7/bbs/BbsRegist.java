package net.fullstack7.bbs;

import java.io.IOException;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.fullstack7.common.CommonFileUtil;

/**
 * Servlet implementation class BbsRegistOk
 * 
 */

@MultipartConfig(
		maxFileSize = 1024 * 1024 * 1,
		maxRequestSize = 1024 * 1024 * 10
		)
public class BbsRegist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		res.getWriter().append("Served at: ").append(req.getContextPath());
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		doGet(req, res);
		System.out.println("===================================================");
		System.out.println("BbsRegistOk >> doPost Start");
		//파일을 업로드하는 경로
		//D:\java7\JSP\chap13\src\main\webapp\Uplodes
//		String saveDir1 = getServletContext().getRealPath("/Uploads");
		String saveDir = "D:\\java7\\JSP\\chap13\\src\\main\\webapp\\Uploads";
		
		System.out.println("saveDir : " + saveDir);
		//요청 받은 파라미터 처리
		String memberId = req.getParameter("memberId");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String fileCategory = req.getParameter("fileCategory");
		
		// 파일 업로드
		String orgFileName = CommonFileUtil.fileUpload(req, saveDir, "file");
//		String newFileName = CommonFileUtil.fileRename(saveDir, orgFileName);
		
		Map<String, String> fmap = CommonFileUtil.fileRename(saveDir, orgFileName);
		
		//DTO 설정
		BbsDTO dto = new BbsDTO();
		dto.setMemberId(memberId);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setFileCategory(fileCategory);
		dto.setFilePath(fmap.get("filePath"));
		dto.setFileName(fmap.get("newFileName"));
		dto.setFileExt(fmap.get("fileExt"));
		dto.setFileSize((Integer.parseInt(fmap.get("fileSize"))));
		
		BbsDAO dao = new BbsDAO();
		int result = dao.setBbsRegist(dto);
		
		if (result > 0) {
			res.sendRedirect("/chap13/bbs/list.jsp");
		}else {
			CommonFileUtil.fileDelete(req, saveDir, orgFileName);
			CommonFileUtil.fileDelete(req, saveDir, fmap.get("newFileName"));
			
			req.setAttribute("errMsg", "게시글 등록시 오류 발생");
			req.getRequestDispatcher("/chap13/FileUpload.jsp").forward(req, res);
		}
		
		System.out.println("BbsRegistOk >> doPost End");
		System.out.println("===================================================");
	}

}
