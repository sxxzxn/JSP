package net.fullstack7.comment;

import java.time.LocalDateTime;

public class CommentDTO {
	private int commentId; // 댓글 ID
    private String writerId; // 댓글 작성자의 사용자 ID
    private LocalDateTime regDate; // 댓글 작성일
    private int bbsIdx; // 댓글이 속한 게시판의 ID
    private String contents; // 댓글 내용
    private int pId; // 댓글 내용
    
    
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public LocalDateTime getRegDate() {
		return regDate;
	}
	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}
	public int getBbsIdx() {
		return bbsIdx;
	}
	public void setBbsIdx(int bbsIdx) {
		this.bbsIdx = bbsIdx;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
}
