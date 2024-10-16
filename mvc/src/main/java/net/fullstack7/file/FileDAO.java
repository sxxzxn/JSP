package net.fullstack7.file;

import java.util.ArrayList;
import java.util.List;

import net.fullstack7.common.DBConnPool;

public class FileDAO extends DBConnPool {
	// 파일 업로드
	public int registFile (FileDTO dto) {
		System.out.println("파일업로드DAO");
		int row = 0;
		String sql = "INSERT INTO tbl_file (bbsIdx, filePath, fileOrgName, fileNewName,"
				+ " fileExt, fileSize, fileCategory) VALUES(?, ?, ?, ?, ?, ?, ?)";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, dto.getBbsIdx());
			pstm.setString(2, dto.getFilePath());
			pstm.setString(3, dto.getFileOrgName());
			pstm.setString(4, dto.getFileNewName());
			pstm.setString(5, dto.getFileExt());
			pstm.setInt(6, dto.getFileSize());
			pstm.setString(7, dto.getFileCategory());
			row = pstm.executeUpdate();
			if(row> 0) {
				System.out.println("파일 등록 성공");
			}else {
				System.out.println("파일 등록 실패");
			}
			System.out.println("bbsIdx: " + dto.getBbsIdx());
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("파일 DAO 등록 실패 " + e.getMessage());
		}
		
		return row;
	}
	
	// 게시글에서 파일 확인
	public List<FileDTO> fileList(int bbsIdx){
		System.out.println("파일리스트출력 DAO");
		List<FileDTO> fList = new ArrayList<FileDTO>();
		String sql = "SELECT filePath, fileOrgName, fileNewName, fileExt, fileSize, fileCategory FROM tbl_file WHERE bbsIdx = ? ORDER BY regDate Desc";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, bbsIdx);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				FileDTO dto = new FileDTO();
				
				dto.setFilePath(rs.getString("filePath"));
	            dto.setFileOrgName(rs.getString("fileOrgName"));
	            dto.setFileNewName(rs.getString("fileNewName"));
	            dto.setFileExt(rs.getString("fileExt"));
	            dto.setFileSize(rs.getInt("fileSize"));
	            dto.setFileCategory(rs.getString("fileCategory"));
	            
	            fList.add(dto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("파일 리스트 출력 오류 : " + e.getMessage() );
		}
		
		return fList;
	}
	

}
