package project.dao;

import java.util.List;

import project.dto.Board;

public interface BoardDAO {
	List<Board> getAllBoardList();
	Board getBoardByBoardid(int boardid);
	public int writeBoard(String title, String contents, String writer_uid);
	int updateBoard(int boardid, String title, String contents);
	int deleteBoard(int boardid);
	int deleteBoards(String deleteBoards);
	List<Board> findRecent5();
	void increaseViews(int boardid);
	String getAllBoardPrintAdmin();
	String getAllBoardPrint();
}