package project.services;


import java.util.List;

import project.dao.BoardDAO;
import project.dao.OracleBoardDAO;
import project.dto.Board;

public class BoardService {
	BoardDAO boardDao = new OracleBoardDAO();
	
	// 최근 게시물 5개 가져오기
	public List<Board> recent() {
		return boardDao.findRecent5();
	}
	
	// 특정 게시물 가져오기 (boardid)
	public Board getBoardByBoardid(int boardid) {
		return boardDao.getBoardByBoardid(boardid);
	}
	
	// 게시물 조회수 증가
	public void increaseViews(int boardid) {
		boardDao.increaseViews(boardid);
	}
	
	// 전체 게시물 가져오기 (관리자용)
	public String allBoardPrintAdmin() {
		return boardDao.getAllBoardPrintAdmin();
	}
	
	// 전체 게시물 가져오기
	public String allBoardPrint() {
		return boardDao.getAllBoardPrint();
	}
	
	// 글 작성
	public int write(String title, String contents, String writer_uid) {
		return boardDao.writeBoard(title, contents, writer_uid);
	}
	
	// 글 수정
	public int update(int boardid, String title, String contents) {
		return boardDao.updateBoard(boardid, title, contents);
	}
	
	// 글 삭제
	public int delete(int boardid) {
		return boardDao.deleteBoard(boardid);
	}
	
	// 선택 글 삭제 (관리자)
 	public int deletes(String deleteBoards) {
		return boardDao.deleteBoards(deleteBoards);
	}
}