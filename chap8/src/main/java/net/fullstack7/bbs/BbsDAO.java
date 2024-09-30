package net.fullstack7.bbs;

import java.util.ArrayList;
import java.util.List;

public class BbsDAO extends net.fullstack7.common.DBConnPool{
	
	//전체 게시글 조회
	public List<BbsDTO> getBbsList(){
		String sql = "SELECT idx, title, memberId, readCnt, regDate FROM tbl_bbs";
		List<BbsDTO> listDto = new ArrayList<BbsDTO>();
		
		try {
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				BbsDTO dto = new BbsDTO();
				
				dto.setIdx(rs.getInt("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setMemberId(rs.getString("memberId"));
				dto.setReadCnt(rs.getInt("readCnt"));
//				dto.setRegDate(timestamp.toLocalDateTime());
				
				listDto.add(dto);
				
			}
		}catch(Exception e) {
			System.out.println("==================================================");
			System.out.println("게시글리스트 조회 실패");
			System.out.println(e.getMessage());
			System.out.println("==================================================");
			
		}finally {
			
			close();
		}
		
		return listDto;
	}
	
	
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
			System.out.println("==================================================");
			System.out.println("특정 게시글 조회 실패");
			System.out.println(e.getMessage());
			System.out.println("==================================================");
			
		}finally {
			close();
		}
		
		return dto;
	}
	
	// 게시글 등록
	public int setBbsRegist(BbsDTO bbs) {
		System.out.println("setBbsRegist실행");
		int result = 0;
		String sql = "INSERT INTO tbl_bbs(title, content, memberId) VALUES(?, ?, ?)";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1,bbs.getTitle());
			pstm.setString(2,bbs.getContent());
			pstm.setString(3,bbs.getMemberId());
			
			result = pstm.executeUpdate();
			
			System.out.println("게시글 등록 성공 :"+result);
		}catch(Exception e) {
			System.out.println("==================================================");
			System.out.println("게시글 등록 실패");
			System.out.println(e.getMessage());
			System.out.println("==================================================");
			
		}finally {
			
			close();
		}
	
		return result;
	}
	
	// 게시글 수정
	public int setBbsModify(BbsDTO bbs) {
		int result =0;
		String sql = "UPDATE tbl_bbs SET title= ?, content =?, modifyDate = now() WHERE idx = ?";
		try {
			pstm=con.prepareStatement(sql);
			pstm.setString(1,bbs.getTitle());
			pstm.setString(2,bbs.getContent());
			pstm.setInt(3,bbs.getIdx());
			
			//오류확인
//			System.out.println("제목: " + bbs.getTitle());
//			System.out.println("내용: " + bbs.getContent());
//			System.out.println("인덱스: " + bbs.getIdx());
//			System.out.println("SQL 쿼리: " + sql);
			
			result = pstm.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시글 수정 실패 : " +e.getMessage());
		}finally {
			close();
		}
		return result;
	}
	
	// 게시글 삭제
	public int setBbsDelete(int idx) {
		int result = 0; 
		String sql = "DELETE FROM tbl_bbs where idx =?";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, idx);
			
			result = pstm.executeUpdate();
			
			
		}catch(Exception e) {
			System.out.println("삭제 실패 : "+e.getMessage());
		}finally {
			close();
		}
		return result;
	}
	
	// 다중삭제
	public int setBbsDeletes(int[] idxs) {
	    int result = 0; 
	    String sql = "DELETE FROM tbl_bbs WHERE idx = ?";
	    try {
	        pstm = con.prepareStatement(sql);
	        
	        // 각각의 idx에 대해 삭제 실행
	        for (int idx : idxs) {
	            pstm.setInt(1, idx);
	            result += pstm.executeUpdate();
	        }
	        
	    } catch(Exception e) {
	        System.out.println("삭제 실패 : " + e.getMessage());
	    } finally {
	        close();
	    }
	    return result;
	}

}
