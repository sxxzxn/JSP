package project.dao;

import java.util.List;

import project.dto.Notice;

public interface NoticeDAO {
	List<Notice> getAllNoticeList();
	Notice getNoticeByNoticeid(int noticeid);
	int writeNotice(String title, String contents, String writer_uid);
	int updateNotice(int noticeid, String title, String contents);
	int deleteNotice(int noticeid);
	int deleteNotices(String deleteNotices);
	List<Notice> findRecent5();
	void increaseViews(int noticeid);
	String getAllNoticePrintAdmin();
	String getAllNoticePrint();
	int fixNotice(int noticeid, String doYN);
}