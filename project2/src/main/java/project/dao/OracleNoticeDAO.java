package project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import project.dto.Notice;
import utils.ConnectionHelper;

// 오라클 DAO
public class OracleNoticeDAO implements NoticeDAO {
	
	// 1. Notice 테이블 전체 조회
	@Override
	public List<Notice> getAllNoticeList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		List<Notice> noticeList = new ArrayList<>();
				
		try {
			conn = ConnectionHelper.getConnection("oracle"); 
			sql = "select * from notice where delete_yn = 'N' order by fixed_yn desc, noticeid desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				do {
					Notice notice = new Notice();
					notice.setNoticeid(rs.getInt(1));
					notice.setTitle(rs.getString(2));
					notice.setContents(rs.getString(3));
					notice.setWriter_uid(rs.getString(4));
					notice.setReg_date(rs.getString(5));
					notice.setMod_date(rs.getString(6));
					notice.setView_count(rs.getInt(7));
					notice.setDelete_yn(rs.getString(8));
					notice.setFixed_yn(rs.getString(9));
					noticeList.add(notice);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return noticeList;
	}
	
	// 2. Notice 조건 조회 where noticeid = ?
	@Override
	public Notice getNoticeByNoticeid(int noticeid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Notice notice = new Notice();
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select * from notice where noticeid = ? and delete_yn = 'N'";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeid);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				notice.setNoticeid(rs.getInt(1));
				notice.setTitle(rs.getString(2));
				notice.setContents(rs.getString(3));
				notice.setWriter_uid(rs.getString(4));
				notice.setReg_date(rs.getString(5));
				notice.setMod_date(rs.getString(6));
				notice.setView_count(rs.getInt(7));
				notice.setDelete_yn(rs.getString(8));
				notice.setFixed_yn(rs.getString(9));
			}
			System.out.println("조회한 게시물 : " + notice);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return notice;
	}
	
	// 3. insert (noticeid, title, contents, writer_uid)
	@Override
	public int writeNotice(String title, String contents, String writer_uid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "insert into notice(noticeid, title, contents, writer_uid) values(seq_notice.nextval, ?, ?, ?)";
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

	// 4. update (title, contents, mod_date) 조건 where noticeid = ?
	@Override
	public int updateNotice(int noticeid, String title, String contents) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "update notice set title = ?, contents = ?, mod_date = sysdate where noticeid = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, title);
			pstmt.setString(2, contents);
			pstmt.setInt(3, noticeid);
			
			row = pstmt.executeUpdate();
			
			if (row > 0) System.out.println(noticeid + "번 글 수정 완료");
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
	public int deleteNotice(int noticeid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "update notice set delete_yn = 'Y' where noticeid = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, noticeid);
			
			row = pstmt.executeUpdate();
			
			if (row > 0) {
				System.out.println(noticeid + "번 글 삭제 완료");
			}
			else System.out.println("글 삭제 실패");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return row;
	}

	// 5-2. 선택 글 삭제 update set delete_yn = ? (실질적 삭제 X)
	@Override
	public int deleteNotices(String deleteNotices) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "update notice set delete_yn = 'Y' where noticeid in(" + deleteNotices + ")";
			pstmt = conn.prepareStatement(sql);

			row = pstmt.executeUpdate();
			
			if (row > 0) {
				System.out.println(deleteNotices + "번 글 삭제 완료");
			}
			else System.out.println("글 삭제 실패");
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
	public List<Notice> findRecent5() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		List<Notice> noticeList = new ArrayList<>();
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select * from (select * from notice where delete_yn = 'N' order by fixed_yn desc, noticeid desc) where rownum <= 5";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				do {
					Notice notice = new Notice();
					notice.setNoticeid(rs.getInt(1));
					notice.setTitle(rs.getString(2));
					notice.setContents(rs.getString(3));
					notice.setWriter_uid(rs.getString(4));
					notice.setReg_date(rs.getString(5));
					notice.setMod_date(rs.getString(6));
					notice.setView_count(rs.getInt(7));
					notice.setDelete_yn(rs.getString(8));
					notice.setFixed_yn(rs.getString(9));
					noticeList.add(notice);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return noticeList;
	}
	
	// 조회수 증가
	@Override
	public void increaseViews(int noticeid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "update notice set view_count = view_count + 1 where noticeid = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, noticeid);
			
			row = pstmt.executeUpdate();
			
			if (row > 0) {
				System.out.println(noticeid + "번 글 조회수 + 1");
			}
			else System.out.println("조회수 증가 실패");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
	}

	// 전체 글 조회 (관리자)
	String table = "";
	@Override
	public String getAllNoticePrintAdmin() {
		List<Notice> noticeList = getAllNoticeList();
		
		noticeList.stream().forEach(m -> {
			if (m.getFixed_yn().equals("Y")) {
				table += "<tr class='fixed'><td>" + "<input type='checkbox' value='" + m.getNoticeid() + "'>" + "</td><td><a href='detailNotice.jsp?noticeid=" + m.getNoticeid() + "'>" + m.getTitle() + "</a></td><td>" + m.getWriter_uid() + "</td><td>" + m.getReg_date() + "</td><td>" + m.getView_count() + "</td></tr>";
			} else {
				table += "<tr><td>" + "<input type='checkbox' value='" + m.getNoticeid() + "'>" + "</td><td><a href='detailNotice.jsp?noticeid=" + m.getNoticeid() + "'>" + m.getTitle() + "</a></td><td>" + m.getWriter_uid() + "</td><td>" + m.getReg_date() + "</td><td>" + m.getView_count() + "</td></tr>";
			}
		});
		
		return table;
	}

	// 전체 글 조회 (일반)
	@Override
	public String getAllNoticePrint() {
		List<Notice> noticeList = getAllNoticeList();
		
		noticeList.stream().forEach(m -> {
			table += "<tr><td><a href='detailNotice.jsp?noticeid=" + m.getNoticeid() + "'>" + m.getTitle() + "</a></td><td>" + m.getWriter_uid() + "</td><td>" + m.getReg_date() + "</td><td>" + m.getView_count() + "</td></tr>";
		});
		
		return table;
	}

	// 글 고정 update set fixed_yn = ? (실질적 삭제 X)
	@Override
	public int fixNotice(int noticeid, String doYN) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "update notice set fixed_yn = '" + doYN + "' where noticeid = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, noticeid);
			
			row = pstmt.executeUpdate();
			
			if (row > 0) {
				System.out.println(noticeid + "번 글 고정(해제) 완료");
			}
			else System.out.println("글 고정(해제) 실패");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return row;
	}
}