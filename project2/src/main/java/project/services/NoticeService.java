package project.services;


import java.util.List;

import project.dao.NoticeDAO;
import project.dao.OracleNoticeDAO;
import project.dto.Notice;

public class NoticeService {
	NoticeDAO noticeDao = new OracleNoticeDAO();
	
	// 최근 게시물 5개 가져오기
	public List<Notice> recent() {
		return noticeDao.findRecent5();
	}
	
	// 특정 게시물 가져오기 (noticeid)
	public Notice getNoticeByNoticeid(int noticeid) {
		return noticeDao.getNoticeByNoticeid(noticeid);
	}
	
	// 게시물 조회수 증가
	public void increaseViews(int noticeid) {
		noticeDao.increaseViews(noticeid);
	}

	// 전체 게시물 가져오기 (관리자용)
	public String allNoticePrintAdmin() {
		return noticeDao.getAllNoticePrintAdmin();
	}
	
	// 전체 게시물 가져오기
	public String allNoticePrint() {
		return noticeDao.getAllNoticePrint();
	}
	
	// 글 작성
	public int write(String title, String contents, String writer_uid) {
		return noticeDao.writeNotice(title, contents, writer_uid);
	}
	
	// 글 수정
	public int update(int noticeid, String title, String contents) {
		return noticeDao.updateNotice(noticeid, title, contents);
	}
	
	// 글 수정
	public int delete(int noticeid) {
		return noticeDao.deleteNotice(noticeid);
	}
	
	// 선택 글 삭제 (관리자)
	public int deletes(String deleteNotices) {
		return noticeDao.deleteNotices(deleteNotices);
	}
	
	// 글 고정 (관리자)
	public int fix(int noticeid, String doYN) {
		return noticeDao.fixNotice(noticeid, doYN);
	}
}