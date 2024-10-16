package net.fullstack7.bbs;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.fullstack7.file.FileDAO;
import net.fullstack7.file.FileDTO;
import net.fullstack7.utils.CommonFileUtil;

@MultipartConfig(
    maxFileSize = 1024 * 1024 * 1,  // 1MB
    maxRequestSize = 1024 * 1024 * 10 // 10MB
)

public class BbsRegistController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	req.getRequestDispatcher("regist.jsp").forward(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	System.out.println("글등록 컨트롤러 시작");
        // 1. 폼 데이터를 전송 받아서 변수에 할당
        BbsDTO dto = new BbsDTO();
        dto.setMemberId(req.getParameter("memberid"));
        dto.setTitle(req.getParameter("title"));
        dto.setContent(req.getParameter("content"));
        dto.setDisplayDate(req.getParameter("displaydate"));
        
        req.setAttribute("dto", dto);
        // 게시글 데이터 등록
        BbsDAO bbsDao = new BbsDAO();
        int bbsIdx = bbsDao.registBbs(dto);
        System.out.println("bbsIdx: " + bbsIdx);

        if (bbsIdx > 0) {
            // 2. 다중 파일 업로드 처리
            String saveDir = "D:\\java7\\JSP\\mvc\\src\\main\\webapp\\Uploads";
            System.out.println("saveDir : " + saveDir);

            // 다중 파일 업로드 처리 (파일 리스트)
            List<String> orgFileNameList = CommonFileUtil.multiFileUpload(req, saveDir, "files");

            if (orgFileNameList != null && !orgFileNameList.isEmpty()) {
                for (String orgFileName : orgFileNameList) {
                    // 파일 이름 변경
                    Map<String, String> fmap = CommonFileUtil.fileRename(saveDir, orgFileName);
                    if (fmap != null) {
                        String filePath = fmap.get("filePath");
                        String newFileName = fmap.get("newFileName");
                        String fileExt = fmap.get("fileExt");
                        int fileSize = Integer.parseInt(fmap.get("fileSize"));

                        // 파일 정보를 FileDTO에 저장
                        FileDTO fileDto = new FileDTO();
                        fileDto.setBbsIdx(bbsIdx); // 게시글 번호를 외래키로 설정
                        fileDto.setFilePath(filePath);
                        fileDto.setFileOrgName(orgFileName);
                        fileDto.setFileNewName(newFileName);
                        fileDto.setFileExt(fileExt);
                        fileDto.setFileSize(fileSize);
                        fileDto.setFileCategory(req.getParameter("fileCategory"));

                        // 파일 정보를 DB에 저장
                        FileDAO fileDao = new FileDAO();
                        int fileRow = fileDao.registFile(fileDto);
                        
                        System.out.println(bbsIdx);
                        
                        if (fileRow <= 0) {
                            // 파일 등록 실패 시 롤백 처리
                            CommonFileUtil.fileDelete(req, saveDir, orgFileName);
                            CommonFileUtil.fileDelete(req, saveDir, fmap.get("newFileName"));
                            req.setAttribute("errMsg", "파일 등록 중 오류 발생");
                            req.getRequestDispatcher("/regist.jsp").forward(req, res);
                            return;  
                        }
                        fileDao.close();
                    }
                }
            }

            // 게시글과 파일 모두 성공적으로 등록됨
            res.sendRedirect("/mvc/bbs/list.do");

        } else {
            // 게시글 등록 실패 시 처리
            req.setAttribute("errMsg", "게시글 등록 중 오류 발생");
            req.getRequestDispatcher("/regist.jsp").forward(req, res);
        }
        bbsDao.close();
    
    	
    	
    	//단일파일
//        // 1. 폼 데이터를 전송 받아서 변수에 할당
//        BbsDTO dto = new BbsDTO();
//        dto.setMemberId(req.getParameter("memberid"));
//        dto.setTitle(req.getParameter("title"));
//        dto.setContent(req.getParameter("content"));
//        dto.setDisplayDate(req.getParameter("displaydate"));
//
//        // 게시글 데이터 등록
//        BbsDAO bbsDao = new BbsDAO();
//        int bbsIdx = bbsDao.registBbs(dto); 
//
//        if (bbsIdx > 0) {
//            // 2. 파일 업로드 처리
//            String saveDir = "D:\\java7\\JSP\\mvc\\src\\main\\webapp\\Uploads";
//            System.out.println("saveDir : " + saveDir);
//
//            String filePath = "";
//            String newFileName = "";
//            String fileExt = "";
//            int fileSize = 0;
//
//            // 파일 업로드
//            String orgFileName = CommonFileUtil.fileUpload(req, saveDir, "file1");
//            Map<String, String> fmap = CommonFileUtil.fileRename(saveDir, orgFileName);
//            if (fmap != null) {
//                filePath = fmap.get("filePath");
//                newFileName = fmap.get("newFileName");
//                fileExt = fmap.get("fileExt");
//                fileSize = Integer.parseInt(fmap.get("fileSize"));
//
//                // 파일 정보를 FileDTO에 저장
//                FileDTO fileDto = new FileDTO();
//                fileDto.setBbsIdx(bbsIdx); 
//                fileDto.setFilePath(filePath);
//                fileDto.setFileOrgName(orgFileName);
//                fileDto.setFileNewName(newFileName);
//                fileDto.setFileExt(fileExt);
//                fileDto.setFileSize(fileSize);
//                fileDto.setFileCategory(req.getParameter("fileCategory"));
//
//                // 파일 정보를 DB에 저장
//                FileDAO fileDao = new FileDAO();
//                int fileRow = fileDao.registFile(fileDto);
//
//                if (fileRow > 0) {
//                    res.sendRedirect("/mvc/bbs/list.do");
//                } else {
//                    CommonFileUtil.fileDelete(req, saveDir, orgFileName);
//                    CommonFileUtil.fileDelete(req, saveDir, fmap.get("newFileName"));
//                    req.setAttribute("errMsg", "파일 등록 중 오류 발생");
//                    req.getRequestDispatcher("/regist.jsp").forward(req, res);
//                }
//                fileDao.close();
//            }
//        } else {
//            // 게시글 등록 실패 시 처리
//            req.setAttribute("errMsg", "게시글 등록 중 오류 발생");
//            req.getRequestDispatcher("/regist.jsp").forward(req, res);
//        }
//        bbsDao.close();
    }
}