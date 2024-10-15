package net.fullstack7.comment;

import java.util.ArrayList;
import java.util.List;

import net.fullstack7.common.DBConnPool;

public class CommentDAO extends DBConnPool {
	
	// 댓글 등록
	public int commentRegist(CommentDTO dto) {
		System.out.println("댓글 등록 시작 DAO");
		String sql = "INSERT INTO tbl_comment(writerId, bbsIdx, contents, pId) VALUES (?, ?, ?, ?) ";
		int row = 0;
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getWriterId());
			pstm.setInt(2, dto.getBbsIdx());
			pstm.setString(3, dto.getContents());
			pstm.setString(4, dto.getpId());
			
			row = pstm.executeUpdate();
			
			if( row > 0 ) {
				System.out.println("글작성완료");
			}else {
				System.out.println("글작성실패"+dto.getWriterId());
			}
		}catch(Exception e) {
			System.out.println("댓글 등록 중 예외 발생: " + e.getMessage());
			e.getMessage();
		}
		return row;
	}
	
	// 댓글 수정
	public int commentModify(CommentDTO dto) {
		System.out.println("댓글 수정 시작 DAO");
		int row = 0;
		String sql = "UPDATE tbl_comment SET contents = ? WHERE commentId = ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getContents());
			pstm.setInt(2, dto.getCommentId());
			
            row = pstm.executeUpdate();
            
			if( row > 0 ) {
				System.out.println("댓글수정");
			}else {
				System.out.println("댓글수정실패"+dto.getWriterId());
			}
        } catch (Exception e) {
            e.printStackTrace();
            e.getMessage();
        } 
		return row;
	}
	
	// 댓글 삭제
	public int commentDelete(CommentDTO dto) {
		System.out.println("댓글 삭제 시작 DAO");
		int row = 0;
		 String sql = "DELETE FROM tbl_comment WHERE commentId = ?";
		 try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, dto.getCommentId());
            row = pstm.executeUpdate();
			
            if( row > 0 ) {
				System.out.println("댓글수정");
			}else {
				System.out.println("댓글수정실패" + dto.getWriterId());
			} 
	        } catch (Exception e) {
	            e.printStackTrace();
	            e.getMessage();
	        } 
		 
		 return row;
	}
	
	
	// 댓글 리스트 출력
	public List<CommentDTO> commentList (int bbsIdx) {
		System.out.println("댓글 리스트 출력 시작 DAO");
	  List<CommentDTO> commentList = new ArrayList<>();
        String sql = "SELECT commentId, writerId, regDate, contents, pId, bbsIdx FROM tbl_comment WHERE bbsIdx = ? ORDER BY pId, regDate";
		
        try {
        	pstm = con.prepareStatement(sql);
        	pstm.setInt(1, bbsIdx);
            rs = pstm.executeQuery();
            
            while (rs.next()) {
                CommentDTO dto = new CommentDTO();
                
                dto.setCommentId(rs.getInt("commentId"));
                dto.setWriterId(rs.getString("writerId"));
                dto.setRegDate(rs.getTimestamp("regDate").toLocalDateTime());
                dto.setContents(rs.getString("contents"));
                dto.setpId(rs.getString("pId"));
                dto.setBbsIdx(rs.getInt("bbsIdx"));
                
                commentList.add(dto);
            }
            System.out.println("bbsIdx: " + bbsIdx);
            System.out.println("Executing query: " + sql);
        } catch (Exception e) {
            e.printStackTrace();
            e.getMessage();
        }
        return commentList;
	}
	
//	// 대댓글 등록
//	public int replyRegist(CommentDTO dto) {
//	    String sql = "INSERT INTO tbl_comment(writerId, bbsIdx, contents, pId) VALUES (?, ?, ?, ?)";
//	    int row = 0;
//	    try {
//	        pstm = con.prepareStatement(sql);
//	        pstm.setString(1, dto.getWriterId());
//	        pstm.setInt(2, dto.getBbsIdx());
//	        pstm.setString(3, dto.getContents());
//	        pstm.setString(4, dto.getpId());  
//
//	        row = pstm.executeUpdate();
//
//	        if( row > 0 ) {
//	            System.out.println("대댓글 작성 완료");
//	        } else {
//	            System.out.println("대댓글 작성 실패: " + dto.getWriterId());
//	        }
//	    } catch(Exception e) {
//	        e.printStackTrace();
//	        e.getMessage();
//	    }
//	    return row;
//	}
}
