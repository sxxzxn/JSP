package project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import project.dto.Board;
import utils.ConnectionHelper;

// 오라클 DAO
public class OracleBoardDAO implements BoardDAO {
	
	// 1. Board 테이블 전체 조회
	@Override
	public List<Board> getAllBoardList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		List<Board> boardList = new ArrayList<>();
				
		try {
			conn = ConnectionHelper.getConnection("oracle"); 
			sql = "select * from board where delete_yn = 'N' order by boardid desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				do {
					Board board = new Board();
					board.setBoardid(rs.getInt(1));
					board.setTitle(rs.getString(2));
					board.setContents(rs.getString(3));
					board.setWriter_uid(rs.getString(4));
					board.setReg_date(rs.getString(5));
					board.setMod_date(rs.getString(6));
					board.setView_count(rs.getInt(7));
					board.setDelete_yn(rs.getString(8));
					boardList.add(board);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return boardList;
	}
	
	// 2. Board 조건 조회 where boardid = ?
	@Override
	public Board getBoardByBoardid(int boardid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Board board = new Board();
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select * from board where boardid = ? and delete_yn = 'N'";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardid);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				board.setBoardid(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setContents(rs.getString(3));
				board.setWriter_uid(rs.getString(4));
				board.setReg_date(rs.getString(5));
				board.setMod_date(rs.getString(6));
				board.setView_count(rs.getInt(7));
				board.setDelete_yn(rs.getString(8));
			}
			System.out.println("조회한 게시물 : " + board);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return board;
	}
	
	// 3. insert (title, contents, writer_uid)
	@Override
	public int writeBoard(String title, String contents, String writer_uid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "insert into board(boardid, title, contents, writer_uid) values(seq_board.nextval, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, contents);
			pstmt.setString(3, writer_uid);
			
			row = pstmt.executeUpdate();
			
			if (row > 0) System.out.println("글 작성 완료");
			else System.out.println("글 작성 실패");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return row;
	}

	// 4. update (title, contents, mod_date) 조건 where boardid = ?
	@Override
	public int updateBoard(int boardid, String title, String contents) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "update board set title = ?, contents = ?, mod_date = sysdate where boardid = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, title);
			pstmt.setString(2, contents);
			pstmt.setInt(3, boardid);
			
			row = pstmt.executeUpdate();
			
			if (row > 0) System.out.println(boardid + "번 글 수정 완료");
			else System.out.println("글 수정 실패");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return row;
	}

	// 5. update set delete_yn = ? (실질적 삭제 X)
	@Override
	public int deleteBoard(int boardid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "update board set delete_yn = 'Y' where boardid = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardid);
			
			row = pstmt.executeUpdate();
			
			if (row > 0) {
				System.out.println(boardid + "번 글 삭제 처리 완료");
			}
			else System.out.println("글 삭제 처리 실패");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return row;
	}

	// 5-2. 선택한 여러 글 삭제 update set delete_yn = ? (실질적 삭제 X)
	@Override
	public int deleteBoards(String deleteBoards) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "update board set delete_yn = 'Y' where boardid in(" + deleteBoards + ")";
			pstmt = conn.prepareStatement(sql);

			row = pstmt.executeUpdate();
			
			if (row > 0) {
				System.out.println(deleteBoards + "번 글 삭제 처리 완료");
			}
			else System.out.println("선택 글 삭제 처리 실패");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return row;
	}
	
	// 최근 글 5개 조회
	@Override
	public List<Board> findRecent5() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		List<Board> boardList = new ArrayList<>();
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select * from (select * from board where delete_yn = 'N' order by boardid desc) where rownum <= 5";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				do {
					Board board = new Board();
					board.setBoardid(rs.getInt(1));
					board.setTitle(rs.getString(2));
					board.setContents(rs.getString(3));
					board.setWriter_uid(rs.getString(4));
					board.setReg_date(rs.getString(5));
					board.setMod_date(rs.getString(6));
					board.setView_count(rs.getInt(7));
					board.setDelete_yn(rs.getString(8));
					boardList.add(board);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return boardList;
	}
	
	// 조회수 증가
	@Override
	public void increaseViews(int boardid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "update board set view_count = view_count + 1 where boardid = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardid);
			
			row = pstmt.executeUpdate();
			
			if (row > 0) {
				System.out.println(boardid + "번 글 조회수 + 1");
			}
			else System.out.println("조회수 증가 실패");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
	}
	
	// 전체 게시물 조회 (관리자)
	String table = "";
	@Override
	public String getAllBoardPrintAdmin() {
		List<Board> boardList = getAllBoardList();
		
		boardList.stream().forEach(m -> {
			table += "<tr><td>" + "<input type='checkbox' value='" + m.getBoardid() + "'>" + "</td><td><a href='detailBoard.jsp?boardid=" + m.getBoardid() + "'>" + m.getTitle() + "</a></td><td>" + m.getWriter_uid() + "</td><td>" + m.getReg_date() + "</td><td>" + m.getView_count() + "</td></tr>";
		});
		
		return table;
	}

	// 전체 게시물 조회 (일반)
	@Override
	public String getAllBoardPrint() {
		List<Board> boardList = getAllBoardList();
		
		boardList.stream().forEach(m -> {
			table += "<tr><td><a href='detailBoard.jsp?boardid=" + m.getBoardid() + "'>" + m.getTitle() + "</a></td><td>" + m.getWriter_uid() + "</td><td>" + m.getReg_date() + "</td><td>" + m.getView_count() + "</td></tr>";
		});
		
		return table;
	}
}