package net.fullstack7.bbs;

import java.util.ArrayList;
import java.util.List;

public class BbsDAO extends net.fullstack7.common.DBConnPool{
	
//	//전체 게시글 조회
//	public List<BbsDTO> getBbsList(){
//		String sql = "SELECT idx, title, memberId, readCnt, regDate FROM tbl_bbs";
//		List<BbsDTO> listDto = new ArrayList<BbsDTO>();
//		
//		try {
//			pstm = con.prepareStatement(sql);
//			rs = pstm.executeQuery();
//			
//			while(rs.next()) {
//				BbsDTO dto = new BbsDTO();
//				
//				dto.setIdx(rs.getInt("idx"));
//				dto.setTitle(rs.getString("title"));
//				dto.setMemberId(rs.getString("memberId"));
//				dto.setReadCnt(rs.getInt("readCnt"));
////				dto.setRegDate(timestamp.toLocalDateTime());
//				
//				listDto.add(dto);
//				
//			}
//		}catch(Exception e) {
//			System.out.println("==================================================");
//			System.out.println("게시글리스트 조회 실패");
//			System.out.println(e.getMessage());
//			System.out.println("==================================================");
//			
//		}finally {
//			
//			close();
//		}
//		
//		return listDto;
//	}
	
	
	// 특정 게시글 조회
	public BbsDTO getBbsNo(int idx) {
		String sql = "SELECT title, memberId, content FROM tbl_bbs where idx=?";
		BbsDTO dto = new BbsDTO();
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, idx);
			rs=pstm.executeQuery();
			
			if(rs.next()) {
				dto.setTitle(rs.getString("title"));
				dto.setMemberId(rs.getString("memberId"));
				dto.setContent(rs.getString("content"));
				dto.setIdx(idx);
			}
		}catch(Exception e) {
			System.out.println("특정 게시글 조회 실패 : " + e.getMessage());
			
		}finally {
			close();
		}
		
		return dto;
	}
	
	// 게시글 등록
	// 추후 파일 테이블 분리해서 FileDTO 도 매개변수로 넣어야함
	public int setBbsRegist(BbsDTO dto) {
		int row = 0;
		String sql = "INSERT INTO tbl_bbs(title, content, memberId, filePath, fileName, fileExt, fileSize, fileCategory) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1,dto.getTitle());
			pstm.setString(2,dto.getContent());
			pstm.setString(3,dto.getMemberId());
			
			pstm.setString(4,dto.getFilePath());
			pstm.setString(5,dto.getFileName());
			pstm.setString(6,dto.getFileExt());
			pstm.setInt(7,dto.getFileSize());
			pstm.setString(8,dto.getFileCategory());
			
			row = pstm.executeUpdate();
			
			System.out.println("게시글 등록 성공 :"+row);
		}catch(Exception e) {
			System.out.println(" 게시글 등록 실패 "+e.getMessage());
			
		}finally {
			
			close();
		}
	
		return row;
	}
	
	// 게시글 수정
	public int setBbsModify(BbsDTO dto) {
		int row = 0;
		String sql = "UPDATE tbl_bbs SET title= ?, content =?, modifyDate = now() WHERE idx = ?";
		try {
			pstm=con.prepareStatement(sql);
			pstm.setString(1,dto.getTitle());
			pstm.setString(2,dto.getContent());
			pstm.setInt(3,dto.getIdx());
			
			//오류확인
//			System.out.println("제목: " + bbs.getTitle());
//			System.out.println("내용: " + bbs.getContent());
//			System.out.println("인덱스: " + bbs.getIdx());
//			System.out.println("SQL 쿼리: " + sql);
			
			row = pstm.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시글 수정 실패 : " +e.getMessage());
		}finally {
			close();
		}
		return row;
	}
	
	// 게시글 삭제
	public int setBbsDelete(int idx) {
		int row = 0; 
		String sql = "DELETE FROM tbl_bbs where idx =?";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, idx);
			
			row = pstm.executeUpdate();
			
			
		}catch(Exception e) {
			System.out.println("삭제 실패 : "+e.getMessage());
		}finally {
			close();
		}
		return row;
	}
	
	// 다중삭제
	public int setBbsDeletes(int[] idxs) {
	    int row = 0; 
	    String sql = "DELETE FROM tbl_bbs WHERE idx = ?";
	    try {
	        pstm = con.prepareStatement(sql);
	        
	        // 각각의 idx에 대해 삭제 실행
	        for (int idx : idxs) {
	            pstm.setInt(1, idx);
	            row += pstm.executeUpdate();
	        }
	        
	    } catch(Exception e) {
	        System.out.println("삭제 실패 : " + e.getMessage());
	    }
	    return row;
	}
	
	// 페이징+전체게시글조회
//	public BbsDTO getBbsList(int pageNo, int pageSize, String searchFiled[], String[] searcgWord, String[] sortField, String[] sortOrder) {
	
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
//            	System.out.println("BbsDAO.java getTotalPageCnt : " + total);

			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("getTotalPageCnt 오류 : " + e.getMessage());
		}
//		System.out.println("총 게시물 수 total : " + total);
		return total;
	}
	
	// 조회수 증가
		public void increaseViews(int idx) {
			String sql = "";
			int row = 0;
			try {
				sql = "UPDATE tbl_bbs set readCnt = readCnt + 1 where idx = ?" ;
				pstm = con.prepareStatement(sql);
				
				pstm.setInt(1, idx);
				row = pstm.executeUpdate();
					if(row > 0) {
						System.out.println(idx + "번 게시글 조회수 +1");
					}else {
						System.err.println("증가 실패");
					}
			}catch(Exception e) {
				e.printStackTrace();
			} 
		}

}
