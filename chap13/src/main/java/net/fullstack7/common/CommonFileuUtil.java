package net.fullstack7.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class CommonFileuUtil {
	public CommonFileuUtil() {}
	
	// 파일 업로드
	public static String UploadFile(HttpServletRequest req, String saveDir , String inFileTagName)
	throws ServletException, IOException{
		System.out.println("=========================================");
		System.out.println(" CommonFileuUtil >>> UploadFile Start ");
		
		// part 객체를 사용
		Part part = req.getPart("inFileTagName");
		
		// 헤더값에서 파일 객체 부분 읽어 오기
		String partHeader = part.getHeader("content-dispostion");
		// 파일 객체 부분 : from-data;name="attchFile"; filename="파일명"
		System.out.println("partHeader : "+ partHeader);
		String [] arrPartHeader = partHeader.split("filename=");
		String orgFileName = arrPartHeader[1].trim().replace("\"","");
		
		if(! orgFileName.isEmpty() ) {
			System.out.println("orgFileName : " + orgFileName);
			
			//파일을 업로드하는 경로
			//D:\java7\JSP\chap13\src\main\webapp\Uplodes
			part.write(saveDir + File.separator +orgFileName);
		}
		
		System.out.println(" CommonFileuUtil >>> UploadFile End ");
		System.out.println("=========================================");
		return orgFileName;
	}
	
	// 업로드된 파일명 변경
	public static String fileRename(String saveDir, String fileName) {
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
		
		return newFileName;
	}
	
	// 파일 다운로드
	
	public static void fileDownload(HttpServletRequest req, HttpServletResponse res, String dir , String orgFileName, String outFileName) {
		//dir : D:\java7\JSP\chap13\src\main\webapp\Uplodes
		//dit : Uploads
		
		String realPath = req.getServletContext().getRealPath(dir);
		try {
			File file = new File(realPath, orgFileName);
			InputStream is = new FileInputStream(file);
			
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
			while( (readBuffer = is.read(b)) > 0 ) {
				outStream.write(b, 0, readBuffer);
			}
			
		}catch (FileNotFoundException fileE) {
			
		}
		
		catch (Exception e) {
			
		}
		 
		
		
		
		
	}

}
