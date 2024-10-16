package net.fullstack7.file;

import java.time.LocalDateTime;

public class FileDTO {
    private int fileIdx; 			// 파일 번호
    private int bbsIdx; 		// 파일이 저장된 게시글 번호 (nullable)
    private String filePath; 		// 파일 저장 경로 (nullable)
    private String fileOrgName; 	// 파일 원본 이름 (nullable)
    private String fileNewName; 	// 서버에 저장된 파일명 (nullable)
    private String fileExt;			// 파일 확장자 (nullable)
    private int fileSize; 			// 파일 사이즈 (default 0)
    private String fileCategory; 	// 파일 카테고리 (nullable)
    private LocalDateTime regDate;  // 파일 업로드일 (nullable)
    
    
	public int getFileIdx() {
		return fileIdx;
	}
	public void setFileIdx(int fileIdx) {
		this.fileIdx = fileIdx;
	}
	public int getBbsIdx() {
		return bbsIdx;
	}
	public void setBbsIdx(Integer bbsIdx) {
		this.bbsIdx = bbsIdx;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileOrgName() {
		return fileOrgName;
	}
	public void setFileOrgName(String fileOrgName) {
		this.fileOrgName = fileOrgName;
	}
	public String getFileNewName() {
		return fileNewName;
	}
	public void setFileNewName(String fileNewName) {
		this.fileNewName = fileNewName;
	}
	public String getFileExt() {
		return fileExt;
	}
	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileCategory() {
		return fileCategory;
	}
	public void setFileCategory(String fileCategory) {
		this.fileCategory = fileCategory;
	}
	public LocalDateTime getRegDate() {
		return regDate;
	}
	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}

}
