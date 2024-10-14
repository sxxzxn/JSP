package net.fullstack7.bbs;

import java.io.IOException;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.fullstack7.utils.CommonFileUtil;

@MultipartConfig(
	maxFileSize = 1024*1024*1,
	maxRequestSize = 1024*1024*10
)


public class BbsModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("./bbs/regist.jsp").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		doGet(req, res);
		
		// ===========전체로직=========
		// 1. 폼 데이터를 전송 받아서 변수에 할당
		// 2. 파일 업로드 처리 -> 실패시 롤백
		// 3. DAO를 통해 DB 프로세스 진행 -> INSERT
		// 4. INSERT 상태에 따라
		// 성공 --> send.redirect -->list
		// 실패 --> regist.jsp 
		
		
		// 1. 폼 데이터를 전송 받아서 변수에 할당
		BbsDTO dto = new BbsDTO();
		dto.setMemberId(req.getParameter("memberid"));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		dto.setDisplayDate(req.getParameter("displaydate"));
		dto.setFileCategory(req.getParameter("fileCategory"));
		
		//D:\java7\JSP\mvc\src\main\webapp\Uploads
		String saveDir = "D:\\java7\\JSP\\mvc\\src\\main\\webapp\\Uploads";
		System.out.println("saveDir : " + saveDir);
		
		
		String filePath = "";
		String newFileName = "";
		String fileExt = "";
		int fileSize = 0;
		
		String orgFileName = CommonFileUtil.fileUpload(req, saveDir, "file1");
//		String newFileName = CommonFileUtil.fileRename(saveDir, orgFileName);
		Map<String, String> fmap = CommonFileUtil.fileRename(saveDir, orgFileName);
		if(fmap != null) {
			filePath = fmap.get("filePath");
			newFileName = fmap.get("newFileName");
			fileExt = fmap.get("fileExt");
			fileSize = Integer.parseInt(fmap.get("fileSize"));
			
		}
//		dto.setFilePath(fmap.get("filePath"));
//		dto.setFileName(fmap.get("newFileName"));
//		dto.setFileExt(fmap.get("fileExt"));
//		dto.setFileSize(Integer.parseInt(fmap.get("fileSize")));
		
		System.out.println("orgFileName : " + orgFileName);
		System.out.println("newFileName : " + fmap.get("newFileName"));
		
		BbsDAO dao = new BbsDAO();
		int row = dao.registBbs(dto);
		
		if(row>0) {
			res.sendRedirect("/list.do");
		}else {
			CommonFileUtil.fileDelete(req, saveDir, orgFileName);
			CommonFileUtil.fileDelete(req, saveDir, fmap.get("newFileName"));
			
			req.setAttribute("errMsg", "게시글 등록시 에러 발생");
			req.getRequestDispatcher("./bbs/regist.jsp").forward(req, res);
			
		}
		dao.close();

	}

}
