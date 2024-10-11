package net.fullstack7.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class CommonFileUtil {
	public CommonFileUtil() {}
	
	// 다중파일 업로드 
	public static List<String> multiFileUpload(HttpServletRequest req, String saveDir , String inFileTagName)
			throws ServletException, IOException{
				System.out.println("=========================================");
				System.out.println(" CommonFileuUtil >>> multiFileUpload Start ");
				
				// 파일명 처리 리스트
				List<String> fileNameList = new ArrayList<String>();
				
				// part 객체 --> 여러개 처리 
				Collection<Part> partList = req.getParts();
				// partList만큼 돌면서 처리
				for(Part part : partList) {
					
					// 헤더값에서 파일 객체 부분 읽어 오기
					String partHeader = part.getHeader("content-disposition");
					// 파일 객체 부분 : from-data;name="attchFile"; filename="파일명"
					System.out.println("partList >> part >> partHeader : "+ partHeader);
					String [] arrPartHeader = partHeader.split("filename=");
					String orgFileName = arrPartHeader[1].trim().replace("\"","");
					
					if(! orgFileName.isEmpty() ) {
						System.out.println("orgFileName : " + orgFileName);
						
						//파일을 업로드하는 경로
						//D:\java7\JSP\chap13\src\main\webapp\Uploads
						part.write(saveDir + File.separator +orgFileName);
						
						fileNameList.add(orgFileName);
					}		
				}
			
				
				System.out.println(" CommonFileuUtil >>> multiFileUpload End ");
				System.out.println("=========================================");
				return fileNameList;
			}
	
	
	// 파일 업로드
	public static String fileUpload(HttpServletRequest req, String saveDir , String inFileTagName)
	throws ServletException, IOException{
		System.out.println("=========================================");
		System.out.println(" CommonFileuUtil >>> UploadFile Start ");
		
		// part 객체를 사용
		Part part = req.getPart(inFileTagName);
		
		// 헤더값에서 파일 객체 부분 읽어 오기
		String partHeader = part.getHeader("content-disposition");
		// 파일 객체 부분 : from-data;name="attchFile"; filename="파일명"
		System.out.println("partHeader : "+ partHeader);
		String [] arrPartHeader = partHeader.split("filename=");
		String orgFileName = arrPartHeader[1].trim().replace("\"","");
		
		if(! orgFileName.isEmpty() ) {
			System.out.println("orgFileName : " + orgFileName);
			
			//파일을 업로드하는 경로
			//D:\java7\JSP\chap13\src\main\webapp\Uploads
			part.write(saveDir + File.separator +orgFileName);
		}
		
		System.out.println(" CommonFileuUtil >>> UploadFile End ");
		System.out.println("=========================================");
		return orgFileName;
	}
	
	// 업로드된 파일명 변경
	public static Map<String, String> fileRename(String saveDir, String fileName) {
		if ( saveDir == null || saveDir.isEmpty() || fileName == null || fileName.isEmpty()) {
			return null;
		}
		System.out.println("=========================================");
		System.out.println(" CommonFileuUtil >>> fileRename Start ");
		// 파일 확장자 추출
		String fileExt = fileName.substring(fileName.lastIndexOf("."));
		
		// 임시 파일명 생성
		String tmpName = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
		
		// 새로운 파일명 조합
		String newFileName = tmpName + fileExt;
		
		//기존 파일명 --> 새로운 파일명으로 변경
		File oldFile = new File(saveDir + File.separator + fileName);
		File newFile = new File(saveDir + File.separator + newFileName);
		oldFile.renameTo(newFile);
		
		Map<String, String> fmap = new HashMap<String, String>();
		fmap.put("filePath", saveDir);
		fmap.put("orgFileName", fileName);
		fmap.put("newFileName", newFileName);
		fmap.put("fileExt", fileExt);
		fmap.put("fileSize", String.valueOf(oldFile.length()));
		
		
		
		
		System.out.println(" saveDir : " + saveDir);
		System.out.println(" orgFileName : " + fileName);
		System.out.println(" newFileNam : " + newFileName);
		System.out.println(" fileExt : " + fileExt);
		System.out.println(" fileSize : " + String.valueOf(oldFile.length()));
		System.out.println(" CommonFileuUtil >>> fileRename End ");
		System.out.println("=========================================");
		
		return fmap;
	}
	
	// 파일 다운로드
	
	public static void fileDownload(HttpServletRequest req, HttpServletResponse res, String dir , String orgFileName, String outFileName) {
		//dir : D:\java7\JSP\chap13\src\main\webapp\Uploads
		//dit : Uploads
		
		String realPath = req.getServletContext().getRealPath(dir);
		try {
			File file = new File(realPath, orgFileName);
			InputStream inputStream = new FileInputStream(file);
			
			// 클라이언트의 브라우저 체크
			String userAgent = req.getHeader("User-Agent");
			if ( userAgent.indexOf("WOW64")  == -1) {
				outFileName = new String(outFileName.getBytes("UTF-8"),"ISO-8859-1");
				
			}else {
				outFileName = new String(outFileName.getBytes("KSC5601"),"ISO-8859-1");
				
			}
			
			// 다운로드할 파일의 응답 헤더 설정
			res.reset();
			res.setContentType("application/octet-stream");
			res.setHeader("Content-Disposition", "attatch; fileneme=\""+ outFileName + "\"");
			res.setHeader("Content-Length", ""+file.length() );
			
			//response 내장 객체를 이용하여 출력 스트림 생성
			OutputStream outStream = res.getOutputStream();
			
			// 출력 트림에 fail 내용 출력 
			byte b [] = new byte[(int)file.length()];
			int readBuffer = 0;
			while( (readBuffer = inputStream.read(b)) > 0 ) {
				outStream.write(b, 0, readBuffer);
			}
			
			// 입출력 스트립 닫기
			inputStream.close();
			outStream.close();
			
		}catch (FileNotFoundException e) {
			System.out.println("파일 미확인 : " + e.getMessage());
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("예외 발생 : " + 
		e.getMessage());
			e.printStackTrace();
			
		}
	}
	
	
	// 파일 삭제
	public static void fileDelete(HttpServletRequest req, String dir, String fileName) {
		System.out.println("=========================================");
		System.out.println(" CommonFileuUtil >>> fileDelete Start ");
		File file = new File(dir + File.separator + fileName);
		try {
			// 파일이 존재할 경우 삭제
			if( file.exists() ) {
				file.delete();
				System.out.println(dir + File.separator + fileName);
			}
			
		}catch(Exception e) { 
			System.out.println("파일 삭제 관련 오류 : " + e.getMessage());
			System.out.println(dir + File.separator + fileName);
			e.printStackTrace();
			
		}
		
		System.out.println(" CommonFileuUtil >>> fileDelete End ");
		System.out.println("=========================================");
	}
}