

package net.fullstack7.bbs;

import java.util.ArrayList;
import java.util.List;

import net.fullstack7.common.DBConnPool;

public class BbsDAO extends DBConnPool {
	
	// 게시글 등록
	public int registBbs(BbsDTO dto) {
		System.out.println("=========BbsDao >> registBbs Start==============" );
		
		String sql = "INSERT INTO tbl_bbs (memberId,title,content,displayDate, "
				+ "filePath,fileName,fileExt,fileSize,fileCategory) values("
				+ "?, ?, ?, ?, "
				+ "?, ?, ?, ?, ?)";
		
		System.out.println("쿼리문확인" + sql);
		int row = 0;
		try {
			pstm = con.prepareStatement(sql);
			
			pstm.setString(1, dto.getMemberId());
			pstm.setString(2, dto.getTitle());
			pstm.setString(3, dto.getContent());
			pstm.setString(4, (dto.getDisplayDate() != null ? dto.getDisplayDate() : ""));
			pstm.setString(5, (dto.getFilePath()!= null ? dto.getFilePath() : ""));
			pstm.setString(6, (dto.getFileName()!= null ? dto.getFileName() : ""));
			pstm.setString(7, (dto.getFileExt()!= null ? dto.getFileExt() : ""));
			pstm.setInt(8, dto.getFileSize());
			pstm.setString(9, (dto.getFileCategory()!= null ? dto.getFileCategory() : ""));

			row = pstm.executeUpdate();
			
			if( row > 0 ) {
				System.out.println("글작성완료");
			}else {
				System.out.println("글작성실패"+dto.getTitle());
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(dto.getTitle()+"글작성실패"+e.getMessage());
		}
		
		System.out.println("=========BbsDao >> registBbs End ==============" );
		return row;
	}
	
	// 조회수증가
	public int increaseView (int idx) {
		int row = 0;
		String sql = "UPDATE tbl_bbs SET readCnt = readCnt + 1 where idx = ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, idx);
			
			row = pstm.executeUpdate();
			
			if (row >0) {
				System.out.println(idx+"조회수증가");
			}else {
				System.out.println(idx+"조회수 증가 실패");
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("오류 : " + e.getMessage());
		}
		return row;
	}
	
	
	// 게시글 조회
	public BbsDTO viewBbs(BbsDTO dto) {
		System.out.println("BbsDTO viewBb 시작");
		
		String sql = "SELECT memberId,title,content,displayDate,filePath,fileName,fileExt,fileCategory from tbl_bbs where idx =?";
		
		try {
			pstm =con.prepareStatement(sql);
			pstm.setInt(1, dto.getIdx());
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				dto.setMemberId(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setDisplayDate(rs.getString(4));
				dto.setFilePath(rs.getString(5));
				dto.setFileName(rs.getString(6));
				dto.setFileExt(rs.getString(7));
				dto.setFileCategory(rs.getString(8));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("public BbsDTO viewBbs 에러메세지 확인 : "+e.getMessage());
		}
		return dto;
	}
	
	
	// 전체 게시글 목록 조회
//	public List<BbsDTO> list(int page, int pageSize, String searchCatecory, String searchWord, String sortCategory, String sortOrder) {
	public List<BbsDTO> list() {
		String sql = "SELECT idx, memberId, title, content, regDate, readCnt from tbl_bbs ORDER BY idx desc";
		List<BbsDTO> list = new ArrayList();
		
		try {
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			
				while (rs.next()) {
					BbsDTO dto = new BbsDTO();
					dto.setIdx(rs.getInt("idx"));
					dto.setMemberId(rs.getString("memberId"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setRegDate(rs.getTimestamp("regDate").toLocalDateTime());
					dto.setReadCnt(rs.getInt("readCnt"));
					list.add(dto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("public List<BbsDTO> list : "+e.getMessage());
		}
		return list;
	}
	
	
	// 페이징 추가 전체리스트
	public List<BbsDTO> getBbsList(int pageNo, int pageSize, String searchType, String searchKeyword){
//		System.out.println("getBbsList()시작");
	List<BbsDTO> bbsList = new ArrayList<>();

	String sql = "";
	
    if (searchType != null && !searchType.isEmpty() && searchKeyword != null && !searchKeyword.isEmpty()) {
        if ("title".equals(searchType)) {
            sql = "SELECT idx, title, content, memberId, regDate, modifyDate, readCnt FROM tbl_bbs WHERE title LIKE ? ORDER BY idx desc LIMIT ? OFFSET ?";
        } else if ("memberId".equals(searchType)) {
            sql = "SELECT idx, title, content, memberId, regDate, modifyDate, readCnt FROM tbl_bbs WHERE memberId LIKE ? ORDER BY idx desc LIMIT ? OFFSET ?";
        }
    } else {
        sql = "SELECT idx, title, content, memberId, regDate, modifyDate, readCnt FROM tbl_bbs ORDER BY idx desc LIMIT ? OFFSET ?";
    }
		try {
			pstm = con.prepareStatement(sql);
			
			int offset = (pageNo -1) * pageSize;
			  if (searchType != null && !searchType.isEmpty() && searchKeyword != null && !searchKeyword.isEmpty()) {
		            pstm.setString(1, "%" + searchKeyword + "%");
		            pstm.setInt(2, pageSize);
		            pstm.setInt(3, offset);
		        } else {
		            pstm.setInt(1, pageSize);
		            pstm.setInt(2, offset);
		        }
			 
			rs = pstm.executeQuery();
			while (rs.next()) {
				BbsDTO dto = new BbsDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setMemberId(rs.getString("memberId"));
				dto.setRegDate(rs.getTimestamp("regDate").toLocalDateTime());
				dto.setModifyDate(rs.getTimestamp("modifyDate").toLocalDateTime());
				dto.setReadCnt(rs.getInt("readCnt"));
				
				bbsList.add(dto);
			}
			
		}catch(Exception e) {
			System.out.println("페이징 확인 불가 : " + e.getMessage());
			
		}
//		System.out.println("getBbsList 호출, pageNo: " + pageNo + ", pageSize: " + pageSize);
		
		return bbsList;
	}
	
	
	// 페이지수 확인
	public int getTotalPageCnt(String searchType, String searchKeyword) {
//		System.out.println("getTotalPageCnt()시작");
		int total = 0;
		String sql="";

        if (searchType != null && !searchType.isEmpty() && searchKeyword != null && !searchKeyword.isEmpty()) {
            sql = "SELECT COUNT(idx) FROM tbl_bbs WHERE " + searchType + " LIKE ?";
        } else {
            sql = "SELECT COUNT(idx) FROM tbl_bbs";
        }
		try {
			pstm = con.prepareStatement(sql);
			if (searchType != null && !searchType.isEmpty() && searchKeyword != null && !searchKeyword.isEmpty()) {
                pstm.setString(1, "%" + searchKeyword + "%");
            }
            rs = pstm.executeQuery();
            if (rs.next()) {
            	total = rs.getInt(1);
            	System.out.println("전체페이지"+total);

			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("getTotalPageCnt 오류 : " + e.getMessage());
		}
//		System.out.println("총 게시물 수 total : " + total);
		return total;
	}
	
	
//	// 전체 게시글 목록 조회
//	public List<BbsDTO> listl(Map pMap) {
//		
//		
//try {
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//			System.out.println("public BbsDTO viewBbs 에러메세지 확인 : "+e.getMessage());
//		}
//		return null;
//	}

	
	// 게시글 수정
	public int modify(BbsDTO dto) {
		System.out.println("public int modify 시작");
		String sql = "UPDATE tbl_bbs SET content =?, modifyDate = now() WHERE idx = ?";
		int row = 0;
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getContent());
		    pstm.setInt(2, dto.getIdx());
			row = pstm.executeUpdate();

			if(row > 0) {
				System.out.println(dto.getIdx()+"게시글 수정 성공");
				
				
			}else {
				System.out.println(dto.getIdx()+"게시글 수정 실패");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("public int modify(BbsDTO dto) 에러메세지 확인 : "+e.getMessage());
		}
		return row;
	}
	
	
	// 게시글 삭제
//	public int delete(BbsDTO dto) {
//		String sql = "DELETE from tbl_bbs where idx = ?";
//		int row = 0;
//		try {
//			pstm = con.prepareStatement(sql);
//			pstm.setInt(1, dto.getIdx());
//			row = pstm.executeUpdate();
//			
//			if(row > 0) {
//				System.out.println(dto.getIdx()+ "번 게시글 삭제 성공");
//			}
//		}catch(Exception e) {
//			System.out.println(dto.getIdx()+ "번 게시글 삭제 실패");
//			e.printStackTrace();
//			System.out.println("public int delete(BbsDTO dto) 에러메세지 확인 : "+e.getMessage());
//		}
//		return row;
//	}
//	
	public int deleteMultiple(int[] idxArray) {
	    String sql = "DELETE FROM tbl_bbs WHERE idx = ?";
	    int totalDeletedRows = 0; // 삭제된 총 행 수

	    try {
	        pstm = con.prepareStatement(sql);

	        for (int idx : idxArray) {
	            pstm.setInt(1, idx);
	            totalDeletedRows += pstm.executeUpdate(); // 각 삭제된 행 수를 누적
	        }
	        
	        if (totalDeletedRows > 0) {
	            System.out.println(totalDeletedRows + "개 게시글 삭제 성공");
	        }
	    } catch (Exception e) {
	        System.out.println("게시글 삭제 실패");
	        e.printStackTrace();
	        System.out.println("deleteMultiple 메서드 에러메시지 확인: " + e.getMessage());
	    }
	    return totalDeletedRows; 
	}

}
